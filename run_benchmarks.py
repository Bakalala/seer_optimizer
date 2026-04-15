#!/usr/bin/env python3
"""
Datapath benchmark harness for the Rust optimizer core.

Builds arithmetic-only IR graphs, runs the Rust binary via JSON stdin/stdout,
and records weighted, constrained, and Pareto extraction results.
"""

from __future__ import annotations

import argparse
import csv
import html
import json
import platform
import subprocess
from statistics import mean
from pathlib import Path
from typing import Callable, Dict, Iterable, List


ROOT = Path(__file__).resolve().parent
MANIFEST_PATH = ROOT / "rust_core" / "Cargo.toml"
BINARY_PATH = ROOT / "rust_core" / "target" / "debug" / "rust_core"
DEFAULT_CONFIG_PATH = ROOT / "benchmark_config.json"
DEFAULT_COST_MODEL_PATH = ROOT / "cost_model.json"
DEFAULT_LIMITS = {
    "iter_limit": 12,
    "node_limit": 12_000,
    "time_limit_ms": 800,
}
DEFAULT_RESULTS_PATH = ROOT / "outputs" / "benchmark_results.json"
DEFAULT_SIZE_SWEEP_RESULTS_PATH = ROOT / "outputs" / "size_sweep_results.json"
DEFAULT_REPORT_PATH = ROOT / "outputs" / "report.html"
DEFAULT_ANALYSIS_PATH = ROOT / "outputs" / "analysis.md"
DEFAULT_SUMMARY_CSV_PATH = ROOT / "outputs" / "benchmark_summary.csv"
DEFAULT_COST_MODEL_CSV_PATH = ROOT / "outputs" / "cost_model_table.csv"
DEFAULT_COST_MODEL_MARKDOWN_PATH = ROOT / "outputs" / "cost_model_table.md"
DEFAULT_COST_MODEL_JSON_PATH = ROOT / "outputs" / "cost_model_table.json"
DEFAULT_BASELINE_CONSTRAINT_CSV_PATH = ROOT / "outputs" / "baseline_constraints.csv"
DEFAULT_BASELINE_CONSTRAINT_MARKDOWN_PATH = ROOT / "outputs" / "baseline_constraints.md"
DEFAULT_BASELINE_CONSTRAINT_JSON_PATH = ROOT / "outputs" / "baseline_constraints.json"
DEFAULT_MAIN_COMPARISON_CSV_PATH = ROOT / "outputs" / "main_comparison_table.csv"
DEFAULT_MAIN_COMPARISON_MARKDOWN_PATH = ROOT / "outputs" / "main_comparison_table.md"
DEFAULT_MAIN_COMPARISON_JSON_PATH = ROOT / "outputs" / "main_comparison_table.json"
DEFAULT_PAPER_FIGURES_DIR = ROOT / "report" / "figures"
SIZE_SWEEP_FAMILY_SIZES = {
    "fir": [4, 8, 16, 32],
    "dot": [8, 16, 32, 64],
}
WEIGHT_SWEEP = [
    (8.0, 1.0, 0.0),
    (2.0, 1.0, 0.0),
    (1.0, 1.0, 0.0),
    (1.0, 1.0, 1.0),
    (1.0, 4.0, 0.0),
]
DEFAULT_BUDGET_PROFILES = {
    "latency_under_area": {"area_max_mode": "original_area"},
    "area_under_latency": {"latency_max_mode": "original_latency"},
    "latency_under_power": {"power_max_mode": "original_power"},
    "power_under_latency": {"latency_max_mode": "original_latency"},
    "latency_under_dsp": {"dsp_max": 0},
    "latency_under_lut": {
        "lut_max_by_benchmark": {
            "fir8": 7,
            "dot16": 15,
            "gemm_k8": 7,
            "gemm_blocked_k8": 7,
            "conv3x3": 8,
            "stencil5": 4,
        }
    },
}
DEFAULT_DSP_BUDGET_SWEEP = {
    "enabled": True,
    "start": 0,
    "stop_mode": "dsp_eligible_op_count",
    "step": 1,
}
_OPTIMIZER_READY = False


def default_weights() -> dict:
    return {"w_area": 1.0, "w_latency": 1.0, "w_power": 0.0}


def make_weights(w_area: float = 1.0, w_latency: float = 1.0, w_power: float = 0.0) -> dict:
    return {
        "w_area": float(w_area),
        "w_latency": float(w_latency),
        "w_power": float(w_power),
    }


def metric_value(metrics: dict | None, key: str, default: int | str = 0) -> int | str:
    if not metrics:
        return default
    value = metrics.get(key, default)
    if value == "":
        return default
    return value


def load_cost_model(path: Path | None = None) -> dict:
    cost_model_path = path or DEFAULT_COST_MODEL_PATH
    raw = json.loads(cost_model_path.read_text())
    if "ops" not in raw:
        raise ValueError(f"cost model {cost_model_path} is missing an 'ops' table")
    return {
        "path": str(cost_model_path),
        "baseline_multiply_mapping_policy": raw["baseline_multiply_mapping_policy"],
        "ops": raw["ops"],
    }


SHARED_COST_MODEL = load_cost_model()
SHARED_OP_METRICS = SHARED_COST_MODEL["ops"]
OP_DISPLAY_ORDER = [
    "input",
    "const",
    "add",
    "add_lut",
    "add_dsp",
    "sub",
    "sub_lut",
    "sub_dsp",
    "mul",
    "mul_lut",
    "mul_dsp",
    "mac_dsp",
]
OP_ROLES = {
    "input": "leaf value",
    "const": "leaf constant",
    "add": "generic add baseline",
    "add_lut": "LUT-bound add candidate",
    "add_dsp": "DSP-bound add candidate",
    "sub": "generic subtract baseline",
    "sub_lut": "LUT-bound subtract candidate",
    "sub_dsp": "DSP-bound subtract candidate",
    "mul": "generic multiply baseline",
    "mul_lut": "LUT-bound multiply candidate",
    "mul_dsp": "DSP-bound multiply candidate",
    "mac_dsp": "fused DSP multiply-accumulate candidate",
}
METRIC_FORMULAS = {
    "area": "sum(child.area) + op.area",
    "latency": "max(child.latency) + op.latency",
    "power": "sum(child.power) + op.power",
    "dsp_count": "sum(child.dsp_count) + op.dsp_count",
    "lut_count": "sum(child.lut_count) + op.lut_count",
}


class IrBuilder:
    def __init__(self) -> None:
        self.nodes: List[dict] = []
        self._next_id = 0

    def input(self, name: str) -> str:
        return self._push("input", name=name)

    def const(self, value: int) -> str:
        return self._push("const", value=value)

    def add(self, left: str, right: str) -> str:
        return self._push("add", inputs=[left, right])

    def sub(self, left: str, right: str) -> str:
        return self._push("sub", inputs=[left, right])

    def mul(self, left: str, right: str) -> str:
        return self._push("mul", inputs=[left, right])

    def graph(self, root: str) -> dict:
        return {"ir_nodes": self.nodes, "root": root}

    def _push(
        self,
        op: str,
        *,
        inputs: List[str] | None = None,
        name: str | None = None,
        value: int | None = None,
    ) -> str:
        node_id = f"n{self._next_id}"
        self._next_id += 1
        node = {"id": node_id, "op": op}
        if name is not None:
            node["name"] = name
        if value is not None:
            node["value"] = value
        if inputs:
            node["inputs"] = inputs
        self.nodes.append(node)
        return node_id


def left_fold_sum(builder: IrBuilder, terms: Iterable[str]) -> str:
    term_list = list(terms)
    if not term_list:
        raise ValueError("cannot sum an empty term list")
    acc = term_list[0]
    for term in term_list[1:]:
        acc = builder.add(acc, term)
    return acc


def blocked_sum(builder: IrBuilder, terms: Iterable[str], block_size: int) -> str:
    term_list = list(terms)
    if not term_list:
        raise ValueError("cannot sum an empty term list")
    if block_size <= 0:
        raise ValueError("block_size must be positive")
    partials = [
        left_fold_sum(builder, term_list[idx : idx + block_size])
        for idx in range(0, len(term_list), block_size)
    ]
    if len(partials) == 1:
        return partials[0]
    return left_fold_sum(builder, partials)


def build_smoke_cases() -> Dict[str, dict]:
    return {
        "identity_mul_add": _build_identity_mul_add(),
        "mul_two": _build_mul_two(),
        "sub_self": _build_sub_self(),
    }


def build_acceptance_benchmarks() -> Dict[str, dict]:
    return {
        "fir8": _build_fir8(),
        "dot16": _build_dot16(),
        "gemm_k8": _build_gemm_k8(),
        "gemm_blocked_k8": _build_gemm_blocked_k8(),
        "conv3x3": _build_conv3x3(),
        "stencil5": _build_stencil5(),
    }


def build_size_sweep_benchmark_families() -> Dict[str, Dict[int, dict]]:
    return {
        "fir": {size: build_fir_benchmark(size) for size in SIZE_SWEEP_FAMILY_SIZES["fir"]},
        "dot": {size: build_dot_product_benchmark(size) for size in SIZE_SWEEP_FAMILY_SIZES["dot"]},
    }


def build_fir_benchmark(taps: int) -> dict:
    if taps <= 0:
        raise ValueError("FIR benchmark must have at least one tap")
    builder = IrBuilder()
    coeffs = [min(idx + 1, taps - idx) for idx in range(taps)]
    terms = []
    for idx, coeff in enumerate(coeffs):
        sample = builder.input(f"x{idx}")
        weight = builder.const(coeff)
        terms.append(builder.mul(weight, sample))
    return builder.graph(left_fold_sum(builder, terms))


def build_dot_product_benchmark(length: int) -> dict:
    if length <= 0:
        raise ValueError("dot-product benchmark must have positive length")
    builder = IrBuilder()
    terms = []
    for idx in range(length):
        left = builder.input(f"a{idx}")
        right = builder.input(f"b{idx}")
        terms.append(builder.mul(left, right))
    return builder.graph(left_fold_sum(builder, terms))


def _build_identity_mul_add() -> dict:
    builder = IrBuilder()
    x = builder.input("x")
    zero = builder.const(0)
    one = builder.const(1)
    total = builder.add(x, zero)
    root = builder.mul(total, one)
    return builder.graph(root)


def _build_mul_two() -> dict:
    builder = IrBuilder()
    x = builder.input("x")
    two = builder.const(2)
    root = builder.mul(x, two)
    return builder.graph(root)


def _build_sub_self() -> dict:
    builder = IrBuilder()
    x = builder.input("x")
    root = builder.sub(x, x)
    return builder.graph(root)


def _build_fir8() -> dict:
    return build_fir_benchmark(8)


def _build_dot16() -> dict:
    return build_dot_product_benchmark(16)


def _build_gemm_k8() -> dict:
    builder = IrBuilder()
    terms = []
    for idx in range(8):
        left = builder.input(f"A{idx}")
        right = builder.input(f"B{idx}")
        terms.append(builder.mul(left, right))
    return builder.graph(left_fold_sum(builder, terms))


def _build_gemm_blocked_k8() -> dict:
    builder = IrBuilder()
    terms = []
    for idx in range(8):
        left = builder.input(f"BA{idx}")
        right = builder.input(f"BB{idx}")
        terms.append(builder.mul(left, right))
    return builder.graph(blocked_sum(builder, terms, block_size=4))


def _build_conv3x3() -> dict:
    builder = IrBuilder()
    kernel = [
        [1, 2, 1],
        [2, 4, 2],
        [1, 2, 1],
    ]
    terms = []
    for row in range(3):
        for col in range(3):
            pixel = builder.input(f"p{row}{col}")
            weight = builder.const(kernel[row][col])
            terms.append(builder.mul(weight, pixel))
    return builder.graph(left_fold_sum(builder, terms))


def _build_stencil5() -> dict:
    builder = IrBuilder()
    center = builder.input("center")
    north = builder.input("north")
    south = builder.input("south")
    east = builder.input("east")
    west = builder.input("west")

    four = builder.const(4)
    minus_one = builder.const(-1)

    terms = [
        builder.mul(four, center),
        builder.mul(minus_one, north),
        builder.mul(minus_one, south),
        builder.mul(minus_one, east),
        builder.mul(minus_one, west),
    ]
    return builder.graph(left_fold_sum(builder, terms))


def ensure_optimizer_binary() -> Path:
    global _OPTIMIZER_READY
    if not _OPTIMIZER_READY:
        subprocess.run(
            ["cargo", "build", "--manifest-path", str(MANIFEST_PATH)],
            cwd=ROOT,
            check=True,
        )
        _OPTIMIZER_READY = True
    return BINARY_PATH


def tool_version(command: List[str]) -> str:
    try:
        completed = subprocess.run(
            command,
            cwd=ROOT,
            check=True,
            text=True,
            capture_output=True,
        )
    except (FileNotFoundError, subprocess.CalledProcessError):
        return "unavailable"
    return completed.stdout.strip() or completed.stderr.strip() or "unavailable"


def capture_environment_metadata() -> dict:
    return {
        "platform": platform.platform(),
        "machine": platform.machine(),
        "processor": platform.processor() or "unknown",
        "python_version": platform.python_version(),
        "rustc_version": tool_version(["rustc", "--version"]),
        "cargo_version": tool_version(["cargo", "--version"]),
    }


def load_benchmark_config(path: Path | None = None) -> dict:
    config_path = path or DEFAULT_CONFIG_PATH
    if config_path.exists():
        raw = json.loads(config_path.read_text())
    else:
        raw = {}
    saturation_limits = raw.get("saturation_limits", {})
    weight_sweep = raw.get("weight_sweep", [])
    budget_profiles = raw.get("budget_profiles", DEFAULT_BUDGET_PROFILES)
    dsp_budget_sweep = raw.get("dsp_budget_sweep", DEFAULT_DSP_BUDGET_SWEEP)
    normalized = {
        "baseline_multiply_mapping_policy": SHARED_COST_MODEL["baseline_multiply_mapping_policy"],
        "cost_model_path": SHARED_COST_MODEL["path"],
        "saturation_limits": {
            "iter_limit": int(saturation_limits.get("iter_limit", DEFAULT_LIMITS["iter_limit"])),
            "node_limit": int(saturation_limits.get("node_limit", DEFAULT_LIMITS["node_limit"])),
            "time_limit_ms": int(
                saturation_limits.get("time_limit_ms", DEFAULT_LIMITS["time_limit_ms"])
            ),
        },
        "weight_sweep": [
            (
                float(item["w_area"]),
                float(item["w_latency"]),
                float(item.get("w_power", 0.0)),
            )
            for item in weight_sweep
        ]
        or list(WEIGHT_SWEEP),
        "budget_profiles": json.loads(json.dumps(budget_profiles)),
        "dsp_budget_sweep": {
            "enabled": bool(dsp_budget_sweep.get("enabled", DEFAULT_DSP_BUDGET_SWEEP["enabled"])),
            "start": int(dsp_budget_sweep.get("start", DEFAULT_DSP_BUDGET_SWEEP["start"])),
            "stop_mode": dsp_budget_sweep.get(
                "stop_mode",
                DEFAULT_DSP_BUDGET_SWEEP["stop_mode"],
            ),
            "step": int(dsp_budget_sweep.get("step", DEFAULT_DSP_BUDGET_SWEEP["step"])),
        },
        "config_path": str(config_path),
    }
    return normalized


def cost_model_rows() -> List[dict]:
    ordered_ops = [op for op in OP_DISPLAY_ORDER if op in SHARED_OP_METRICS]
    ordered_ops.extend(sorted(set(SHARED_OP_METRICS) - set(ordered_ops)))
    rows = []
    for op in ordered_ops:
        metrics = SHARED_OP_METRICS[op]
        rows.append(
            {
                "operation": op,
                "area": metrics["area"],
                "latency": metrics["latency"],
                "power": metrics["power"],
                "dsp_count": metrics["dsp_count"],
                "lut_count": metrics["lut_count"],
                "role": OP_ROLES.get(op, "cost-model operation"),
            }
        )
    return rows


def write_cost_model_artifacts(
    *,
    csv_path: Path = DEFAULT_COST_MODEL_CSV_PATH,
    markdown_path: Path = DEFAULT_COST_MODEL_MARKDOWN_PATH,
    json_path: Path = DEFAULT_COST_MODEL_JSON_PATH,
) -> dict:
    rows = cost_model_rows()
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    markdown_path.parent.mkdir(parents=True, exist_ok=True)
    json_path.parent.mkdir(parents=True, exist_ok=True)

    with csv_path.open("w", newline="") as handle:
        writer = csv.DictWriter(
            handle,
            fieldnames=[
                "operation",
                "area",
                "latency",
                "power",
                "dsp_count",
                "lut_count",
                "role",
            ],
        )
        writer.writeheader()
        writer.writerows(rows)

    markdown_lines = [
        "# Analytical Cost Model",
        "",
        f"Source: `{SHARED_COST_MODEL['path']}`",
        "",
        "Metric accumulation functions:",
        "",
        f"- `area = {METRIC_FORMULAS['area']}`",
        f"- `latency = {METRIC_FORMULAS['latency']}`",
        f"- `power = {METRIC_FORMULAS['power']}`",
        f"- `dsp_count = {METRIC_FORMULAS['dsp_count']}`",
        f"- `lut_count = {METRIC_FORMULAS['lut_count']}`",
        "",
        "| Operation | Area | Latency | Power | DSP | LUT | Role |",
        "|---|---:|---:|---:|---:|---:|---|",
    ]
    for row in rows:
        markdown_lines.append(
            "| `{operation}` | {area} | {latency} | {power} | {dsp_count} | {lut_count} | {role} |".format(
                **row
            )
        )
    markdown_path.write_text("\n".join(markdown_lines) + "\n")

    json_path.write_text(
        json.dumps(
            {
                "source": SHARED_COST_MODEL["path"],
                "baseline_multiply_mapping_policy": SHARED_COST_MODEL[
                    "baseline_multiply_mapping_policy"
                ],
                "metric_formulas": METRIC_FORMULAS,
                "operations": rows,
            },
            indent=2,
        )
    )

    return {
        "cost_model_csv_path": csv_path,
        "cost_model_markdown_path": markdown_path,
        "cost_model_json_path": json_path,
    }


def metric_tuple(metrics: dict | None) -> str:
    if not metrics:
        return ""
    return "/".join(
        str(metric_value(metrics, key))
        for key in ("area", "latency", "power", "dsp_count", "lut_count")
    )


def budget_value(payload: dict, run_name: str, key: str, default: int | str = "") -> int | str:
    return payload.get("runs", {}).get(run_name, {}).get("applied_budgets", {}).get(key, default)


def baseline_constraint_rows(results: dict) -> List[dict]:
    rows = []
    for name, payload in results["benchmarks"].items():
        original = payload["original_metrics"]
        rows.append(
            {
                "benchmark": name,
                "baseline_a_l_p_d_u": metric_tuple(original),
                "baseline_area": original["area"],
                "baseline_latency": original["latency"],
                "baseline_power": metric_value(original, "power"),
                "baseline_dsp": original["dsp_count"],
                "baseline_lut": original["lut_count"],
                "area_cap": budget_value(payload, "latency_under_area", "area_max"),
                "latency_cap": budget_value(payload, "area_under_latency", "latency_max"),
                "power_cap": budget_value(payload, "latency_under_power", "power_max"),
                "dsp_cap": budget_value(payload, "latency_under_dsp", "dsp_max"),
                "lut_cap": budget_value(payload, "latency_under_lut", "lut_max"),
            }
        )
    return rows


def write_baseline_constraint_artifacts(
    results: dict,
    *,
    csv_path: Path = DEFAULT_BASELINE_CONSTRAINT_CSV_PATH,
    markdown_path: Path = DEFAULT_BASELINE_CONSTRAINT_MARKDOWN_PATH,
    json_path: Path = DEFAULT_BASELINE_CONSTRAINT_JSON_PATH,
) -> dict:
    rows = baseline_constraint_rows(results)
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    markdown_path.parent.mkdir(parents=True, exist_ok=True)
    json_path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = [
        "benchmark",
        "baseline_a_l_p_d_u",
        "baseline_area",
        "baseline_latency",
        "baseline_power",
        "baseline_dsp",
        "baseline_lut",
        "area_cap",
        "latency_cap",
        "power_cap",
        "dsp_cap",
        "lut_cap",
    ]
    with csv_path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

    markdown_lines = [
        "# Baseline Constraints",
        "",
        "`A/L/P/D/U` means area, latency, power, DSP count, LUT count.",
        "",
        "| Benchmark | Baseline A/L/P/D/U | Area cap | Latency cap | Power cap | DSP cap | LUT cap |",
        "|---|---:|---:|---:|---:|---:|---:|",
    ]
    for row in rows:
        markdown_lines.append(
            "| `{benchmark}` | {baseline_a_l_p_d_u} | {area_cap} | {latency_cap} | {power_cap} | {dsp_cap} | {lut_cap} |".format(
                **row
            )
        )
    markdown_path.write_text("\n".join(markdown_lines) + "\n")

    json_path.write_text(
        json.dumps(
            {
                "metric_tuple": "A/L/P/D/U = area/latency/power/dsp_count/lut_count",
                "rows": rows,
            },
            indent=2,
        )
    )

    return {
        "baseline_constraints_csv_path": csv_path,
        "baseline_constraints_markdown_path": markdown_path,
        "baseline_constraints_json_path": json_path,
    }


def main_comparison_rows(results: dict) -> List[dict]:
    rows = []
    for name, payload in results["benchmarks"].items():
        infeasible = [
            display_run_name(run_name)
            for run_name, run in payload["runs"].items()
            if run.get("feasible") is False
        ]
        rows.append(
            {
                "benchmark": name,
                "weighted_a_l_p_d_u": metric_tuple(
                    payload["runs"].get("weighted", {}).get("metrics")
                ),
                "latency_opt_a_l_p_d_u": metric_tuple(
                    payload["runs"].get("latency_unconstrained", {}).get("metrics")
                ),
                "power_opt_a_l_p_d_u": metric_tuple(
                    payload["runs"].get("power_unconstrained", {}).get("metrics")
                ),
                "pareto_points": len(unique_pareto_points(payload)),
                "infeasible_queries": "; ".join(infeasible) if infeasible else "--",
            }
        )
    return rows


def write_main_comparison_artifacts(
    results: dict,
    *,
    csv_path: Path = DEFAULT_MAIN_COMPARISON_CSV_PATH,
    markdown_path: Path = DEFAULT_MAIN_COMPARISON_MARKDOWN_PATH,
    json_path: Path = DEFAULT_MAIN_COMPARISON_JSON_PATH,
) -> dict:
    rows = main_comparison_rows(results)
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    markdown_path.parent.mkdir(parents=True, exist_ok=True)
    json_path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = [
        "benchmark",
        "weighted_a_l_p_d_u",
        "latency_opt_a_l_p_d_u",
        "power_opt_a_l_p_d_u",
        "pareto_points",
        "infeasible_queries",
    ]
    with csv_path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

    markdown_lines = [
        "# Main Comparison Table",
        "",
        "`A/L/P/D/U` means area, latency, power, DSP count, LUT count.",
        "",
        "| Benchmark | Weighted A/L/P/D/U | Latency-opt A/L/P/D/U | Power-opt A/L/P/D/U | Pareto points | Infeasible queries |",
        "|---|---:|---:|---:|---:|---|",
    ]
    for row in rows:
        infeasible_queries = str(row["infeasible_queries"]).replace("|", "\\|")
        markdown_lines.append(
            "| `{benchmark}` | {weighted_a_l_p_d_u} | {latency_opt_a_l_p_d_u} | {power_opt_a_l_p_d_u} | {pareto_points} | {infeasible_queries} |".format(
                **{**row, "infeasible_queries": infeasible_queries}
            )
        )
    markdown_path.write_text("\n".join(markdown_lines) + "\n")

    json_path.write_text(
        json.dumps(
            {
                "metric_tuple": "A/L/P/D/U = area/latency/power/dsp_count/lut_count",
                "rows": rows,
            },
            indent=2,
        )
    )

    return {
        "main_comparison_csv_path": csv_path,
        "main_comparison_markdown_path": markdown_path,
        "main_comparison_json_path": json_path,
    }


def budget_label(budgets: dict | None) -> str:
    if not budgets:
        return "none"
    parts = [f"{key}={value}" for key, value in sorted(budgets.items())]
    return ", ".join(parts)


def run_status(run: dict) -> str:
    if run.get("feasible") is False:
        return "Infeasible"
    if run.get("frontier"):
        return "Frontier"
    if run.get("metrics"):
        return "Feasible"
    return "n/a"


def run_diverged_from(weighted_metrics: dict | None, run: dict) -> str:
    metrics = run.get("metrics")
    if not weighted_metrics or not metrics:
        return "n/a"
    return "Yes" if metrics != weighted_metrics else "No"


def staircase_polyline_points(
    points: List[tuple[int, int]],
    x_pos: Callable[[int], float],
    y_pos: Callable[[int], float],
) -> str:
    if not points:
        return ""
    coords = [(x_pos(points[0][0]), y_pos(points[0][1]))]
    for prev, curr in zip(points, points[1:]):
        coords.append((x_pos(curr[0]), y_pos(prev[1])))
        coords.append((x_pos(curr[0]), y_pos(curr[1])))
    return " ".join(f"{x:.1f},{y:.1f}" for x, y in coords)


def resolve_profile_budgets(name: str, profile: dict, original: dict) -> dict:
    budgets: dict = {}
    if "area_max_mode" in profile:
        if profile["area_max_mode"] != "original_area":
            raise ValueError(f"unsupported area_max_mode {profile['area_max_mode']}")
        budgets["area_max"] = original["area"]
    if "latency_max_mode" in profile:
        if profile["latency_max_mode"] != "original_latency":
            raise ValueError(f"unsupported latency_max_mode {profile['latency_max_mode']}")
        budgets["latency_max"] = original["latency"]
    if "power_max_mode" in profile:
        if profile["power_max_mode"] != "original_power":
            raise ValueError(f"unsupported power_max_mode {profile['power_max_mode']}")
        budgets["power_max"] = original["power"]
    if "dsp_max" in profile:
        budgets["dsp_max"] = int(profile["dsp_max"])
    if "lut_max" in profile:
        budgets["lut_max"] = int(profile["lut_max"])
    if "power_max" in profile:
        budgets["power_max"] = int(profile["power_max"])
    if "lut_max_by_benchmark" in profile:
        lut_map = profile["lut_max_by_benchmark"]
        if name not in lut_map:
            raise ValueError(f"missing LUT cap for benchmark {name}")
        budgets["lut_max"] = int(lut_map[name])
    return budgets


def dsp_eligible_op_count(graph: dict) -> int:
    return sum(
        1
        for node in graph["ir_nodes"]
        if node["op"]
        in {
            "add",
            "add_dsp",
            "add_lut",
            "sub",
            "sub_dsp",
            "sub_lut",
            "mul",
            "mul_dsp",
            "mul_lut",
            "mac_dsp",
        }
    )


def sweep_dsp_budgets(config: dict, graph: dict, original: dict) -> List[int]:
    sweep = config["dsp_budget_sweep"]
    if not sweep["enabled"]:
        return []
    start = sweep["start"]
    step = max(1, sweep["step"])
    if sweep["stop_mode"] == "original_dsp_count":
        stop = original["dsp_count"]
    elif sweep["stop_mode"] == "dsp_eligible_op_count":
        stop = dsp_eligible_op_count(graph)
    else:
        raise ValueError(f"unsupported dsp_budget_sweep stop_mode {sweep['stop_mode']}")
    return list(range(start, stop + 1, step))


def finalize_run(response: dict, *, applied_budgets: dict | None = None, label: str | None = None) -> dict:
    enriched = dict(response)
    enriched["applied_budgets"] = applied_budgets or {}
    if label is not None:
        enriched["label"] = label
    return enriched


def finalize_batch_run(
    response: dict,
    *,
    shared_stats: dict,
    applied_budgets: dict | None = None,
    label: str | None = None,
) -> dict:
    enriched = finalize_run(response, applied_budgets=applied_budgets, label=label)
    enriched["stats"] = dict(shared_stats)
    return enriched


def shared_runtime_ms(stats: dict) -> float:
    if "shared_runtime_us" in stats:
        return float(stats.get("shared_runtime_us", 0)) / 1000.0
    return float(stats.get("runtime_ms", 0))


def phase_runtime_ms(stats: dict, field: str) -> float:
    if field in stats:
        return float(stats.get(field, 0)) / 1000.0
    if field == "saturation_runtime_us":
        return float(stats.get("runtime_ms", 0))
    if field == "frontier_runtime_us":
        return max(
            0.0,
            shared_runtime_ms(stats) - phase_runtime_ms(stats, "saturation_runtime_us"),
        )
    return 0.0


def selection_runtime_ms(run: dict) -> float:
    return float(run.get("selection_runtime_us", 0)) / 1000.0


def run_optimizer(request: dict) -> dict:
    binary = ensure_optimizer_binary()
    completed = subprocess.run(
        [str(binary)],
        cwd=ROOT,
        input=json.dumps(request),
        text=True,
        capture_output=True,
        check=True,
    )
    return json.loads(completed.stdout)


def run_optimizer_batch(request: dict) -> dict:
    binary = ensure_optimizer_binary()
    completed = subprocess.run(
        [str(binary)],
        cwd=ROOT,
        input=json.dumps(request),
        text=True,
        capture_output=True,
        check=True,
    )
    return json.loads(completed.stdout)


def graph_metrics(graph: dict) -> dict:
    nodes = {node["id"]: node for node in graph["ir_nodes"]}
    cache: Dict[str, dict] = {}

    def metrics(node_id: str) -> dict:
        if node_id in cache:
            return cache[node_id]
        node = nodes[node_id]
        op = node["op"]
        op_metrics = SHARED_OP_METRICS.get(op)
        if op_metrics is None:
            raise ValueError(f"unknown op {op}")
        if not node.get("inputs"):
            result = dict(op_metrics)
        else:
            children = [metrics(child_id) for child_id in node["inputs"]]
            result = {
                "area": sum(child["area"] for child in children) + op_metrics["area"],
                "latency": max(child["latency"] for child in children) + op_metrics["latency"],
                "dsp_count": sum(child["dsp_count"] for child in children) + op_metrics["dsp_count"],
                "lut_count": sum(child["lut_count"] for child in children) + op_metrics["lut_count"],
                "power": sum(child["power"] for child in children) + op_metrics["power"],
            }
        cache[node_id] = result
        return result

    return metrics(graph["root"])


def make_request(
    benchmark_name: str,
    graph: dict,
    *,
    mode: str,
    objective: str,
    budgets: dict | None = None,
    weights: dict | None = None,
    saturation_limits: dict | None = None,
) -> dict:
    return {
        "benchmark_name": benchmark_name,
        "ir_nodes": graph["ir_nodes"],
        "root": graph["root"],
        "mode": mode,
        "objective": objective,
        "weights": weights or default_weights(),
        "budgets": budgets or {},
        "saturation_limits": saturation_limits or DEFAULT_LIMITS,
    }


def make_batch_query(
    name: str,
    *,
    mode: str,
    objective: str,
    budgets: dict | None = None,
    weights: dict | None = None,
    label: str | None = None,
) -> dict:
    query = {
        "name": name,
        "mode": mode,
        "objective": objective,
        "weights": weights or default_weights(),
        "budgets": budgets or {},
    }
    if label is not None:
        query["label"] = label
    return query


def make_batch_request(
    benchmark_name: str,
    graph: dict,
    queries: List[dict],
    *,
    saturation_limits: dict | None = None,
) -> dict:
    return {
        "benchmark_name": benchmark_name,
        "ir_nodes": graph["ir_nodes"],
        "root": graph["root"],
        "saturation_limits": saturation_limits or DEFAULT_LIMITS,
        "queries": queries,
    }


def pct_reduction(original: int, new: int) -> float:
    if original == 0:
        return 0.0
    return ((original - new) / original) * 100.0


def pct_change(original: int, new: int) -> float:
    if original == 0:
        return 0.0
    return ((new - original) / original) * 100.0


def safe_run_metrics(run: dict) -> dict | None:
    return run.get("metrics")


def weight_label(weights: dict) -> str:
    if float(weights.get("w_power", 0.0)) == 0.0:
        return f"{weights['w_area']:g}:{weights['w_latency']:g}"
    return f"{weights['w_area']:g}:{weights['w_latency']:g}:{weights['w_power']:g}"


def weight_display_label(weights: dict) -> str:
    return f"Weight {weight_label(weights)}"


def metric_change_text(label: str, original: int, new: int) -> str:
    delta = pct_reduction(original, new)
    if delta > 0:
        return f"{label} {original} -> {new} ({delta:.1f}% reduction)"
    if delta < 0:
        return f"{label} {original} -> {new} ({abs(delta):.1f}% increase)"
    return f"{label} {original} -> {new} (no change)"


def safe_ratio(numerator: int | float, denominator: int | float, default: float = 1.0) -> float:
    if denominator == 0:
        return default
    return float(numerator) / float(denominator)


def clamp(value: float, low: float, high: float) -> float:
    return max(low, min(high, value))


def _hex_to_rgb(color: str) -> tuple[int, int, int]:
    color = color.lstrip("#")
    return tuple(int(color[idx : idx + 2], 16) for idx in (0, 2, 4))


def blend_hex(base: str, target: str, amount: float) -> str:
    amount = clamp(amount, 0.0, 1.0)
    base_rgb = _hex_to_rgb(base)
    target_rgb = _hex_to_rgb(target)
    mixed = tuple(
        round(base_channel + (target_channel - base_channel) * amount)
        for base_channel, target_channel in zip(base_rgb, target_rgb)
    )
    return "#" + "".join(f"{channel:02x}" for channel in mixed)


def benchmark_paper_label(name: str) -> str:
    labels = {
        "fir8": "fir8",
        "dot16": "dot16",
        "gemm_k8": "gemm-k8",
        "gemm_blocked_k8": "blocked-k8",
        "conv3x3": "conv3x3",
        "stencil5": "stencil5",
    }
    return labels.get(name, name)


def benchmark_line_palette() -> dict:
    return {
        "fir8": "#355070",
        "dot16": "#bc4749",
        "gemm_k8": "#577590",
        "gemm_blocked_k8": "#7f5539",
        "conv3x3": "#2a9d8f",
        "stencil5": "#6d597a",
    }


def weight_sweep_entries(payload: dict) -> List[dict]:
    return payload.get("weight_sweep", [])


def dsp_budget_sweep_entries(payload: dict) -> List[dict]:
    return payload.get("dsp_budget_sweep", [])


def unique_weight_sweep_points(payload: dict) -> List[tuple[int, int]]:
    return sorted(
        {
            (entry["response"]["metrics"]["area"], entry["response"]["metrics"]["latency"])
            for entry in weight_sweep_entries(payload)
            if entry.get("response", {}).get("metrics")
        }
    )


def unique_pareto_points(payload: dict) -> List[tuple[int, int]]:
    frontier = payload["runs"]["pareto_2d"].get("frontier", [])
    return sorted(
        {
            (point["metrics"]["area"], point["metrics"]["latency"])
            for point in frontier
        }
    )


def dsp_sweep_latency_points(payload: dict) -> List[tuple[int, int]]:
    points = []
    for entry in dsp_budget_sweep_entries(payload):
        metrics = entry.get("metrics")
        if not metrics:
            continue
        points.append((entry["dsp_max"], metrics["latency"]))
    return sorted(points)


def summarize_group_labels(labels: List[str]) -> str:
    weight_labels = sorted(
        label.removeprefix("Weight ")
        for label in labels
        if label.startswith("Weight ")
    )
    other_labels = [label for label in labels if not label.startswith("Weight ")]
    parts = other_labels[:]
    if weight_labels:
        if len(weight_labels) == 1:
            parts.append(f"Weight {weight_labels[0]}")
        elif len(weight_labels) <= 3:
            parts.append("Weight sweep " + ", ".join(weight_labels))
        else:
            preview = ", ".join(weight_labels[:3])
            parts.append(f"Weight sweep {preview}, ...")
    return " + ".join(parts) if parts else "n/a"


def graph_to_expr_text(graph: dict | None) -> str:
    if not graph:
        return "n/a"
    nodes = {node["id"]: node for node in graph["ir_nodes"]}

    def render(node_id: str) -> str:
        node = nodes[node_id]
        op = node["op"]
        if op == "input":
            return node["name"]
        if op == "const":
            return str(node["value"])
        if op == "mac_dsp":
            acc = render(node["inputs"][0])
            left = render(node["inputs"][1])
            right = render(node["inputs"][2])
            return f"(mac_dsp {acc} {left} {right})"
        left = render(node["inputs"][0])
        right = render(node["inputs"][1])
        if op == "add_dsp":
            return f"({left} +dsp {right})"
        if op == "add_lut":
            return f"({left} +lut {right})"
        if op == "sub_dsp":
            return f"({left} -dsp {right})"
        if op == "sub_lut":
            return f"({left} -lut {right})"
        if op == "mul_dsp":
            return f"({left} *dsp {right})"
        if op == "mul_lut":
            return f"({left} *lut {right})"
        symbol = {"add": "+", "sub": "-", "mul": "*"}[op]
        return f"({left} {symbol} {right})"

    return render(graph["root"])


def graph_to_ir_lines(graph: dict | None) -> List[str]:
    if not graph:
        return ["n/a"]
    lines = []
    for node in graph["ir_nodes"]:
        op = node["op"]
        if op == "input":
            rhs = f'input("{node["name"]}")'
        elif op == "const":
            rhs = f'const({node["value"]})'
        elif op == "add_dsp":
            rhs = f'add_dsp({", ".join(node["inputs"])})'
        elif op == "add_lut":
            rhs = f'add_lut({", ".join(node["inputs"])})'
        elif op == "sub_dsp":
            rhs = f'sub_dsp({", ".join(node["inputs"])})'
        elif op == "sub_lut":
            rhs = f'sub_lut({", ".join(node["inputs"])})'
        elif op == "mul_dsp":
            rhs = f'mul_dsp({", ".join(node["inputs"])})'
        elif op == "mul_lut":
            rhs = f'mul_lut({", ".join(node["inputs"])})'
        elif op == "mac_dsp":
            rhs = f'mac_dsp({", ".join(node["inputs"])})'
        else:
            rhs = f'{op}({", ".join(node["inputs"])})'
        lines.append(f'{node["id"]} = {rhs}')
    lines.append(f'root = {graph["root"]}')
    return lines


def graph_op_counts(graph: dict | None) -> dict:
    counts = {
        "input": 0,
        "const": 0,
        "add": 0,
        "add_dsp": 0,
        "add_lut": 0,
        "sub": 0,
        "sub_dsp": 0,
        "sub_lut": 0,
        "mul": 0,
        "mul_dsp": 0,
        "mul_lut": 0,
        "mac_dsp": 0,
    }
    if not graph:
        return counts
    for node in graph["ir_nodes"]:
        counts[node["op"]] = counts.get(node["op"], 0) + 1
    return counts


def arithmetic_op_count(graph: dict | None) -> int:
    counts = graph_op_counts(graph)
    return sum(
        counts.get(op, 0)
        for op in (
            "add",
            "add_dsp",
            "add_lut",
            "sub",
            "sub_dsp",
            "sub_lut",
            "mul",
            "mul_dsp",
            "mul_lut",
            "mac_dsp",
        )
    )


def display_run_name(name: str) -> str:
    labels = {
        "original": "Original",
        "weighted": "Weighted",
        "latency_unconstrained": "Latency-optimal (no budgets)",
        "power_unconstrained": "Power-optimal (no budgets)",
        "latency_under_area": "min latency | area cap",
        "area_under_latency": "min area | latency cap",
        "latency_under_power": "min latency | power cap",
        "power_under_latency": "min power | latency cap",
        "latency_under_dsp": "min latency | DSP=0",
        "latency_under_lut": "min latency | LUT cap",
        "dsp_budget_sweep": "DSP budget sweep",
        "pareto": "Pareto",
        "pareto_2d": "Pareto 2D",
        "weight_sweep": "Weight sweep",
        "area_reduction": "Area reduction",
        "latency_change": "Latency change",
        "latency_delta": "Latency delta",
        "dsp_reduction": "DSP reduction",
        "power_reduction": "Power reduction",
        "power": "Power",
        "runtime_ms": "Runtime (ms)",
    }
    return labels.get(name, name.replace("_", " ").title())


def chart_palette() -> dict:
    return {
        "original": "#355070",
        "weighted": "#2a9d8f",
        "latency_unconstrained": "#1d3557",
        "power_unconstrained": "#7b2cbf",
        "latency_under_area": "#e9c46a",
        "area_under_latency": "#f4a261",
        "latency_under_power": "#c77dff",
        "power_under_latency": "#4361ee",
        "latency_under_dsp": "#e76f51",
        "latency_under_lut": "#577590",
        "dsp_budget_sweep": "#3a86ff",
        "pareto": "#264653",
        "weight_sweep": "#8d99ae",
    }


def render_horizontal_bar_chart(
    title: str,
    categories: List[str],
    series: List[tuple[str, str, List[float]]],
    *,
    width: int = 560,
) -> str:
    bar_height = 16
    bar_gap = 8
    category_gap = 18
    left_pad = 110
    right_pad = 70
    top_pad = 54
    bottom_pad = 24
    category_block = len(series) * (bar_height + bar_gap) + category_gap
    height = top_pad + bottom_pad + max(len(categories), 1) * category_block
    plot_width = width - left_pad - right_pad
    max_value = max([value for _, _, values in series for value in values], default=1.0)
    max_value = max(max_value, 1.0)
    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="{html.escape(title)}">',
        f'<text x="{width / 2}" y="24" text-anchor="middle" font-size="18" font-weight="700" fill="#102a43">{html.escape(title)}</text>',
        f'<line x1="{left_pad}" y1="{top_pad}" x2="{left_pad}" y2="{height - bottom_pad}" stroke="#9fb3c8" stroke-width="1.2"/>',
    ]

    for tick in range(5):
        tick_value = max_value * (tick + 1) / 5
        x = left_pad + plot_width * (tick + 1) / 5
        lines.append(
            f'<line x1="{x:.1f}" y1="{top_pad}" x2="{x:.1f}" y2="{height - bottom_pad}" stroke="#e6edf3" stroke-width="1"/>'
        )
        lines.append(
            f'<text x="{x:.1f}" y="{height - 6}" text-anchor="middle" font-size="10" fill="#486581">{tick_value:.1f}</text>'
        )

    for category_index, category in enumerate(categories):
        block_y = top_pad + category_index * category_block
        lines.append(
            f'<text x="{left_pad - 12}" y="{block_y + ((len(series) * (bar_height + bar_gap)) / 2):.1f}" text-anchor="end" font-size="12" fill="#243b53">{html.escape(category)}</text>'
        )
        for series_index, (label, color, values) in enumerate(series):
            value = values[category_index]
            y = block_y + series_index * (bar_height + bar_gap)
            bar_width = (value / max_value) * plot_width
            lines.append(
                f'<rect x="{left_pad:.1f}" y="{y:.1f}" width="{bar_width:.1f}" height="{bar_height:.1f}" rx="4" fill="{color}"/>'
            )
            lines.append(
                f'<text x="{left_pad + bar_width + 8:.1f}" y="{y + 12:.1f}" font-size="10" fill="#243b53">{display_run_name(label)}: {value:.1f}</text>'
            )

    legend_x = left_pad
    legend_y = 42
    for label, color, _ in series:
        lines.append(
            f'<rect x="{legend_x}" y="{legend_y - 10}" width="12" height="12" rx="2" fill="{color}"/>'
        )
        lines.append(
            f'<text x="{legend_x + 18}" y="{legend_y}" font-size="12" fill="#243b53">{html.escape(display_run_name(label))}</text>'
        )
        legend_x += 145

    lines.append("</svg>")
    return "".join(lines)


def render_diverging_bar_chart(
    title: str,
    categories: List[str],
    series: List[tuple[str, str, List[float]]],
    *,
    width: int = 560,
) -> str:
    bar_height = 16
    bar_gap = 8
    category_gap = 18
    left_pad = 110
    right_pad = 70
    top_pad = 54
    bottom_pad = 24
    category_block = len(series) * (bar_height + bar_gap) + category_gap
    height = top_pad + bottom_pad + max(len(categories), 1) * category_block
    plot_width = width - left_pad - right_pad
    zero_x = left_pad + plot_width / 2
    max_abs = max([abs(value) for _, _, values in series for value in values], default=1.0)
    max_abs = max(max_abs, 1.0)
    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="{html.escape(title)}">',
        f'<text x="{width / 2}" y="24" text-anchor="middle" font-size="18" font-weight="700" fill="#102a43">{html.escape(title)}</text>',
        f'<line x1="{zero_x:.1f}" y1="{top_pad}" x2="{zero_x:.1f}" y2="{height - bottom_pad}" stroke="#9fb3c8" stroke-width="1.2"/>',
    ]

    for tick in range(-2, 3):
        value = max_abs * tick / 2
        x = zero_x + (value / max_abs) * (plot_width / 2)
        lines.append(
            f'<line x1="{x:.1f}" y1="{top_pad}" x2="{x:.1f}" y2="{height - bottom_pad}" stroke="#e6edf3" stroke-width="1"/>'
        )
        lines.append(
            f'<text x="{x:.1f}" y="{height - 6}" text-anchor="middle" font-size="10" fill="#486581">{value:.1f}</text>'
        )

    for category_index, category in enumerate(categories):
        block_y = top_pad + category_index * category_block
        lines.append(
            f'<text x="{left_pad - 12}" y="{block_y + ((len(series) * (bar_height + bar_gap)) / 2):.1f}" text-anchor="end" font-size="12" fill="#243b53">{html.escape(category)}</text>'
        )
        for series_index, (label, color, values) in enumerate(series):
            value = values[category_index]
            y = block_y + series_index * (bar_height + bar_gap)
            bar_width = abs(value) / max_abs * (plot_width / 2)
            bar_x = zero_x if value >= 0 else zero_x - bar_width
            lines.append(
                f'<rect x="{bar_x:.1f}" y="{y:.1f}" width="{bar_width:.1f}" height="{bar_height:.1f}" rx="4" fill="{color}"/>'
            )
            label_x = zero_x + bar_width + 8 if value >= 0 else zero_x - bar_width - 8
            anchor = "start" if value >= 0 else "end"
            lines.append(
                f'<text x="{label_x:.1f}" y="{y + 12:.1f}" text-anchor="{anchor}" font-size="10" fill="#243b53">{display_run_name(label)}: {value:.1f}</text>'
            )

    legend_x = left_pad
    legend_y = 42
    for label, color, _ in series:
        lines.append(
            f'<rect x="{legend_x}" y="{legend_y - 10}" width="12" height="12" rx="2" fill="{color}"/>'
        )
        lines.append(
            f'<text x="{legend_x + 18}" y="{legend_y}" font-size="12" fill="#243b53">{html.escape(display_run_name(label))}</text>'
        )
        legend_x += 145

    lines.append("</svg>")
    return "".join(lines)


def render_percentage_chart(results: dict, *, width: int = 560) -> str:
    names = list(results["benchmarks"].keys())
    area = []
    latency = []
    dsp = []
    power = []
    for name in names:
        payload = results["benchmarks"][name]
        original = payload["original_metrics"]
        weighted = payload["runs"]["weighted"]["metrics"]
        area.append(pct_reduction(original["area"], weighted["area"]))
        latency.append(pct_reduction(original["latency"], weighted["latency"]))
        dsp.append(pct_reduction(original["dsp_count"], weighted["dsp_count"]))
        power.append(pct_reduction(metric_value(original, "power"), metric_value(weighted, "power")))
    return render_diverging_bar_chart(
        "Weighted Metric Change vs Original (%)",
        names,
        [
            ("area_reduction", "#2a9d8f", area),
            ("latency_change", "#457b9d", latency),
            ("dsp_reduction", "#e76f51", dsp),
            ("power_reduction", "#7b2cbf", power),
        ],
        width=width,
    )


def build_normalized_objective_comparison_svg(
    results: dict,
    *,
    width: int = 1020,
    height: int = 360,
) -> str:
    benchmark_names = list(results["benchmarks"].keys())
    benchmark_labels = [benchmark_paper_label(name) for name in benchmark_names]
    palette = chart_palette()
    methods = [
        ("weighted", "Weighted", palette["weighted"]),
        ("latency_unconstrained", "Latency-opt.", palette["latency_unconstrained"]),
        ("power_unconstrained", "Power-opt.", palette["power_unconstrained"]),
    ]
    metric_specs = [
        ("area", "Area / baseline"),
        ("latency", "Latency / baseline"),
        ("power", "Power / baseline"),
    ]

    ratios: dict[str, dict[str, List[float]]] = {metric: {} for metric, _ in metric_specs}
    for metric, _ in metric_specs:
        for method_name, _, _ in methods:
            values = []
            for benchmark_name in benchmark_names:
                payload = results["benchmarks"][benchmark_name]
                original = payload["original_metrics"][metric]
                current = payload["runs"][method_name]["metrics"][metric]
                values.append(safe_ratio(current, original))
            ratios[metric][method_name] = values

    left_pad = 56
    right_pad = 24
    top_pad = 96
    bottom_pad = 62
    panel_gap = 28
    panel_width = (width - left_pad - right_pad - panel_gap * (len(metric_specs) - 1)) / len(metric_specs)
    plot_height = height - top_pad - bottom_pad
    y_min = 0.0
    y_max = 2.0

    def y_pos(value: float) -> float:
        scaled = (value - y_min) / (y_max - y_min)
        return top_pad + plot_height - scaled * plot_height

    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Cross-benchmark normalized objective comparison">',
        f'<text x="{width / 2}" y="24" text-anchor="middle" font-size="18" font-weight="700" fill="#102a43">Cross-Benchmark Objective Tradeoffs</text>',
        f'<text x="{width / 2}" y="42" text-anchor="middle" font-size="12" fill="#486581">Y-axis reports optimized / baseline ratio (unitless); values below 1.0 are better.</text>',
        f'<text x="18" y="{top_pad + plot_height / 2}" transform="rotate(-90 18 {top_pad + plot_height / 2})" text-anchor="middle" font-size="12" fill="#486581">Metric / baseline</text>',
    ]

    legend_x = (width / 2) - 170
    for label, color in [(label, color) for _, label, color in methods]:
        lines.append(
            f'<rect x="{legend_x}" y="58" width="12" height="12" rx="2" fill="{color}"/>'
        )
        lines.append(
            f'<text x="{legend_x + 18}" y="68" font-size="12" fill="#243b53">{html.escape(label)}</text>'
        )
        legend_x += 118

    for panel_index, (metric_name, panel_title) in enumerate(metric_specs):
        panel_left = left_pad + panel_index * (panel_width + panel_gap)
        panel_right = panel_left + panel_width
        base_y = top_pad + plot_height
        lines.extend(
            [
                f'<text x="{panel_left + panel_width / 2:.1f}" y="86" text-anchor="middle" font-size="13" font-weight="700" fill="#102a43">{html.escape(panel_title)}</text>',
                f'<line x1="{panel_left:.1f}" y1="{base_y:.1f}" x2="{panel_right:.1f}" y2="{base_y:.1f}" stroke="#9fb3c8" stroke-width="1.2"/>',
                f'<line x1="{panel_left:.1f}" y1="{top_pad:.1f}" x2="{panel_left:.1f}" y2="{base_y:.1f}" stroke="#9fb3c8" stroke-width="1.2"/>',
            ]
        )
        for tick in (0.0, 0.5, 1.0, 1.5, 2.0):
            y = y_pos(tick)
            stroke = "#cbd5e1" if abs(tick - 1.0) < 1e-9 else "#e6edf3"
            dash = ' stroke-dasharray="4 4"' if abs(tick - 1.0) < 1e-9 else ""
            lines.append(
                f'<line x1="{panel_left:.1f}" y1="{y:.1f}" x2="{panel_right:.1f}" y2="{y:.1f}" stroke="{stroke}" stroke-width="1"{dash}/>'
            )
            lines.append(
                f'<text x="{panel_left - 8:.1f}" y="{y + 4:.1f}" text-anchor="end" font-size="10" fill="#486581">{tick:.1f}</text>'
            )

        inner_pad = 14
        group_width = (panel_width - 2 * inner_pad) / max(len(benchmark_names), 1)
        bar_width = min(16.0, group_width / 4.2)
        offsets = (-bar_width * 1.2, 0.0, bar_width * 1.2)
        for benchmark_index, benchmark_label in enumerate(benchmark_labels):
            group_center = panel_left + inner_pad + group_width * (benchmark_index + 0.5)
            for method_index, (method_name, _, color) in enumerate(methods):
                ratio = ratios[metric_name][method_name][benchmark_index]
                x = group_center + offsets[method_index] - bar_width / 2
                y = y_pos(ratio)
                bar_height = base_y - y
                lines.append(
                    f'<rect x="{x:.1f}" y="{y:.1f}" width="{bar_width:.1f}" height="{bar_height:.1f}" rx="2" fill="{color}"/>'
                )
            lines.append(
                f'<text x="{group_center:.1f}" y="{base_y + 16:.1f}" text-anchor="middle" font-size="9" fill="#243b53">{html.escape(benchmark_label)}</text>'
            )

    lines.append("</svg>")
    return "".join(lines)


def build_constraint_sensitivity_svg(
    results: dict,
    *,
    width: int = 980,
    height: int = 390,
) -> str:
    benchmark_names = list(results["benchmarks"].keys())
    query_specs = [
        ("latency_under_area", "min Lat\n| Area cap", "latency"),
        ("area_under_latency", "min Area\n| Lat cap", "area"),
        ("latency_under_power", "min Lat\n| Power cap", "latency"),
        ("power_under_latency", "min Power\n| Lat cap", "power"),
        ("latency_under_dsp", "min Lat\n| DSP=0", "latency"),
        ("latency_under_lut", "min Lat\n| LUT cap", "latency"),
    ]

    left_pad = 134
    right_pad = 24
    top_pad = 130
    bottom_pad = 24
    cell_width = (width - left_pad - right_pad) / len(query_specs)
    cell_height = (height - top_pad - bottom_pad) / max(len(benchmark_names), 1)

    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Constraint sensitivity ablation plot">',
        f'<text x="{width / 2}" y="24" text-anchor="middle" font-size="18" font-weight="700" fill="#102a43">Constraint Sensitivity Across Benchmarks</text>',
        f'<text x="{width / 2}" y="44" text-anchor="middle" font-size="12" fill="#486581">Columns are objective | hard constraint; cell text is target-metric improvement vs weighted extraction.</text>',
    ]

    legend_items = [
        ("#e6fffa", "better"),
        ("#f8fafc", "same"),
        ("#fff4e6", "worse"),
        ("#fde2e4", "infeasible"),
    ]
    legend_x = left_pad
    for fill, label in legend_items:
        lines.append(
            f'<rect x="{legend_x}" y="58" width="14" height="14" rx="3" fill="{fill}" stroke="#cbd5e1" stroke-width="1"/>'
        )
        lines.append(
            f'<text x="{legend_x + 20}" y="69" font-size="11" fill="#243b53">{html.escape(label)}</text>'
        )
        legend_x += 98

    for column_index, (_, short_label, _) in enumerate(query_specs):
        x = left_pad + column_index * cell_width
        for line_index, label_line in enumerate(short_label.split("\n")):
            lines.append(
                f'<text x="{x + cell_width / 2:.1f}" y="{top_pad - 34 + (line_index * 15):.1f}" text-anchor="middle" font-size="11" font-weight="700" fill="#243b53">{html.escape(label_line)}</text>'
            )

    for row_index, benchmark_name in enumerate(benchmark_names):
        y = top_pad + row_index * cell_height
        lines.append(
            f'<text x="{left_pad - 10:.1f}" y="{y + cell_height / 2 + 4:.1f}" text-anchor="end" font-size="11" fill="#243b53">{html.escape(benchmark_paper_label(benchmark_name))}</text>'
        )
        payload = results["benchmarks"][benchmark_name]
        weighted = payload["runs"]["weighted"]["metrics"]
        for column_index, (run_name, _, target_metric) in enumerate(query_specs):
            x = left_pad + column_index * cell_width
            run = payload["runs"].get(run_name, {})
            metrics = run.get("metrics")
            if not run.get("feasible", False) or not metrics:
                fill = "#fde2e4"
                stroke = "#d64550"
                label = "inf"
            else:
                delta = pct_reduction(weighted[target_metric], metrics[target_metric])
                if delta > 0:
                    fill = blend_hex("#ffffff", "#b7efc5", max(0.15, min(delta / 60.0, 1.0)))
                elif delta < 0:
                    fill = blend_hex("#ffffff", "#ffd6a5", max(0.15, min(abs(delta) / 60.0, 1.0)))
                else:
                    fill = "#f8fafc"
                stroke = "#cbd5e1"
                label = f"{delta:+.0f}%"
            lines.append(
                f'<rect x="{x + 2:.1f}" y="{y + 2:.1f}" width="{cell_width - 4:.1f}" height="{cell_height - 4:.1f}" rx="6" fill="{fill}" stroke="{stroke}" stroke-width="1"/>'
            )
            lines.append(
                f'<text x="{x + cell_width / 2:.1f}" y="{y + cell_height / 2 + 4:.1f}" text-anchor="middle" font-size="11" font-weight="700" fill="#102a43">{html.escape(label)}</text>'
            )

    lines.append("</svg>")
    return "".join(lines)


def build_suite_dsp_scaling_svg(
    results: dict,
    *,
    width: int = 860,
    height: int = 390,
) -> str:
    benchmark_names = list(results["benchmarks"].keys())
    palette = benchmark_line_palette()
    left_pad = 64
    right_pad = 134
    top_pad = 60
    bottom_pad = 54
    plot_width = width - left_pad - right_pad
    plot_height = height - top_pad - bottom_pad
    x_max = 2.0
    y_min = 0.4
    y_max = 1.4

    def x_pos(value: float) -> float:
        return left_pad + (value / x_max) * plot_width

    def y_pos(value: float) -> float:
        scaled = (value - y_min) / (y_max - y_min)
        return top_pad + plot_height - scaled * plot_height

    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Normalized DSP scaling plot">',
        f'<text x="{width / 2}" y="24" text-anchor="middle" font-size="18" font-weight="700" fill="#102a43">Latency Scaling Under Increasing DSP Budgets</text>',
        f'<text x="{width / 2}" y="42" text-anchor="middle" font-size="12" fill="#486581">X-axis = allowed DSP budget / baseline DSP count; Y-axis = best latency / baseline latency.</text>',
        f'<line x1="{left_pad}" y1="{top_pad + plot_height}" x2="{width - right_pad}" y2="{top_pad + plot_height}" stroke="#9fb3c8" stroke-width="1.2"/>',
        f'<line x1="{left_pad}" y1="{top_pad}" x2="{left_pad}" y2="{top_pad + plot_height}" stroke="#9fb3c8" stroke-width="1.2"/>',
        f'<text x="{left_pad + plot_width / 2}" y="{height - 12}" text-anchor="middle" font-size="12" fill="#486581">Allowed DSP budget / baseline DSP count</text>',
        f'<text x="18" y="{top_pad + plot_height / 2}" transform="rotate(-90 18 {top_pad + plot_height / 2})" text-anchor="middle" font-size="12" fill="#486581">Best latency / baseline latency</text>',
    ]

    for tick in (0.0, 0.5, 1.0, 1.5, 2.0):
        x = x_pos(tick)
        lines.append(
            f'<line x1="{x:.1f}" y1="{top_pad}" x2="{x:.1f}" y2="{top_pad + plot_height}" stroke="#e6edf3" stroke-width="1"/>'
        )
        lines.append(
            f'<text x="{x:.1f}" y="{top_pad + plot_height + 18:.1f}" text-anchor="middle" font-size="10" fill="#486581">{tick:.1f}</text>'
        )
    for tick in (0.4, 0.6, 0.8, 1.0, 1.2, 1.4):
        y = y_pos(tick)
        dash = ' stroke-dasharray="4 4"' if abs(tick - 1.0) < 1e-9 else ""
        lines.append(
            f'<line x1="{left_pad}" y1="{y:.1f}" x2="{left_pad + plot_width}" y2="{y:.1f}" stroke="#e6edf3" stroke-width="1"{dash}/>'
        )
        lines.append(
            f'<text x="{left_pad - 8:.1f}" y="{y + 4:.1f}" text-anchor="end" font-size="10" fill="#486581">{tick:.1f}</text>'
        )

    legend_y = top_pad + 8
    for legend_index, benchmark_name in enumerate(benchmark_names):
        payload = results["benchmarks"][benchmark_name]
        original = payload["original_metrics"]
        points = [
            (
                safe_ratio(entry["dsp_max"], original["dsp_count"], 0.0),
                safe_ratio(entry["metrics"]["latency"], original["latency"], 1.0),
            )
            for entry in payload["dsp_budget_sweep"]
            if entry.get("metrics")
        ]
        color = palette.get(benchmark_name, "#355070")
        polyline = staircase_polyline_points(points, x_pos, y_pos)
        lines.append(
            f'<polyline points="{polyline}" fill="none" stroke="{color}" stroke-width="2.4" stroke-linecap="round"/>'
        )
        for budget_ratio, latency_ratio in points:
            x = x_pos(budget_ratio)
            y = y_pos(latency_ratio)
            lines.append(
                f'<circle cx="{x:.1f}" cy="{y:.1f}" r="2.6" fill="{color}"/>'
            )
        legend_entry_y = legend_y + legend_index * 18
        lines.append(
            f'<line x1="{width - right_pad + 10}" y1="{legend_entry_y:.1f}" x2="{width - right_pad + 34}" y2="{legend_entry_y:.1f}" stroke="{color}" stroke-width="2.6"/>'
        )
        lines.append(
            f'<text x="{width - right_pad + 40}" y="{legend_entry_y + 4:.1f}" font-size="11" fill="#243b53">{html.escape(benchmark_paper_label(benchmark_name))}</text>'
        )

    lines.append("</svg>")
    return "".join(lines)


def build_size_sweep_scaling_svg(
    results: dict,
    *,
    width: int = 1080,
    height: int = 620,
) -> str:
    families = results["families"]
    palette = {"fir": "#355070", "dot": "#bc4749"}
    left_pad = 74
    right_pad = 30
    top_pad = 104
    bottom_pad = 56
    panel_gap_x = 38
    panel_gap_y = 58
    panel_width = (width - left_pad - right_pad - panel_gap_x) / 2
    plot_height = (height - top_pad - bottom_pad - panel_gap_y) / 2
    op_ticks = sorted(
        {
            entry["op_count"]
            for entries in families.values()
            for entry in entries
        }
    )
    min_op_count = min(
        (entry["op_count"] for entries in families.values() for entry in entries),
        default=0,
    )
    max_op_count = max(
        (entry["op_count"] for entries in families.values() for entry in entries),
        default=1,
    )

    def x_pos(panel_left: float, op_count: int) -> float:
        if max_op_count == min_op_count:
            return panel_left + panel_width / 2
        scaled = (op_count - min_op_count) / max(max_op_count - min_op_count, 1)
        return panel_left + scaled * panel_width

    def panel_bounds(values: list[float]) -> tuple[float, float]:
        if not values:
            return (0.0, 1.0)
        value_min = min(values)
        value_max = max(values)
        if value_max <= value_min:
            return (max(0.0, value_min - 1.0), value_max + 1.0)
        padding = max(0.05, (value_max - value_min) * 0.2)
        return (max(0.0, value_min - padding), value_max + padding)

    panel_specs = [
        (
            left_pad,
            top_pad,
            "Equality Saturation Time",
            "Time (ms)",
            lambda entry: phase_runtime_ms(entry["shared_stats"], "saturation_runtime_us"),
        ),
        (
            left_pad + panel_width + panel_gap_x,
            top_pad,
            "Frontier Extraction Time",
            "Time (ms)",
            lambda entry: phase_runtime_ms(entry["shared_stats"], "frontier_runtime_us"),
        ),
        (
            left_pad,
            top_pad + plot_height + panel_gap_y,
            "Constrained Selection Time",
            "Time (ms)",
            lambda entry: selection_runtime_ms(entry.get("latency_under_area", {})),
        ),
        (
            left_pad + panel_width + panel_gap_x,
            top_pad + plot_height + panel_gap_y,
            "End-to-End Time",
            "Time (ms)",
            lambda entry: shared_runtime_ms(entry["shared_stats"])
            + selection_runtime_ms(entry.get("latency_under_area", {})),
        ),
    ]

    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Synthetic size sweep scaling plot">',
        f'<text x="{width / 2}" y="24" text-anchor="middle" font-size="18" font-weight="700" fill="#102a43">Synthetic Size Sweeps: Phase Timing Breakdown</text>',
        f'<text x="{width / 2}" y="44" text-anchor="middle" font-size="12" fill="#486581">FIR-4/8/16/32 and dot-product-8/16/32/64. Shared phases are benchmark preparation; selection uses the min latency | area cap query.</text>',
    ]

    legend_x = width / 2 - 74
    for family_name in ("fir", "dot"):
        lines.append(
            f'<line x1="{legend_x:.1f}" y1="68" x2="{legend_x + 24:.1f}" y2="68" stroke="{palette[family_name]}" stroke-width="3"/>'
        )
        lines.append(
            f'<text x="{legend_x + 32:.1f}" y="72" font-size="12" fill="#243b53">{html.escape(family_name.upper())}</text>'
        )
        legend_x += 88

    for panel_left, panel_top, panel_title, y_label, value_fn in panel_specs:
        panel_right = panel_left + panel_width
        base_y = panel_top + plot_height
        panel_values = [
            value_fn(entry)
            for entries in families.values()
            for entry in entries
        ]
        y_min, y_max = panel_bounds(panel_values)

        def y_pos_fn(value: float) -> float:
            scaled = (value - y_min) / max(y_max - y_min, 1e-9)
            return panel_top + plot_height - scaled * plot_height

        lines.extend(
            [
                f'<text x="{panel_left + panel_width / 2:.1f}" y="{panel_top - 18:.1f}" text-anchor="middle" font-size="13" font-weight="700" fill="#102a43">{html.escape(panel_title)}</text>',
                f'<line x1="{panel_left:.1f}" y1="{base_y:.1f}" x2="{panel_right:.1f}" y2="{base_y:.1f}" stroke="#9fb3c8" stroke-width="1.2"/>',
                f'<line x1="{panel_left:.1f}" y1="{panel_top:.1f}" x2="{panel_left:.1f}" y2="{base_y:.1f}" stroke="#9fb3c8" stroke-width="1.2"/>',
                f'<text x="{panel_left + panel_width / 2:.1f}" y="{panel_top + plot_height + 28:.1f}" text-anchor="middle" font-size="12" fill="#486581">Arithmetic op count (mul + add)</text>',
                f'<text x="{panel_left - 44:.1f}" y="{panel_top + plot_height / 2:.1f}" transform="rotate(-90 {panel_left - 44:.1f} {panel_top + plot_height / 2:.1f})" text-anchor="middle" font-size="11" fill="#486581">{html.escape(y_label)}</text>',
            ]
        )
        for op_value in op_ticks:
            x = x_pos(panel_left, op_value)
            lines.append(
                f'<line x1="{x:.1f}" y1="{panel_top}" x2="{x:.1f}" y2="{base_y}" stroke="#e6edf3" stroke-width="1"/>'
            )
            lines.append(
                f'<text x="{x:.1f}" y="{base_y + 18:.1f}" text-anchor="middle" font-size="10" fill="#486581">{op_value}</text>'
            )
        for tick in range(5):
            y_value = y_min + (y_max - y_min) * tick / 4
            y = panel_top + plot_height - plot_height * tick / 4
            lines.append(
                f'<line x1="{panel_left:.1f}" y1="{y:.1f}" x2="{panel_right:.1f}" y2="{y:.1f}" stroke="#e6edf3" stroke-width="1"/>'
            )
            lines.append(
                f'<text x="{panel_left - 8:.1f}" y="{y + 4:.1f}" text-anchor="end" font-size="10" fill="#486581">{y_value:.1f}</text>'
            )

        for family_name, entries in families.items():
            ordered = sorted(entries, key=lambda entry: entry["op_count"])
            color = palette.get(family_name, "#355070")
            points = [(entry["op_count"], value_fn(entry)) for entry in ordered]
            polyline = " ".join(
                f"{x_pos(panel_left, op_count):.1f},{y_pos_fn(value):.1f}"
                for op_count, value in points
            )
            lines.append(
                f'<polyline points="{polyline}" fill="none" stroke="{color}" stroke-width="2.6" stroke-linecap="round"/>'
            )
            for entry, (_, value) in zip(ordered, points):
                x = x_pos(panel_left, entry["op_count"])
                y = y_pos_fn(value)
                lines.append(
                    f'<circle cx="{x:.1f}" cy="{y:.1f}" r="4" fill="{color}"/>'
                )
                lines.append(
                    f'<text x="{x + 6:.1f}" y="{y - 6:.1f}" font-size="9" fill="#243b53">{entry["problem_size"]}</text>'
                )

    lines.append("</svg>")
    return "".join(lines)


def build_size_sweep_frontier_svg(
    results: dict,
    *,
    width: int = 640,
    height: int = 360,
) -> str:
    families = results["families"]
    palette = {"fir": "#355070", "dot": "#bc4749"}
    left_pad = 72
    right_pad = 30
    top_pad = 76
    bottom_pad = 56
    plot_width = width - left_pad - right_pad
    plot_height = height - top_pad - bottom_pad
    op_ticks = sorted(
        {
            entry["op_count"]
            for entries in families.values()
            for entry in entries
        }
    )
    max_op_count = max(op_ticks, default=1)
    max_pareto = max(
        (entry["pareto_points"] for entries in families.values() for entry in entries),
        default=1,
    )
    max_pareto = max(max_pareto, 1)

    def x_pos(op_count: int) -> float:
        return left_pad + (op_count / max_op_count) * plot_width

    def y_pos(points: int) -> float:
        return top_pad + plot_height - (points / max_pareto) * plot_height

    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Synthetic size sweep frontier growth plot">',
        f'<text x="{width / 2}" y="24" text-anchor="middle" font-size="18" font-weight="700" fill="#102a43">Pareto Frontier Size Under Synthetic Size Sweeps</text>',
        f'<text x="{width / 2}" y="44" text-anchor="middle" font-size="12" fill="#486581">FIR-4/8/16/32 and dot-product-8/16/32/64 plotted against arithmetic op count.</text>',
        f'<line x1="{left_pad}" y1="{top_pad + plot_height}" x2="{width - right_pad}" y2="{top_pad + plot_height}" stroke="#9fb3c8" stroke-width="1.2"/>',
        f'<line x1="{left_pad}" y1="{top_pad}" x2="{left_pad}" y2="{top_pad + plot_height}" stroke="#9fb3c8" stroke-width="1.2"/>',
        f'<text x="{left_pad + plot_width / 2}" y="{height - 14}" text-anchor="middle" font-size="12" fill="#486581">Arithmetic op count (mul + add)</text>',
        f'<text x="18" y="{top_pad + plot_height / 2}" transform="rotate(-90 18 {top_pad + plot_height / 2})" text-anchor="middle" font-size="12" fill="#486581">Pareto frontier size (points)</text>',
    ]

    legend_x = width / 2 - 72
    for family_name in ("fir", "dot"):
        lines.append(
            f'<line x1="{legend_x:.1f}" y1="62" x2="{legend_x + 24:.1f}" y2="62" stroke="{palette[family_name]}" stroke-width="3"/>'
        )
        lines.append(
            f'<text x="{legend_x + 32:.1f}" y="66" font-size="12" fill="#243b53">{html.escape(family_name.upper())}</text>'
        )
        legend_x += 88

    for op_value in op_ticks:
        x = x_pos(op_value)
        lines.append(
            f'<line x1="{x:.1f}" y1="{top_pad}" x2="{x:.1f}" y2="{top_pad + plot_height}" stroke="#e6edf3" stroke-width="1"/>'
        )
        lines.append(
            f'<text x="{x:.1f}" y="{top_pad + plot_height + 18:.1f}" text-anchor="middle" font-size="10" fill="#486581">{op_value}</text>'
        )
    for tick in range(5):
        y_value = max_pareto * tick / 4
        y = top_pad + plot_height - plot_height * tick / 4
        lines.append(
            f'<line x1="{left_pad}" y1="{y:.1f}" x2="{left_pad + plot_width}" y2="{y:.1f}" stroke="#e6edf3" stroke-width="1"/>'
        )
        lines.append(
            f'<text x="{left_pad - 8:.1f}" y="{y + 4:.1f}" text-anchor="end" font-size="10" fill="#486581">{y_value:.1f}</text>'
        )

    for family_name, entries in families.items():
        ordered = sorted(entries, key=lambda entry: entry["op_count"])
        color = palette.get(family_name, "#355070")
        points = [(entry["op_count"], entry["pareto_points"]) for entry in ordered]
        polyline = " ".join(
            f"{x_pos(op_count):.1f},{y_pos(value):.1f}"
            for op_count, value in points
        )
        lines.append(
            f'<polyline points="{polyline}" fill="none" stroke="{color}" stroke-width="2.8" stroke-linecap="round"/>'
        )
        for entry in ordered:
            x = x_pos(entry["op_count"])
            y = y_pos(entry["pareto_points"])
            pareto_result = entry.get("pareto_2d", {})
            feasible = pareto_result.get("feasible", entry["pareto_points"] > 0)
            if not feasible:
                lines.append(
                    f'<line x1="{x - 5:.1f}" y1="{y - 5:.1f}" x2="{x + 5:.1f}" y2="{y + 5:.1f}" stroke="{color}" stroke-width="2.2"/>'
                )
                lines.append(
                    f'<line x1="{x - 5:.1f}" y1="{y + 5:.1f}" x2="{x + 5:.1f}" y2="{y - 5:.1f}" stroke="{color}" stroke-width="2.2"/>'
                )
            else:
                lines.append(
                    f'<circle cx="{x:.1f}" cy="{y:.1f}" r="4.4" fill="{color}"/>'
                )
            lines.append(
                f'<text x="{x + 7:.1f}" y="{y - 7:.1f}" font-size="9" fill="#243b53">{entry["problem_size"]}</text>'
            )

    lines.append("</svg>")
    return "".join(lines)


def tradeoff_point_groups(payload: dict) -> List[dict]:
    palette = chart_palette()
    original = payload["original_metrics"]
    grouped: Dict[tuple[int, int], dict] = {}

    def add_point(label: str, area: int, latency: int, color_key: str) -> None:
        key = (area, latency)
        group = grouped.setdefault(
            key,
            {
                "area": area,
                "latency": latency,
                "labels": [],
                "color": palette[color_key],
            },
        )
        if label not in group["labels"]:
            group["labels"].append(label)
        if color_key == "original":
            group["color"] = palette["original"]

    add_point(display_run_name("original"), original["area"], original["latency"], "original")
    for run_name in (
        "weighted",
        "latency_unconstrained",
        "power_unconstrained",
        "latency_under_area",
        "latency_under_power",
        "area_under_latency",
        "power_under_latency",
        "latency_under_dsp",
        "latency_under_lut",
    ):
        metrics = safe_run_metrics(payload["runs"].get(run_name, {}))
        if metrics:
            add_point(display_run_name(run_name), metrics["area"], metrics["latency"], run_name)

    for entry in weight_sweep_entries(payload):
        metrics = entry.get("response", {}).get("metrics")
        if metrics:
            add_point(
                weight_display_label(entry["weights"]),
                metrics["area"],
                metrics["latency"],
                "weight_sweep",
            )

    frontier_points = unique_pareto_points(payload)
    for area, latency in frontier_points:
        add_point(display_run_name("pareto"), area, latency, "pareto")

    groups = sorted(grouped.values(), key=lambda item: (item["area"], item["latency"]))
    for index, group in enumerate(groups, start=1):
        group["index"] = index
        group["summary"] = summarize_group_labels(group["labels"])
    return groups


def build_tradeoff_svg(
    name: str,
    payload: dict,
    *,
    width: int = 500,
    height: int = 340,
    annotate_selected: bool = False,
) -> str:
    groups = tradeoff_point_groups(payload)
    frontier_points = unique_pareto_points(payload)
    weight_points = unique_weight_sweep_points(payload)
    palette = chart_palette()

    left_pad = 60
    right_pad = 28
    top_pad = 58 if annotate_selected else 36
    bottom_pad = 52
    plot_width = width - left_pad - right_pad
    plot_height = height - top_pad - bottom_pad
    max_area = max(group["area"] for group in groups)
    max_latency = max(group["latency"] for group in groups)
    max_area = max(max_area, 1)
    max_latency = max(max_latency, 1)

    def x_pos(area: int) -> float:
        return left_pad + (area / max_area) * plot_width

    def y_pos(latency: int) -> float:
        return top_pad + plot_height - (latency / max_latency) * plot_height

    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="{html.escape(name)} tradeoff plot">',
        f'<text x="{width / 2}" y="22" text-anchor="middle" font-size="16" font-weight="700" fill="#102a43">{html.escape(name)} area vs latency</text>',
        f'<line x1="{left_pad}" y1="{top_pad + plot_height}" x2="{width - right_pad}" y2="{top_pad + plot_height}" stroke="#9fb3c8" stroke-width="1.2"/>',
        f'<line x1="{left_pad}" y1="{top_pad}" x2="{left_pad}" y2="{top_pad + plot_height}" stroke="#9fb3c8" stroke-width="1.2"/>',
        f'<text x="{width / 2}" y="{height - 10}" text-anchor="middle" font-size="12" fill="#486581">Area</text>',
        f'<text x="18" y="{top_pad + plot_height / 2}" transform="rotate(-90 18 {top_pad + plot_height / 2})" text-anchor="middle" font-size="12" fill="#486581">Latency</text>',
    ]

    for tick in range(5):
        area_value = max_area * tick / 4
        x = left_pad + plot_width * tick / 4
        lines.append(
            f'<line x1="{x:.1f}" y1="{top_pad + plot_height}" x2="{x:.1f}" y2="{top_pad + plot_height + 5}" stroke="#9fb3c8" stroke-width="1"/>'
        )
        lines.append(
            f'<text x="{x:.1f}" y="{top_pad + plot_height + 18}" text-anchor="middle" font-size="10" fill="#486581">{area_value:.1f}</text>'
        )
        latency_value = max_latency * tick / 4
        y = top_pad + plot_height - plot_height * tick / 4
        lines.append(
            f'<line x1="{left_pad - 5}" y1="{y:.1f}" x2="{left_pad}" y2="{y:.1f}" stroke="#9fb3c8" stroke-width="1"/>'
        )
        lines.append(
            f'<text x="{left_pad - 10}" y="{y + 4:.1f}" text-anchor="end" font-size="10" fill="#486581">{latency_value:.1f}</text>'
        )

    if len(frontier_points) > 1:
        polyline = staircase_polyline_points(frontier_points, x_pos, y_pos)
        lines.append(
            f'<polyline points="{polyline}" fill="none" stroke="{palette["pareto"]}" stroke-width="2.5" stroke-dasharray="4 4"/>'
        )

    if len(weight_points) > 1:
        polyline = " ".join(f"{x_pos(area):.1f},{y_pos(latency):.1f}" for area, latency in weight_points)
        lines.append(
            f'<polyline points="{polyline}" fill="none" stroke="{palette["weight_sweep"]}" stroke-width="2.5" stroke-linecap="round"/>'
        )

    point_positions: dict[tuple[int, int], tuple[float, float]] = {}
    for group in groups:
        x = x_pos(group["area"])
        y = y_pos(group["latency"])
        point_positions[(group["area"], group["latency"])] = (x, y)
        lines.append(f'<circle cx="{x:.1f}" cy="{y:.1f}" r="11" fill="{group["color"]}" />')
        lines.append(
            f'<text x="{x:.1f}" y="{y + 4:.1f}" text-anchor="middle" font-size="10" font-weight="700" fill="#ffffff">{group["index"]}</text>'
        )

    if annotate_selected:
        selected_points = [
            ("Original", payload["original_metrics"], palette["original"]),
            (display_run_name("weighted"), payload["runs"]["weighted"].get("metrics"), palette["weighted"]),
            (
                "Latency-optimal",
                payload["runs"]["latency_unconstrained"].get("metrics"),
                palette["latency_unconstrained"],
            ),
            (
                "Power-optimal",
                payload["runs"]["power_unconstrained"].get("metrics"),
                palette["power_unconstrained"],
            ),
        ]
        offsets = [(-88, -18), (18, -38), (18, 18), (-110, 26)]
        for idx, (label, metrics, color) in enumerate(selected_points):
            if not metrics:
                continue
            point_key = (metrics["area"], metrics["latency"])
            if point_key not in point_positions:
                continue
            x, y = point_positions[point_key]
            dx, dy = offsets[idx % len(offsets)]
            label_x = max(left_pad + 8, min(width - right_pad - 8, x + dx))
            label_y = max(top_pad + 18, min(height - bottom_pad - 8, y + dy))
            anchor = "start" if label_x >= x else "end"
            lines.append(
                f'<line x1="{x:.1f}" y1="{y:.1f}" x2="{label_x:.1f}" y2="{label_y:.1f}" stroke="{color}" stroke-width="1.5"/>'
            )
            box_width = 88
            box_x = label_x if anchor == "start" else label_x - box_width
            lines.append(
                f'<rect x="{box_x:.1f}" y="{label_y - 14:.1f}" width="{box_width}" height="18" rx="4" fill="#ffffff" stroke="{color}" stroke-width="1"/>'
            )
            text_x = box_x + 6 if anchor == "start" else box_x + box_width - 6
            text_anchor = "start" if anchor == "start" else "end"
            lines.append(
                f'<text x="{text_x:.1f}" y="{label_y - 1:.1f}" text-anchor="{text_anchor}" font-size="10" font-weight="700" fill="#102a43">{html.escape(label)}</text>'
            )

        legend_width = 148
        legend_x = left_pad + 12
        legend_y = top_pad + plot_height - 18
        lines.append(
            f'<rect x="{legend_x}" y="{legend_y - 16}" width="{legend_width}" height="30" rx="6" fill="#ffffff" stroke="#d9e2ec" stroke-width="1"/>'
        )
        lines.append(
            f'<line x1="{legend_x + 8}" y1="{legend_y - 2}" x2="{legend_x + 34}" y2="{legend_y - 2}" stroke="{palette["pareto"]}" stroke-width="2.5" stroke-dasharray="4 4"/>'
        )
        lines.append(
            f'<text x="{legend_x + 38}" y="{legend_y + 1}" font-size="10" fill="#243b53">Pareto</text>'
        )
        lines.append(
            f'<line x1="{legend_x + 78}" y1="{legend_y - 2}" x2="{legend_x + 104}" y2="{legend_y - 2}" stroke="{palette["weight_sweep"]}" stroke-width="2.5"/>'
        )
        lines.append(
            f'<text x="{legend_x + 108}" y="{legend_y + 1}" font-size="10" fill="#243b53">Weights</text>'
        )

    lines.append("</svg>")
    return "".join(lines)


def render_tradeoff_plot(name: str, payload: dict, *, width: int = 500, height: int = 340) -> str:
    groups = tradeoff_point_groups(payload)
    palette = chart_palette()
    svg = build_tradeoff_svg(name, payload, width=width, height=height)
    legend = [
        "<div class='curve-legend'>",
        f"<span class='curve-key'><span class='curve-line curve-line-pareto' style='border-color:{palette['pareto']}'></span>Exact Pareto frontier</span>",
        f"<span class='curve-key'><span class='curve-line curve-line-sweep' style='border-color:{palette['weight_sweep']}'></span>Weight-sweep sampled curve</span>",
        "</div>",
        "<div class='point-legend'>",
    ]
    for group in groups:
        legend.append(
            "<div class='point-entry'>"
            f"<span class='point-badge' style='background:{group['color']}'>{group['index']}</span>"
            f"<span><strong>{html.escape(group['summary'])}</strong><br><span class='subtle'>area={group['area']}, latency={group['latency']}</span></span>"
            "</div>"
        )
    legend.append("</div>")
    return "<div class='tradeoff-card'>" + svg + "".join(legend) + "</div>"


def render_ir_panel(title: str, graph: dict | None, metrics: dict | None = None) -> str:
    counts = graph_op_counts(graph)
    expr = graph_to_expr_text(graph)
    ir_lines = graph_to_ir_lines(graph)
    chips = []
    if metrics:
        chips.extend(
            [
                f"area {metrics['area']}",
                f"latency {metrics['latency']}",
                f"dsp {metrics['dsp_count']}",
                f"lut {metrics['lut_count']}",
                f"power {metric_value(metrics, 'power')}",
            ]
        )
    chips.extend(
        [
            f"nodes {0 if not graph else len(graph['ir_nodes'])}",
            f"add {counts['add']}",
            f"add_dsp {counts['add_dsp']}",
            f"add_lut {counts['add_lut']}",
            f"sub {counts['sub']}",
            f"sub_dsp {counts['sub_dsp']}",
            f"sub_lut {counts['sub_lut']}",
            f"mul {counts['mul']}",
            f"mul_dsp {counts['mul_dsp']}",
            f"mul_lut {counts['mul_lut']}",
            f"mac_dsp {counts['mac_dsp']}",
            f"const {counts['const']}",
            f"input {counts['input']}",
        ]
    )
    chip_html = "".join(f"<span class='chip'>{html.escape(chip)}</span>" for chip in chips)
    return (
        "<div class='ir-panel'>"
        f"<h4>{html.escape(title)}</h4>"
        f"<div class='chip-row'>{chip_html}</div>"
        "<div class='ir-subtitle'>Expression form</div>"
        f"<div class='expr'>{html.escape(expr)}</div>"
        "<div class='ir-subtitle'>IR node list</div>"
        f"<pre class='ir-code'>{html.escape(chr(10).join(ir_lines))}</pre>"
        "</div>"
    )


def render_ir_comparison(payload: dict) -> str:
    original_graph = payload.get("original_ir")
    original_metrics = payload["original_metrics"]
    weighted = payload["runs"]["weighted"]
    weighted_graph = weighted.get("optimized_ir")
    weighted_metrics = weighted.get("metrics")
    panels = [
        render_ir_panel("Original IR", original_graph, original_metrics),
        render_ir_panel("Weighted Optimized IR", weighted_graph, weighted_metrics),
    ]
    latency_unconstrained = payload["runs"].get("latency_unconstrained", {})
    unconstrained_graph = latency_unconstrained.get("optimized_ir")
    unconstrained_metrics = latency_unconstrained.get("metrics")
    if unconstrained_metrics and (
        unconstrained_metrics != weighted_metrics or unconstrained_graph != weighted_graph
    ):
        panels.append(
            render_ir_panel(
                "Latency-Optimal IR",
                unconstrained_graph,
                unconstrained_metrics,
            )
        )
    power_unconstrained = payload["runs"].get("power_unconstrained", {})
    power_graph = power_unconstrained.get("optimized_ir")
    power_metrics = power_unconstrained.get("metrics")
    if power_metrics and (
        power_metrics != weighted_metrics or power_graph != weighted_graph
    ):
        panels.append(
            render_ir_panel(
                "Power-Optimal IR",
                power_graph,
                power_metrics,
            )
        )
    zero_dsp = payload["runs"].get("latency_under_dsp", {})
    zero_dsp_graph = zero_dsp.get("optimized_ir")
    zero_dsp_metrics = zero_dsp.get("metrics")
    if zero_dsp_metrics and (
        zero_dsp_metrics != weighted_metrics or zero_dsp_graph != weighted_graph
    ):
        panels.append(
            render_ir_panel("Zero-DSP Optimized IR", zero_dsp_graph, zero_dsp_metrics)
        )
    lut_cap = payload["runs"].get("latency_under_lut", {})
    lut_cap_graph = lut_cap.get("optimized_ir")
    lut_cap_metrics = lut_cap.get("metrics")
    if lut_cap_metrics and (
        lut_cap_metrics != weighted_metrics or lut_cap_graph != weighted_graph
    ):
        panels.append(
            render_ir_panel("LUT-Capped Optimized IR", lut_cap_graph, lut_cap_metrics)
        )
    return "<div class='ir-comparison'>" + "".join(panels) + "</div>"


def summarize_results(results: dict) -> dict:
    summary = {"benchmarks": {}, "overview": {}}
    area_reductions = []
    latency_changes = []
    dsp_reductions = []
    power_reductions = []
    runtime_ms = []
    pareto_points = []
    weight_sweep_points = []
    dsp_sweep_points = []
    identical_constrained = []
    component_budget_divergent = []
    power_budget_divergent = []
    resource_scaling_benefit = []
    latency_unconstrained_improvements = []
    power_unconstrained_improvements = []

    for name, payload in results["benchmarks"].items():
        original = payload["original_metrics"]
        weighted = payload["runs"]["weighted"]
        latency_unconstrained = payload["runs"]["latency_unconstrained"]
        power_unconstrained = payload["runs"].get("power_unconstrained", {})
        weighted_metrics = weighted["metrics"]
        unconstrained_metrics = latency_unconstrained["metrics"]
        power_metrics = power_unconstrained.get("metrics", weighted_metrics)
        area_reduction = pct_reduction(original["area"], weighted_metrics["area"])
        latency_change = pct_reduction(original["latency"], weighted_metrics["latency"])
        dsp_reduction = pct_reduction(original["dsp_count"], weighted_metrics["dsp_count"])
        power_reduction = pct_reduction(
            metric_value(original, "power"),
            metric_value(weighted_metrics, "power"),
        )
        area_reductions.append(area_reduction)
        latency_changes.append(latency_change)
        dsp_reductions.append(dsp_reduction)
        power_reductions.append(power_reduction)
        runtime_ms.append(weighted["stats"]["runtime_ms"])
        latency_unconstrained_improvements.append(
            pct_reduction(original["latency"], unconstrained_metrics["latency"])
        )
        power_unconstrained_improvements.append(
            pct_reduction(metric_value(original, "power"), metric_value(power_metrics, "power"))
        )

        constrained_same = all(
            payload["runs"].get(run_name, {}).get("metrics") == weighted_metrics
            for run_name in (
                "latency_under_area",
                "area_under_latency",
                "latency_under_power",
                "power_under_latency",
                "latency_under_dsp",
                "latency_under_lut",
            )
        )
        if constrained_same:
            identical_constrained.append(name)
        if (
            payload["runs"].get("latency_under_dsp", {}).get("metrics") != weighted_metrics
            or payload["runs"].get("latency_under_lut", {}).get("metrics") != weighted_metrics
        ):
            component_budget_divergent.append(name)
        if (
            payload["runs"].get("latency_under_power", {}).get("metrics") != weighted_metrics
            or payload["runs"].get("power_under_latency", {}).get("metrics") != weighted_metrics
        ):
            power_budget_divergent.append(name)

        pareto_count = len(unique_pareto_points(payload))
        weight_sweep_count = len(unique_weight_sweep_points(payload))
        dsp_sweep_count = len(dsp_budget_sweep_entries(payload))
        dsp_sweep_latencies = [latency for _, latency in dsp_sweep_latency_points(payload)]
        pareto_points.append(pareto_count)
        weight_sweep_points.append(weight_sweep_count)
        dsp_sweep_points.append(dsp_sweep_count)
        if dsp_sweep_latencies:
            resource_scaling_benefit.append(max(dsp_sweep_latencies) - min(dsp_sweep_latencies))
        else:
            resource_scaling_benefit.append(0)

        summary["benchmarks"][name] = {
            "original_expr": graph_to_expr_text(payload.get("original_ir")),
            "weighted_area_reduction_pct": area_reduction,
            "weighted_latency_change_pct": latency_change,
            "weighted_dsp_reduction_pct": dsp_reduction,
            "weighted_power_reduction_pct": power_reduction,
            "weighted_expr": graph_to_expr_text(weighted.get("optimized_ir")),
            "latency_unconstrained_expr": graph_to_expr_text(
                latency_unconstrained.get("optimized_ir")
            ),
            "latency_unconstrained_latency": unconstrained_metrics["latency"],
            "power_unconstrained_expr": graph_to_expr_text(
                power_unconstrained.get("optimized_ir", weighted.get("optimized_ir"))
            ),
            "power_unconstrained_power": metric_value(power_metrics, "power"),
            "pareto_points": pareto_count,
            "weight_sweep_points": weight_sweep_count,
            "dsp_sweep_points": dsp_sweep_count,
            "constrained_matches_weighted": constrained_same,
            "component_budget_differs": name in component_budget_divergent,
            "power_budget_differs": name in power_budget_divergent,
            "resource_scaling_latency_gain": resource_scaling_benefit[-1],
        }

    best_area = max(
        summary["benchmarks"].items(),
        key=lambda item: item[1]["weighted_area_reduction_pct"],
    )
    best_latency = max(
        summary["benchmarks"].items(),
        key=lambda item: item[1]["weighted_latency_change_pct"],
    )
    best_latency_value = best_latency[1]["weighted_latency_change_pct"]
    best_power = max(
        summary["benchmarks"].items(),
        key=lambda item: item[1]["weighted_power_reduction_pct"],
    )
    summary["overview"] = {
        "benchmark_count": len(results["benchmarks"]),
        "avg_area_reduction_pct": mean(area_reductions) if area_reductions else 0.0,
        "avg_latency_change_pct": mean(latency_changes) if latency_changes else 0.0,
        "avg_dsp_reduction_pct": mean(dsp_reductions) if dsp_reductions else 0.0,
        "avg_power_reduction_pct": mean(power_reductions) if power_reductions else 0.0,
        "avg_latency_unconstrained_improvement_pct": (
            mean(latency_unconstrained_improvements)
            if latency_unconstrained_improvements
            else 0.0
        ),
        "avg_power_unconstrained_reduction_pct": (
            mean(power_unconstrained_improvements)
            if power_unconstrained_improvements
            else 0.0
        ),
        "avg_weighted_runtime_ms": mean(runtime_ms) if runtime_ms else 0.0,
        "avg_pareto_points": mean(pareto_points) if pareto_points else 0.0,
        "avg_weight_sweep_points": mean(weight_sweep_points) if weight_sweep_points else 0.0,
        "avg_dsp_sweep_points": mean(dsp_sweep_points) if dsp_sweep_points else 0.0,
        "avg_resource_scaling_latency_gain": (
            mean(resource_scaling_benefit) if resource_scaling_benefit else 0.0
        ),
        "best_area_benchmark": best_area[0],
        "best_latency_benchmark": best_latency[0],
        "best_latency_value_pct": best_latency_value,
        "best_power_benchmark": best_power[0],
        "best_latency_label": (
            "Strongest Latency Improvement"
            if best_latency_value > 0
            else "Least Latency Regression"
        ),
        "identical_constrained": identical_constrained,
        "component_budget_divergent": component_budget_divergent,
        "power_budget_divergent": power_budget_divergent,
    }
    return summary


def write_summary_csv(results: dict, output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = [
        "benchmark",
        "run",
        "weight_label",
        "applied_budgets",
        "feasible",
        "area",
        "latency",
        "power",
        "dsp_count",
        "lut_count",
        "score",
        "runtime_ms",
        "iterations",
        "message",
        "area_reduction_pct_vs_original",
        "latency_change_pct_vs_original",
        "dsp_reduction_pct_vs_original",
        "power_reduction_pct_vs_original",
        "pareto_points",
    ]
    with output_path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for name, payload in results["benchmarks"].items():
            original = payload["original_metrics"]
            writer.writerow(
                {
                    "benchmark": name,
                    "run": "original",
                    "weight_label": "",
                    "applied_budgets": "",
                    "feasible": True,
                    "area": original["area"],
                    "latency": original["latency"],
                    "power": metric_value(original, "power"),
                    "dsp_count": original["dsp_count"],
                    "lut_count": original["lut_count"],
                    "score": "",
                    "runtime_ms": "",
                    "iterations": "",
                    "message": "",
                    "area_reduction_pct_vs_original": 0.0,
                    "latency_change_pct_vs_original": 0.0,
                    "dsp_reduction_pct_vs_original": 0.0,
                    "power_reduction_pct_vs_original": 0.0,
                    "pareto_points": "",
                }
            )
            for run_name, run in payload["runs"].items():
                metrics = run.get("metrics")
                writer.writerow(
                    {
                        "benchmark": name,
                        "run": run_name,
                        "weight_label": "",
                        "applied_budgets": json.dumps(run.get("applied_budgets", {}), sort_keys=True),
                        "feasible": run.get("feasible", False),
                        "area": metrics["area"] if metrics else "",
                        "latency": metrics["latency"] if metrics else "",
                        "power": metric_value(metrics, "power", "") if metrics else "",
                        "dsp_count": metrics["dsp_count"] if metrics else "",
                        "lut_count": metrics["lut_count"] if metrics else "",
                        "score": run.get("score", ""),
                        "runtime_ms": run.get("stats", {}).get("runtime_ms", ""),
                        "iterations": run.get("stats", {}).get("iterations", ""),
                        "message": run.get("message", ""),
                        "area_reduction_pct_vs_original": pct_reduction(original["area"], metrics["area"]) if metrics else "",
                        "latency_change_pct_vs_original": pct_reduction(original["latency"], metrics["latency"]) if metrics else "",
                        "dsp_reduction_pct_vs_original": pct_reduction(original["dsp_count"], metrics["dsp_count"]) if metrics else "",
                        "power_reduction_pct_vs_original": pct_reduction(metric_value(original, "power"), metric_value(metrics, "power")) if metrics else "",
                        "pareto_points": len(run.get("frontier", [])) if run_name == "pareto_2d" else "",
                    }
                )
            for entry in weight_sweep_entries(payload):
                response = entry.get("response", {})
                metrics = response.get("metrics")
                writer.writerow(
                    {
                        "benchmark": name,
                        "run": "weight_sweep",
                        "weight_label": weight_label(entry["weights"]),
                        "applied_budgets": json.dumps(
                            response.get("applied_budgets", {}),
                            sort_keys=True,
                        ),
                        "feasible": response.get("feasible", False),
                        "area": metrics["area"] if metrics else "",
                        "latency": metrics["latency"] if metrics else "",
                        "power": metric_value(metrics, "power", "") if metrics else "",
                        "dsp_count": metrics["dsp_count"] if metrics else "",
                        "lut_count": metrics["lut_count"] if metrics else "",
                        "score": response.get("score", ""),
                        "runtime_ms": response.get("stats", {}).get("runtime_ms", ""),
                        "iterations": response.get("stats", {}).get("iterations", ""),
                        "message": response.get("message", ""),
                        "area_reduction_pct_vs_original": pct_reduction(original["area"], metrics["area"]) if metrics else "",
                        "latency_change_pct_vs_original": pct_reduction(original["latency"], metrics["latency"]) if metrics else "",
                        "dsp_reduction_pct_vs_original": pct_reduction(original["dsp_count"], metrics["dsp_count"]) if metrics else "",
                        "power_reduction_pct_vs_original": pct_reduction(metric_value(original, "power"), metric_value(metrics, "power")) if metrics else "",
                        "pareto_points": "",
                    }
                )
            for entry in dsp_budget_sweep_entries(payload):
                metrics = entry.get("metrics")
                writer.writerow(
                    {
                        "benchmark": name,
                        "run": "dsp_budget_sweep",
                        "weight_label": "",
                        "applied_budgets": json.dumps(
                            entry.get("applied_budgets", {}),
                            sort_keys=True,
                        ),
                        "feasible": entry.get("feasible", False),
                        "area": metrics["area"] if metrics else "",
                        "latency": metrics["latency"] if metrics else "",
                        "power": metric_value(metrics, "power", "") if metrics else "",
                        "dsp_count": metrics["dsp_count"] if metrics else "",
                        "lut_count": metrics["lut_count"] if metrics else "",
                        "score": entry.get("score", ""),
                        "runtime_ms": entry.get("stats", {}).get("runtime_ms", ""),
                        "iterations": entry.get("stats", {}).get("iterations", ""),
                        "message": entry.get("message", ""),
                        "area_reduction_pct_vs_original": pct_reduction(original["area"], metrics["area"]) if metrics else "",
                        "latency_change_pct_vs_original": pct_reduction(original["latency"], metrics["latency"]) if metrics else "",
                        "dsp_reduction_pct_vs_original": pct_reduction(original["dsp_count"], metrics["dsp_count"]) if metrics else "",
                        "power_reduction_pct_vs_original": pct_reduction(metric_value(original, "power"), metric_value(metrics, "power")) if metrics else "",
                        "pareto_points": "",
                    }
                )


def benchmark_analysis_lines(name: str, payload: dict) -> List[str]:
    original = payload["original_metrics"]
    weighted = payload["runs"]["weighted"]["metrics"]
    latency_unconstrained = payload["runs"]["latency_unconstrained"]["metrics"]
    power_unconstrained = payload["runs"].get("power_unconstrained", {}).get("metrics")
    lines = []
    lines.append(
        "Weighted extraction changed "
        + ", ".join(
            [
                metric_change_text("area", original["area"], weighted["area"]),
                metric_change_text("latency", original["latency"], weighted["latency"]),
                metric_change_text("power", metric_value(original, "power"), metric_value(weighted, "power")),
            ]
        )
        + "."
    )
    lines.append(
        f"Latency-optimal extraction with no budgets reached latency {latency_unconstrained['latency']} with area {latency_unconstrained['area']}, power {metric_value(latency_unconstrained, 'power')}, DSP {latency_unconstrained['dsp_count']}, and LUT {latency_unconstrained['lut_count']}."
    )
    if power_unconstrained:
        lines.append(
            f"Power-optimal extraction with no budgets reached power {metric_value(power_unconstrained, 'power')} with area {power_unconstrained['area']}, latency {power_unconstrained['latency']}, DSP {power_unconstrained['dsp_count']}, and LUT {power_unconstrained['lut_count']}."
        )
    dsp_delta = pct_reduction(original["dsp_count"], weighted["dsp_count"])
    lut_delta = pct_change(original["lut_count"], weighted["lut_count"])
    lines.append(
        f"DSP count changed {original['dsp_count']} -> {weighted['dsp_count']} ({dsp_delta:.1f}% reduction) while LUT count changed {original['lut_count']} -> {weighted['lut_count']} ({lut_delta:+.1f}%)."
    )
    dsp_sweep = dsp_sweep_latency_points(payload)
    if dsp_sweep:
        low_budget = dsp_sweep[0]
        high_budget = dsp_sweep[-1]
        lines.append(
            f"Across the DSP-budget sweep, latency moved from {low_budget[1]} at dsp_max={low_budget[0]} to {high_budget[1]} at dsp_max={high_budget[0]}, which quantifies the benefit of a larger FPGA budget on this datapath."
        )
    latency_under_power_run = payload["runs"].get("latency_under_power", {})
    latency_under_power = latency_under_power_run.get("metrics")
    if latency_under_power:
        lines.append(
            f"With the configured power budget ({budget_label(latency_under_power_run.get('applied_budgets', {}))}), the optimizer returned area {latency_under_power['area']}, latency {latency_under_power['latency']}, power {metric_value(latency_under_power, 'power')}, DSP {latency_under_power['dsp_count']}, LUT {latency_under_power['lut_count']}."
        )
    power_under_latency_run = payload["runs"].get("power_under_latency", {})
    power_under_latency = power_under_latency_run.get("metrics")
    if power_under_latency:
        lines.append(
            f"With the configured latency ceiling ({budget_label(power_under_latency_run.get('applied_budgets', {}))}), power-aware extraction returned area {power_under_latency['area']}, latency {power_under_latency['latency']}, power {metric_value(power_under_latency, 'power')}, DSP {power_under_latency['dsp_count']}, LUT {power_under_latency['lut_count']}."
        )
    zero_dsp = payload["runs"].get("latency_under_dsp", {}).get("metrics")
    if zero_dsp:
        zero_dsp_budget = budget_label(
            payload["runs"].get("latency_under_dsp", {}).get("applied_budgets", {})
        )
        lines.append(
            f"With the configured zero-DSP budget ({zero_dsp_budget}), the optimizer returned area {zero_dsp['area']}, latency {zero_dsp['latency']}, power {metric_value(zero_dsp, 'power')}, DSP {zero_dsp['dsp_count']}, LUT {zero_dsp['lut_count']}."
        )
    lut_cap_run = payload["runs"].get("latency_under_lut", {})
    lut_cap = lut_cap_run.get("metrics")
    lut_cap_budget = budget_label(lut_cap_run.get("applied_budgets", {}))
    if lut_cap:
        lines.append(
            f"With the configured LUT-cap budget ({lut_cap_budget}), the optimizer returned area {lut_cap['area']}, latency {lut_cap['latency']}, power {metric_value(lut_cap, 'power')}, DSP {lut_cap['dsp_count']}, LUT {lut_cap['lut_count']}, which pushes the solution back toward DSP-heavy implementations."
        )
    elif lut_cap_run and lut_cap_run.get("feasible") is False:
        lines.append(
            f"With the configured LUT-cap budget ({lut_cap_budget}), no feasible solution was found inside the bounded extraction frontier, which shows the constraint is stricter than the retained tradeoff set for this benchmark."
        )
    constrained_same = all(
        payload["runs"].get(run_name, {}).get("metrics") == weighted
        for run_name in (
            "latency_under_area",
            "area_under_latency",
            "latency_under_power",
            "power_under_latency",
            "latency_under_dsp",
            "latency_under_lut",
        )
    )
    if constrained_same:
        lines.append(
            "All constrained runs matched the weighted solution, so the current budgets are not binding for this benchmark."
        )
    else:
        lines.append(
            "At least one constrained run diverged from the weighted solution, which means the explicit budgets are shaping extraction."
        )
    weight_points = unique_weight_sweep_points(payload)
    if len(weight_points) <= 1:
        lines.append(
            "Sweeping area/latency weights still landed on one area-latency point, so scalarized weighted extraction is not exposing extra tradeoffs for this benchmark yet."
        )
    else:
        lines.append(
            f"Sweeping area/latency weights produced {len(weight_points)} distinct weighted-optimal points, which gives a readable sampled Pareto curve."
        )
    pareto_points = len(unique_pareto_points(payload))
    if pareto_points <= 1:
        lines.append(
            "The Pareto frontier collapsed to a single point under the current rewrite set and cost model, so no area-latency conflict is exposed yet."
        )
    else:
        lines.append(
            f"The Pareto frontier exposed {pareto_points} nondominated solutions, indicating a visible area-latency tradeoff."
        )
    return lines


def write_analysis_markdown(results: dict, summary: dict, output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    overview = summary["overview"]
    lines = [
        "# Benchmark Analysis",
        "",
        f"- Benchmarks evaluated: {overview['benchmark_count']}",
        f"- Average weighted area reduction: {overview['avg_area_reduction_pct']:.1f}%",
        f"- Average weighted latency change (positive is better): {overview['avg_latency_change_pct']:.1f}%",
        f"- Average weighted power reduction: {overview['avg_power_reduction_pct']:.1f}%",
        f"- Average latency improvement with no budgets: {overview['avg_latency_unconstrained_improvement_pct']:.1f}%",
        f"- Average power reduction with no budgets: {overview['avg_power_unconstrained_reduction_pct']:.1f}%",
        f"- Average weighted DSP reduction: {overview['avg_dsp_reduction_pct']:.1f}%",
        f"- Average weighted runtime: {overview['avg_weighted_runtime_ms']:.1f} ms",
        f"- Average Pareto points: {overview['avg_pareto_points']:.1f}",
        f"- Average distinct weight-sweep points: {overview['avg_weight_sweep_points']:.1f}",
        f"- Average DSP-sweep points: {overview['avg_dsp_sweep_points']:.1f}",
        f"- Average latency gain across DSP scaling: {overview['avg_resource_scaling_latency_gain']:.1f}",
        f"- Strongest area improvement: {overview['best_area_benchmark']}",
        f"- {overview['best_latency_label']}: {overview['best_latency_benchmark']}",
        f"- Strongest weighted power improvement: {overview['best_power_benchmark']}",
        "",
        "## Cross-Benchmark Observations",
        "",
    ]
    if overview["identical_constrained"]:
        lines.append(
            f"- Constrained extraction matched weighted extraction for every configured budget on: {', '.join(overview['identical_constrained'])}."
        )
        lines.append(
            "- This means the current benchmark budgets are loose relative to the optimizer's best weighted solution."
        )
    if overview["component_budget_divergent"]:
        lines.append(
            f"- At least one strict component budget forced a different implementation on: {', '.join(overview['component_budget_divergent'])}."
        )
    if overview["power_budget_divergent"]:
        lines.append(
            f"- Power-aware budgets changed the chosen implementation on: {', '.join(overview['power_budget_divergent'])}."
        )
    lines.append(
        "- The new latency-unconstrained run should be read as the fastest datapath reachable within the bounded search, while the DSP-budget sweep shows how quickly that latency can be recovered as FPGA resources increase."
    )
    lines.append(
        "- The new power-unconstrained run is a normalized analytical proxy objective, not a synthesis-calibrated FPGA power claim."
    )
    if overview["avg_pareto_points"] <= 1.0:
        lines.append(
            "- Exact Pareto extraction still collapses to one point on average, so the weight sweep is currently the clearest way to visualize tradeoffs."
        )
    else:
        lines.append(
            "- Exact Pareto extraction now exposes multi-point frontiers on average, which confirms the cost model has a real area-latency conflict."
        )
    if overview["avg_weight_sweep_points"] <= 1.0:
        lines.append(
            "- The weighted sweep mostly lands on the same solution, so stronger objective separation would still be useful."
        )
    else:
        lines.append(
            "- Sweeping area/latency/power weights produces multiple distinct weighted-optimal points, which is a practical sampled tradeoff curve for the report."
        )
    lines.append("")
    lines.append("## Per-Benchmark Notes")
    lines.append("")
    for name, payload in results["benchmarks"].items():
        lines.append(f"### {name}")
        lines.append("")
        for item in benchmark_analysis_lines(name, payload):
            lines.append(f"- {item}")
        lines.append("")
    output_path.write_text("\n".join(lines))


def render_overview_cards(summary: dict) -> str:
    overview = summary["overview"]
    cards = [
        ("Benchmarks", str(overview["benchmark_count"])),
        ("Avg Area Reduction", f"{overview['avg_area_reduction_pct']:.1f}%"),
        ("Avg Latency Change", f"{overview['avg_latency_change_pct']:.1f}%"),
        ("Avg Power Reduction", f"{overview['avg_power_reduction_pct']:.1f}%"),
        ("Avg Unconstrained Latency Gain", f"{overview['avg_latency_unconstrained_improvement_pct']:.1f}%"),
        ("Avg Unconstrained Power Gain", f"{overview['avg_power_unconstrained_reduction_pct']:.1f}%"),
        ("Avg DSP Reduction", f"{overview['avg_dsp_reduction_pct']:.1f}%"),
        ("Avg Pareto Points", f"{overview['avg_pareto_points']:.1f}"),
        ("Avg Weight-Sweep Points", f"{overview['avg_weight_sweep_points']:.1f}"),
        ("Avg DSP-Sweep Points", f"{overview['avg_dsp_sweep_points']:.1f}"),
        ("Component Divergence", str(len(overview["component_budget_divergent"]))),
        ("Avg Weighted Runtime", f"{overview['avg_weighted_runtime_ms']:.0f} ms"),
    ]
    parts = ['<div class="card-grid">']
    for label, value in cards:
        parts.append(
            f'<div class="card"><div class="card-label">{html.escape(label)}</div><div class="card-value">{html.escape(value)}</div></div>'
        )
    parts.append("</div>")
    return "".join(parts)


def render_run_table(name: str, payload: dict) -> str:
    original = payload["original_metrics"]
    rows = [
        (
            display_run_name("original"),
            original["area"],
            original["latency"],
            metric_value(original, "power"),
            original["dsp_count"],
            original["lut_count"],
            "n/a",
            "",
        )
    ]
    for run_name, run in payload["runs"].items():
        metrics = run.get("metrics")
        budgets_text = budget_label(run.get("applied_budgets", {}))
        if metrics:
            rows.append(
                (
                    display_run_name(run_name),
                    metrics["area"],
                    metrics["latency"],
                    metric_value(metrics, "power"),
                    metrics["dsp_count"],
                    metrics["lut_count"],
                    f"{run.get('score', '')}",
                    f"budgets={budgets_text}; runtime={run.get('stats', {}).get('runtime_ms', '')} ms",
                )
            )
        else:
            rows.append(
                (
                    display_run_name(run_name),
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    run.get("message", f"frontier={len(run.get('frontier', []))}"),
                )
            )
    for entry in weight_sweep_entries(payload):
        response = entry.get("response", {})
        metrics = response.get("metrics")
        if not metrics:
            continue
        rows.append(
            (
                weight_display_label(entry["weights"]),
                metrics["area"],
                metrics["latency"],
                metric_value(metrics, "power"),
                metrics["dsp_count"],
                metrics["lut_count"],
                f"{response.get('score', '')}",
                f"budgets={budget_label(response.get('applied_budgets', {}))}; runtime={response.get('stats', {}).get('runtime_ms', '')} ms",
            )
        )
    body = []
    for run_name, area, latency, power, dsp, lut, score, extra in rows:
        body.append(
            "<tr>"
            f"<td>{html.escape(str(run_name))}</td>"
            f"<td>{html.escape(str(area))}</td>"
            f"<td>{html.escape(str(latency))}</td>"
            f"<td>{html.escape(str(power))}</td>"
            f"<td>{html.escape(str(dsp))}</td>"
            f"<td>{html.escape(str(lut))}</td>"
            f"<td>{html.escape(str(score))}</td>"
            f"<td>{html.escape(str(extra))}</td>"
            "</tr>"
        )
    return (
        '<table class="run-table">'
        "<thead><tr><th>Run</th><th>Area</th><th>Latency</th><th>Power</th><th>DSP</th><th>LUT</th><th>Score</th><th>Notes</th></tr></thead>"
        f"<tbody>{''.join(body)}</tbody></table>"
    )


def render_cost_model_table() -> str:
    body = []
    for row in cost_model_rows():
        body.append(
            "<tr>"
            f"<td><code>{html.escape(row['operation'])}</code></td>"
            f"<td>{row['area']}</td>"
            f"<td>{row['latency']}</td>"
            f"<td>{row['power']}</td>"
            f"<td>{row['dsp_count']}</td>"
            f"<td>{row['lut_count']}</td>"
            f"<td>{html.escape(row['role'])}</td>"
            "</tr>"
        )
    formula_items = "".join(
        f"<li><code>{html.escape(metric)} = {html.escape(formula)}</code></li>"
        for metric, formula in METRIC_FORMULAS.items()
    )
    return (
        "<h2>Analytical Cost Model</h2>"
        "<p class='subtle'>The Rust extractor and Python harness both read the same "
        "<code>cost_model.json</code>. These are normalized analytical costs, not "
        "post-synthesis FPGA measurements.</p>"
        f"<ul class='note-list'>{formula_items}</ul>"
        '<table class="run-table">'
        "<thead><tr><th>Operation</th><th>Area</th><th>Latency</th><th>Power</th><th>DSP</th><th>LUT</th><th>Role</th></tr></thead>"
        f"<tbody>{''.join(body)}</tbody></table>"
    )


def render_baseline_constraint_table(results: dict) -> str:
    body = []
    for row in baseline_constraint_rows(results):
        body.append(
            "<tr>"
            f"<td><code>{html.escape(row['benchmark'])}</code></td>"
            f"<td>{html.escape(str(row['baseline_a_l_p_d_u']))}</td>"
            f"<td>{html.escape(str(row['area_cap']))}</td>"
            f"<td>{html.escape(str(row['latency_cap']))}</td>"
            f"<td>{html.escape(str(row['power_cap']))}</td>"
            f"<td>{html.escape(str(row['dsp_cap']))}</td>"
            f"<td>{html.escape(str(row['lut_cap']))}</td>"
            "</tr>"
        )
    return (
        "<h2>Baseline Constraints</h2>"
        "<p class='subtle'><code>A/L/P/D/U</code> means area, latency, power, DSP count, and LUT count. "
        "Area, latency, and power caps are derived from the original baseline for each benchmark; "
        "the DSP cap is the zero-DSP stress query and LUT caps are configured benchmark-specific ceilings.</p>"
        '<table class="run-table">'
        "<thead><tr><th>Benchmark</th><th>Baseline A/L/P/D/U</th><th>Area cap</th><th>Latency cap</th><th>Power cap</th><th>DSP cap</th><th>LUT cap</th></tr></thead>"
        f"<tbody>{''.join(body)}</tbody></table>"
    )


def render_main_comparison_table(results: dict) -> str:
    body = []
    for row in main_comparison_rows(results):
        body.append(
            "<tr>"
            f"<td><code>{html.escape(row['benchmark'])}</code></td>"
            f"<td>{html.escape(str(row['weighted_a_l_p_d_u']))}</td>"
            f"<td>{html.escape(str(row['latency_opt_a_l_p_d_u']))}</td>"
            f"<td>{html.escape(str(row['power_opt_a_l_p_d_u']))}</td>"
            f"<td>{html.escape(str(row['pareto_points']))}</td>"
            f"<td>{html.escape(str(row['infeasible_queries']))}</td>"
            "</tr>"
        )
    return (
        "<h2>Main Comparison Tuples</h2>"
        "<p class='subtle'>These are the exact points plotted or discussed in the "
        "suite-level objective and representative tradeoff figures. "
        "<code>A/L/P/D/U</code> means area, latency, power, DSP count, and LUT count.</p>"
        '<table class="run-table">'
        "<thead><tr><th>Benchmark</th><th>Weighted A/L/P/D/U</th><th>Latency-opt A/L/P/D/U</th><th>Power-opt A/L/P/D/U</th><th>Pareto points</th><th>Infeasible queries</th></tr></thead>"
        f"<tbody>{''.join(body)}</tbody></table>"
    )


def render_status_table(payload: dict) -> str:
    weighted_metrics = payload["runs"]["weighted"].get("metrics")
    rows = []
    for run_name in (
        "weighted",
        "latency_unconstrained",
        "power_unconstrained",
        "latency_under_area",
        "latency_under_power",
        "power_under_latency",
        "latency_under_dsp",
        "latency_under_lut",
    ):
        run = payload["runs"].get(run_name, {})
        metrics = run.get("metrics")
        rows.append(
            (
                display_run_name(run_name),
                run_status(run),
                "n/a" if run_name == "weighted" else run_diverged_from(weighted_metrics, run),
                budget_label(run.get("applied_budgets", {})),
                metrics["latency"] if metrics else "",
                metric_value(metrics, "power", "") if metrics else "",
                metrics["dsp_count"] if metrics else "",
                metrics["lut_count"] if metrics else "",
            )
        )

    body = []
    for run_name, status, diverged, budgets, latency, power, dsp, lut in rows:
        body.append(
            "<tr>"
            f"<td>{html.escape(str(run_name))}</td>"
            f"<td>{html.escape(str(status))}</td>"
            f"<td>{html.escape(str(diverged))}</td>"
            f"<td>{html.escape(str(budgets))}</td>"
            f"<td>{html.escape(str(latency))}</td>"
            f"<td>{html.escape(str(power))}</td>"
            f"<td>{html.escape(str(dsp))}</td>"
            f"<td>{html.escape(str(lut))}</td>"
            "</tr>"
        )
    return (
        '<table class="status-table">'
        "<thead><tr><th>Run</th><th>Status</th><th>Diverged</th><th>Budgets</th><th>Latency</th><th>Power</th><th>DSP</th><th>LUT</th></tr></thead>"
        f"<tbody>{''.join(body)}</tbody></table>"
    )


def build_resource_scaling_svg(
    name: str,
    payload: dict,
    *,
    width: int = 500,
    height: int = 300,
    annotate_original_budget: bool = False,
) -> str:
    points = dsp_sweep_latency_points(payload)
    latency_unconstrained = payload["runs"]["latency_unconstrained"]["metrics"]["latency"]
    original_dsp = payload["original_metrics"]["dsp_count"]
    palette = chart_palette()
    left_pad = 52
    right_pad = 22
    top_pad = 36
    bottom_pad = 42
    plot_width = width - left_pad - right_pad
    plot_height = height - top_pad - bottom_pad
    max_budget = max([budget for budget, _ in points], default=1)
    max_budget = max(max_budget, 1)
    max_latency = max([latency for _, latency in points] + [latency_unconstrained], default=1)
    max_latency = max(max_latency, 1)

    def x_pos(budget: int) -> float:
        return left_pad + (budget / max_budget) * plot_width

    def y_pos(latency: int) -> float:
        return top_pad + plot_height - (latency / max_latency) * plot_height

    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="{html.escape(name)} dsp scaling plot">',
        f'<text x="{width / 2}" y="22" text-anchor="middle" font-size="16" font-weight="700" fill="#102a43">Bigger FPGA, Faster Datapath?</text>',
        f'<line x1="{left_pad}" y1="{top_pad + plot_height}" x2="{width - right_pad}" y2="{top_pad + plot_height}" stroke="#9fb3c8" stroke-width="1.2"/>',
        f'<line x1="{left_pad}" y1="{top_pad}" x2="{left_pad}" y2="{top_pad + plot_height}" stroke="#9fb3c8" stroke-width="1.2"/>',
        f'<text x="{width / 2}" y="{height - 8}" text-anchor="middle" font-size="12" fill="#486581">Allowed DSP Budget</text>',
        f'<text x="18" y="{top_pad + plot_height / 2}" transform="rotate(-90 18 {top_pad + plot_height / 2})" text-anchor="middle" font-size="12" fill="#486581">Best Latency</text>',
    ]

    for tick in range(max_budget + 1):
        x = x_pos(tick)
        lines.append(
            f'<line x1="{x:.1f}" y1="{top_pad + plot_height}" x2="{x:.1f}" y2="{top_pad + plot_height + 5}" stroke="#9fb3c8" stroke-width="1"/>'
        )
        lines.append(
            f'<text x="{x:.1f}" y="{top_pad + plot_height + 18}" text-anchor="middle" font-size="10" fill="#486581">{tick}</text>'
        )

    for tick in range(5):
        latency_value = max_latency * tick / 4
        y = top_pad + plot_height - plot_height * tick / 4
        lines.append(
            f'<line x1="{left_pad - 5}" y1="{y:.1f}" x2="{left_pad}" y2="{y:.1f}" stroke="#9fb3c8" stroke-width="1"/>'
        )
        lines.append(
            f'<text x="{left_pad - 10}" y="{y + 4:.1f}" text-anchor="end" font-size="10" fill="#486581">{latency_value:.1f}</text>'
        )

    if points:
        polyline = staircase_polyline_points(points, x_pos, y_pos)
        lines.append(
            f'<polyline points="{polyline}" fill="none" stroke="{palette["dsp_budget_sweep"]}" stroke-width="2.5"/>'
        )
        for budget, latency in points:
            x = x_pos(budget)
            y = y_pos(latency)
            lines.append(
                f'<circle cx="{x:.1f}" cy="{y:.1f}" r="4.5" fill="{palette["dsp_budget_sweep"]}"/>'
            )
    unconstrained_y = y_pos(latency_unconstrained)
    lines.append(
        f'<line x1="{left_pad}" y1="{unconstrained_y:.1f}" x2="{width - right_pad}" y2="{unconstrained_y:.1f}" stroke="{palette["latency_unconstrained"]}" stroke-width="2" stroke-dasharray="5 4"/>'
    )
    lines.append(
        f'<text x="{width - right_pad - 4}" y="{unconstrained_y - 6:.1f}" text-anchor="end" font-size="10" fill="{palette["latency_unconstrained"]}">Latency-optimal = {latency_unconstrained}</text>'
    )
    if annotate_original_budget:
        original_x = x_pos(original_dsp)
        lines.append(
            f'<line x1="{original_x:.1f}" y1="{top_pad}" x2="{original_x:.1f}" y2="{top_pad + plot_height}" stroke="#6c757d" stroke-width="1.5" stroke-dasharray="3 3"/>'
        )
        lines.append(
            f'<text x="{original_x + 4:.1f}" y="{top_pad + 12:.1f}" font-size="10" fill="#495057">Original DSP count = {original_dsp}</text>'
        )
    lines.append("</svg>")
    return "".join(lines)


def render_resource_scaling_plot(name: str, payload: dict, *, width: int = 500, height: int = 300) -> str:
    svg = build_resource_scaling_svg(name, payload, width=width, height=height)
    return "<div class='tradeoff-card'>" + svg + "</div>"


def write_html_report(results: dict, summary: dict, output_path: Path) -> None:
    output_path.parent.mkdir(parents=True, exist_ok=True)
    palette = chart_palette()
    benchmark_names = list(results["benchmarks"].keys())
    environment = results.get("metadata", {}).get("environment", {})

    def latency_for(name: str, run_name: str) -> int:
        payload = results["benchmarks"][name]
        metrics = payload["runs"].get(run_name, {}).get("metrics")
        if metrics:
            return metrics["latency"]
        return payload["runs"]["weighted"]["metrics"]["latency"]

    def power_for(name: str, run_name: str) -> int:
        payload = results["benchmarks"][name]
        metrics = payload["runs"].get(run_name, {}).get("metrics")
        if metrics:
            return metric_value(metrics, "power")
        return metric_value(payload["runs"]["weighted"]["metrics"], "power")

    weighted_area = [
        results["benchmarks"][name]["runs"]["weighted"]["metrics"]["area"] for name in benchmark_names
    ]
    weighted_latency = [
        results["benchmarks"][name]["runs"]["weighted"]["metrics"]["latency"] for name in benchmark_names
    ]
    latency_unconstrained = [
        results["benchmarks"][name]["runs"]["latency_unconstrained"]["metrics"]["latency"]
        for name in benchmark_names
    ]
    power_unconstrained = [power_for(name, "power_unconstrained") for name in benchmark_names]
    weighted_power = [
        metric_value(results["benchmarks"][name]["runs"]["weighted"]["metrics"], "power")
        for name in benchmark_names
    ]
    weighted_dsp = [
        results["benchmarks"][name]["runs"]["weighted"]["metrics"]["dsp_count"] for name in benchmark_names
    ]
    latency_under_power = [
        latency_for(name, "latency_under_power") for name in benchmark_names
    ]
    zero_dsp_latency = [
        latency_for(name, "latency_under_dsp") for name in benchmark_names
    ]
    lut_cap_latency = [
        latency_for(name, "latency_under_lut") for name in benchmark_names
    ]
    original_area = [results["benchmarks"][name]["original_metrics"]["area"] for name in benchmark_names]
    original_latency = [results["benchmarks"][name]["original_metrics"]["latency"] for name in benchmark_names]
    original_power = [metric_value(results["benchmarks"][name]["original_metrics"], "power") for name in benchmark_names]
    original_dsp = [results["benchmarks"][name]["original_metrics"]["dsp_count"] for name in benchmark_names]
    runtime_values = [
        results["benchmarks"][name]["runs"]["weighted"]["stats"]["runtime_ms"] for name in benchmark_names
    ]
    pareto_counts = [
        len(unique_pareto_points(results["benchmarks"][name])) for name in benchmark_names
    ]
    weight_sweep_counts = [
        len(unique_weight_sweep_points(results["benchmarks"][name])) for name in benchmark_names
    ]

    charts = [
        render_horizontal_bar_chart(
            "Area Comparison",
            benchmark_names,
            [
                ("original", palette["original"], original_area),
                ("weighted", palette["weighted"], weighted_area),
            ],
        ),
        render_horizontal_bar_chart(
            "Latency Comparison",
            benchmark_names,
            [
                ("original", palette["original"], original_latency),
                ("weighted", palette["weighted"], weighted_latency),
                ("latency_unconstrained", palette["latency_unconstrained"], latency_unconstrained),
            ],
        ),
        render_horizontal_bar_chart(
            "Power Comparison",
            benchmark_names,
            [
                ("original", palette["original"], original_power),
                ("weighted", palette["weighted"], weighted_power),
                ("power_unconstrained", palette["power_unconstrained"], power_unconstrained),
            ],
        ),
        render_horizontal_bar_chart(
            "DSP Comparison",
            benchmark_names,
            [
                ("original", palette["original"], original_dsp),
                ("weighted", palette["weighted"], weighted_dsp),
            ],
        ),
        render_horizontal_bar_chart(
            "Latency Under Component Budgets",
            benchmark_names,
            [
                ("weighted", palette["weighted"], weighted_latency),
                ("latency_under_power", palette["latency_under_power"], latency_under_power),
                ("latency_under_dsp", palette["latency_under_dsp"], zero_dsp_latency),
                ("latency_under_lut", palette["latency_under_lut"], lut_cap_latency),
            ],
        ),
        render_horizontal_bar_chart(
            "Tradeoff Point Counts",
            benchmark_names,
            [
                ("pareto_2d", palette["pareto"], pareto_counts),
                ("weight_sweep", palette["weight_sweep"], weight_sweep_counts),
            ],
        ),
        render_percentage_chart(results),
        render_horizontal_bar_chart(
            "Weighted Runtime (ms)",
            benchmark_names,
            [
                ("runtime_ms", palette["pareto"], runtime_values),
            ],
        ),
    ]

    sections = [
        "<!doctype html><html><head><meta charset='utf-8'>"
        "<title>Datapath Benchmark Report</title>"
        "<style>"
        "body{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;background:#f7fafc;color:#102a43;margin:0;padding:32px;line-height:1.5;}"
        "h1,h2,h3,h4{margin:0 0 12px 0;}"
        "h1{font-size:32px;} h2{font-size:24px;margin-top:34px;} h3{font-size:18px;margin-top:24px;}"
        "p,li{color:#243b53;}"
        ".card-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(170px,1fr));gap:14px;margin:20px 0 28px 0;}"
        ".card{background:white;border:1px solid #d9e2ec;border-radius:14px;padding:16px 18px;box-shadow:0 6px 18px rgba(15,23,42,0.06);}"
        ".card-label{font-size:12px;text-transform:uppercase;letter-spacing:.06em;color:#627d98;margin-bottom:8px;}"
        ".card-value{font-size:28px;font-weight:700;color:#102a43;}"
        ".chart-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(520px,1fr));gap:18px;align-items:start;}"
        ".benchmark{background:white;border:1px solid #d9e2ec;border-radius:18px;padding:22px;margin-top:22px;box-shadow:0 8px 24px rgba(15,23,42,0.06);}"
        ".benchmark-grid{display:grid;grid-template-columns:1.1fr .9fr;gap:18px;align-items:start;}"
        ".run-table{width:100%;border-collapse:collapse;font-size:14px;}"
        ".run-table th,.run-table td{border-bottom:1px solid #e6edf3;padding:8px 10px;text-align:left;}"
        ".run-table th{font-size:12px;text-transform:uppercase;color:#627d98;letter-spacing:.04em;}"
        ".status-table{width:100%;border-collapse:collapse;font-size:13px;margin-top:14px;}"
        ".status-table th,.status-table td{border-bottom:1px solid #e6edf3;padding:7px 9px;text-align:left;}"
        ".status-table th{font-size:11px;text-transform:uppercase;color:#627d98;letter-spacing:.04em;}"
        ".expr{background:#f7fafc;border:1px solid #d9e2ec;border-radius:12px;padding:12px;overflow:auto;font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-size:13px;}"
        ".ir-code{background:#f7fafc;border:1px solid #d9e2ec;border-radius:12px;padding:12px;overflow:auto;font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-size:12px;line-height:1.5;white-space:pre-wrap;}"
        ".note-list{margin:10px 0 0 18px;padding:0;}"
        ".subtle{color:#627d98;font-size:14px;}"
        ".ir-comparison{display:grid;grid-template-columns:repeat(auto-fit,minmax(320px,1fr));gap:16px;margin-top:18px;}"
        ".ir-panel{background:#fff;border:1px solid #d9e2ec;border-radius:14px;padding:14px;}"
        ".chip-row{display:flex;flex-wrap:wrap;gap:8px;margin-bottom:12px;}"
        ".chip{background:#eef6f6;color:#1f4f46;border-radius:999px;padding:4px 10px;font-size:12px;font-weight:600;}"
        ".ir-subtitle{font-size:12px;text-transform:uppercase;letter-spacing:.06em;color:#627d98;margin:12px 0 8px 0;}"
        ".tradeoff-card{display:flex;flex-direction:column;gap:12px;}"
        ".curve-legend{display:flex;flex-wrap:wrap;gap:14px;color:#243b53;font-size:13px;}"
        ".curve-key{display:inline-flex;align-items:center;gap:8px;}"
        ".curve-line{display:inline-block;width:32px;border-top:3px solid #000;}"
        ".curve-line-pareto{border-top-style:dashed;}"
        ".curve-line-sweep{border-top-style:solid;}"
        ".point-legend{display:grid;gap:8px;}"
        ".point-entry{display:flex;gap:10px;align-items:flex-start;background:#f7fafc;border:1px solid #d9e2ec;border-radius:12px;padding:10px;}"
        ".point-badge{display:inline-flex;align-items:center;justify-content:center;width:24px;height:24px;border-radius:999px;color:#fff;font-size:12px;font-weight:700;flex:0 0 auto;}"
        ".plot-stack{display:grid;gap:18px;}"
        "@media (max-width: 980px){.benchmark-grid{grid-template-columns:1fr;}.chart-grid{grid-template-columns:1fr;}}"
        "</style></head><body>"
        "<h1>Datapath Benchmark Report</h1>"
        "<p class='subtle'>Auto-generated from the Rust optimizer benchmark JSON. This report separates the weighted tradeoff choice from the latency-optimal and power-optimal unconstrained results, overlays exact Pareto points with sampled weight-sweep points, and shows how latency improves as DSP budget increases. Power is modeled as a normalized analytical proxy, not a measured FPGA power estimate.</p>",
        f"<p class='subtle'>Environment: {html.escape(environment.get('platform', 'unknown platform'))}; machine={html.escape(environment.get('machine', 'unknown'))}; python={html.escape(environment.get('python_version', 'unknown'))}; rustc={html.escape(environment.get('rustc_version', 'unknown'))}; cargo={html.escape(environment.get('cargo_version', 'unknown'))}</p>",
        render_overview_cards(summary),
        render_cost_model_table(),
        render_baseline_constraint_table(results),
        render_main_comparison_table(results),
        "<h2>Cross-Benchmark Charts</h2>",
        '<div class="chart-grid">',
        *charts,
        "</div>",
        "<h2>Benchmark Details</h2>",
    ]

    for name, payload in results["benchmarks"].items():
        sections.append(f'<section class="benchmark"><h3>{html.escape(name)}</h3>')
        sections.append('<div class="benchmark-grid">')
        sections.append("<div>")
        sections.append(render_run_table(name, payload))
        sections.append("<h3>Status</h3>")
        sections.append(render_status_table(payload))
        sections.append("<h3>Analysis</h3><ul class='note-list'>")
        for line in benchmark_analysis_lines(name, payload):
            sections.append(f"<li>{html.escape(line)}</li>")
        sections.append("</ul>")
        sections.append(render_ir_comparison(payload))
        sections.append("</div>")
        sections.append("<div class='plot-stack'>")
        sections.append(render_resource_scaling_plot(name, payload))
        sections.append(render_tradeoff_plot(name, payload))
        sections.append("</div></div></section>")

    sections.append("</body></html>")
    output_path.write_text("".join(sections))


def rasterize_svg(svg_path: Path, png_path: Path) -> None:
    completed = subprocess.run(
        [
            "convert",
            "-background",
            "white",
            "-density",
            "192",
            str(svg_path),
            str(png_path),
        ],
        cwd=ROOT,
        text=True,
        capture_output=True,
    )
    if completed.returncode != 0:
        raise RuntimeError(
            f"failed to rasterize {svg_path.name}: {completed.stderr.strip() or completed.stdout.strip()}"
        )


def write_paper_figures(results: dict, output_dir: Path = DEFAULT_PAPER_FIGURES_DIR) -> dict:
    output_dir.mkdir(parents=True, exist_ok=True)
    if "fir8" not in results["benchmarks"]:
        raise KeyError("paper figure export expects the fir8 benchmark to be present")

    fir8_payload = results["benchmarks"]["fir8"]
    figures = {
        "suite_objective_tradeoffs": build_normalized_objective_comparison_svg(results),
        "suite_constraint_sensitivity": build_constraint_sensitivity_svg(results),
        "suite_dsp_scaling": build_suite_dsp_scaling_svg(results),
        "fir8_tradeoff": build_tradeoff_svg(
            "fir8",
            fir8_payload,
            width=640,
            height=420,
            annotate_selected=True,
        ),
        "fir8_dsp_scaling": build_resource_scaling_svg(
            "fir8",
            fir8_payload,
            width=640,
            height=360,
            annotate_original_budget=True,
        ),
    }

    written_paths = {}
    for stem, svg_text in figures.items():
        svg_path = output_dir / f"{stem}.svg"
        png_path = output_dir / f"{stem}.png"
        svg_path.write_text(svg_text)
        rasterize_svg(svg_path, png_path)
        written_paths[f"{stem}_svg"] = str(svg_path)
        written_paths[f"{stem}_png"] = str(png_path)
    return written_paths


def write_size_sweep_figures(results: dict, output_dir: Path = DEFAULT_PAPER_FIGURES_DIR) -> dict:
    output_dir.mkdir(parents=True, exist_ok=True)
    figures = {
        "size_sweep_frontier": build_size_sweep_frontier_svg(results),
        "size_sweep_scaling": build_size_sweep_scaling_svg(results),
    }
    written_paths = {}
    for stem, svg_text in figures.items():
        svg_path = output_dir / f"{stem}.svg"
        png_path = output_dir / f"{stem}.png"
        svg_path.write_text(svg_text)
        rasterize_svg(svg_path, png_path)
        written_paths[f"{stem}_svg"] = str(svg_path)
        written_paths[f"{stem}_png"] = str(png_path)
    return written_paths


def write_report_artifacts(
    results: dict,
    *,
    report_path: Path = DEFAULT_REPORT_PATH,
    analysis_path: Path = DEFAULT_ANALYSIS_PATH,
    summary_csv_path: Path = DEFAULT_SUMMARY_CSV_PATH,
) -> dict:
    summary = summarize_results(results)
    write_summary_csv(results, summary_csv_path)
    write_analysis_markdown(results, summary, analysis_path)
    write_html_report(results, summary, report_path)
    cost_model_artifacts = write_cost_model_artifacts()
    baseline_constraint_artifacts = write_baseline_constraint_artifacts(results)
    main_comparison_artifacts = write_main_comparison_artifacts(results)
    return {
        "report_path": report_path,
        "analysis_path": analysis_path,
        "summary_csv_path": summary_csv_path,
        **cost_model_artifacts,
        **baseline_constraint_artifacts,
        **main_comparison_artifacts,
    }


def run_suite(benchmarks: Dict[str, dict], config: dict | None = None) -> dict:
    active_config = config or load_benchmark_config()
    limits = active_config["saturation_limits"]
    results = {
        "metadata": {
            "config_path": active_config["config_path"],
            "cost_model_path": active_config["cost_model_path"],
            "baseline_multiply_mapping_policy": active_config[
                "baseline_multiply_mapping_policy"
            ],
            "saturation_limits": limits,
            "weight_sweep": [
                make_weights(w_area, w_latency, w_power)
                for w_area, w_latency, w_power in active_config["weight_sweep"]
            ],
            "budget_profiles": active_config["budget_profiles"],
            "dsp_budget_sweep": active_config["dsp_budget_sweep"],
            "environment": capture_environment_metadata(),
        },
        "benchmarks": {},
    }
    for name, graph in benchmarks.items():
        original = graph_metrics(graph)
        budget_profiles = active_config["budget_profiles"]
        latency_area_budgets = resolve_profile_budgets(
            name,
            budget_profiles["latency_under_area"],
            original,
        )
        area_latency_budgets = resolve_profile_budgets(
            name,
            budget_profiles["area_under_latency"],
            original,
        )
        latency_power_budgets = resolve_profile_budgets(
            name,
            budget_profiles["latency_under_power"],
            original,
        )
        power_latency_budgets = resolve_profile_budgets(
            name,
            budget_profiles["power_under_latency"],
            original,
        )
        zero_dsp_budgets = resolve_profile_budgets(
            name,
            budget_profiles["latency_under_dsp"],
            original,
        )
        lut_cap_budgets = resolve_profile_budgets(
            name,
            budget_profiles["latency_under_lut"],
            original,
        )
        weight_query_specs = []
        dsp_query_specs = []
        queries = [
            make_batch_query(
                "weighted",
                mode="weighted",
                objective="weighted",
            ),
            make_batch_query(
                "latency_unconstrained",
                mode="constrained",
                objective="latency",
            ),
            make_batch_query(
                "power_unconstrained",
                mode="constrained",
                objective="power",
            ),
            make_batch_query(
                "latency_under_area",
                mode="constrained",
                objective="latency",
                budgets=latency_area_budgets,
            ),
            make_batch_query(
                "area_under_latency",
                mode="constrained",
                objective="area",
                budgets=area_latency_budgets,
            ),
            make_batch_query(
                "latency_under_power",
                mode="constrained",
                objective="latency",
                budgets=latency_power_budgets,
            ),
            make_batch_query(
                "power_under_latency",
                mode="constrained",
                objective="power",
                budgets=power_latency_budgets,
            ),
            make_batch_query(
                "latency_under_dsp",
                mode="constrained",
                objective="latency",
                budgets=zero_dsp_budgets,
            ),
            make_batch_query(
                "latency_under_lut",
                mode="constrained",
                objective="latency",
                budgets=lut_cap_budgets,
            ),
            make_batch_query(
                "pareto_2d",
                mode="pareto_2d",
                objective="latency",
            ),
        ]
        for idx, (w_area, w_latency, w_power) in enumerate(active_config["weight_sweep"]):
            weights = make_weights(w_area, w_latency, w_power)
            query_name = f"weight_sweep_{idx}"
            weight_query_specs.append((query_name, weights))
            queries.append(
                make_batch_query(
                    query_name,
                    mode="weighted",
                    objective="weighted",
                    weights=weights,
                    label=weight_display_label(weights),
                )
            )
        for idx, dsp_max in enumerate(sweep_dsp_budgets(active_config, graph, original)):
            query_name = f"dsp_budget_{idx}"
            applied_budgets = {"dsp_max": dsp_max}
            dsp_query_specs.append((query_name, dsp_max, applied_budgets))
            queries.append(
                make_batch_query(
                    query_name,
                    mode="constrained",
                    objective="latency",
                    budgets=applied_budgets,
                )
            )

        batch_response = run_optimizer_batch(
            make_batch_request(
                name,
                graph,
                queries,
                saturation_limits=limits,
            )
        )
        if batch_response.get("message"):
            raise RuntimeError(
                f"batch optimizer failed for benchmark {name}: {batch_response['message']}"
            )
        shared_stats = batch_response.get("shared_stats", {})
        responses_by_name = {
            entry["name"]: entry for entry in batch_response.get("results", [])
        }

        def response_for(query_name: str) -> dict:
            if query_name not in responses_by_name:
                raise KeyError(f"batch response for {name} is missing query {query_name}")
            return responses_by_name[query_name]

        weight_run_results = []
        for query_name, weights in weight_query_specs:
            response = finalize_batch_run(
                response_for(query_name),
                shared_stats=shared_stats,
                applied_budgets={},
                label=weight_display_label(weights),
            )
            weight_run_results.append({"weights": weights, "response": response})

        runs = {
            "weighted": finalize_batch_run(
                response_for("weighted"),
                shared_stats=shared_stats,
            ),
            "latency_unconstrained": finalize_batch_run(
                response_for("latency_unconstrained"),
                shared_stats=shared_stats,
            ),
            "power_unconstrained": finalize_batch_run(
                response_for("power_unconstrained"),
                shared_stats=shared_stats,
            ),
            "latency_under_area": finalize_batch_run(
                response_for("latency_under_area"),
                shared_stats=shared_stats,
                applied_budgets=latency_area_budgets,
            ),
            "area_under_latency": finalize_batch_run(
                response_for("area_under_latency"),
                shared_stats=shared_stats,
                applied_budgets=area_latency_budgets,
            ),
            "latency_under_power": finalize_batch_run(
                response_for("latency_under_power"),
                shared_stats=shared_stats,
                applied_budgets=latency_power_budgets,
            ),
            "power_under_latency": finalize_batch_run(
                response_for("power_under_latency"),
                shared_stats=shared_stats,
                applied_budgets=power_latency_budgets,
            ),
            "latency_under_dsp": finalize_batch_run(
                response_for("latency_under_dsp"),
                shared_stats=shared_stats,
                applied_budgets=zero_dsp_budgets,
            ),
            "latency_under_lut": finalize_batch_run(
                response_for("latency_under_lut"),
                shared_stats=shared_stats,
                applied_budgets=lut_cap_budgets,
            ),
            "pareto_2d": finalize_batch_run(
                response_for("pareto_2d"),
                shared_stats=shared_stats,
            ),
        }
        dsp_budget_sweep = []
        for query_name, dsp_max, applied_budgets in dsp_query_specs:
            response = finalize_batch_run(
                response_for(query_name),
                shared_stats=shared_stats,
                applied_budgets=applied_budgets,
            )
            sweep_entry = {
                "dsp_max": dsp_max,
                "feasible": response["feasible"],
                "applied_budgets": response["applied_budgets"],
                "stats": response.get("stats", {}),
            }
            if response.get("metrics"):
                sweep_entry["metrics"] = response["metrics"]
                sweep_entry["score"] = response.get("score")
            if response.get("message"):
                sweep_entry["message"] = response["message"]
            dsp_budget_sweep.append(sweep_entry)
        results["benchmarks"][name] = {
            "original_ir": graph,
            "original_metrics": original,
            "shared_stats": shared_stats,
            "runs": runs,
            "weight_sweep": weight_run_results,
            "dsp_budget_sweep": dsp_budget_sweep,
        }
    return results


def run_size_sweep_suite(config: dict | None = None) -> dict:
    active_config = config or load_benchmark_config()
    limits = active_config["saturation_limits"]
    families = build_size_sweep_benchmark_families()
    results = {
        "metadata": {
            "config_path": active_config["config_path"],
            "cost_model_path": active_config["cost_model_path"],
            "baseline_multiply_mapping_policy": active_config[
                "baseline_multiply_mapping_policy"
            ],
            "saturation_limits": limits,
            "environment": capture_environment_metadata(),
            "family_sizes": SIZE_SWEEP_FAMILY_SIZES,
            "description": (
                "Synthetic size sweeps for FIR and dot-product families. "
                "Each benchmark is executed with weighted, constrained, and exact Pareto "
                "queries so the shared equality-saturation cost, query-time selection "
                "cost, and frontier growth can be plotted against op count."
            ),
        },
        "families": {},
    }

    for family_name, family_graphs in families.items():
        family_entries = []
        for size, graph in sorted(family_graphs.items()):
            benchmark_name = f"{family_name}{size}"
            original = graph_metrics(graph)
            latency_area_budgets = resolve_profile_budgets(
                benchmark_name,
                active_config["budget_profiles"]["latency_under_area"],
                original,
            )
            queries = [
                make_batch_query(
                    "weighted",
                    mode="weighted",
                    objective="weighted",
                ),
                make_batch_query(
                    "latency_under_area",
                    mode="constrained",
                    objective="latency",
                    budgets=latency_area_budgets,
                ),
                make_batch_query(
                    "pareto_2d",
                    mode="pareto_2d",
                    objective="latency",
                ),
            ]
            batch_response = run_optimizer_batch(
                make_batch_request(
                    benchmark_name,
                    graph,
                    queries,
                    saturation_limits=limits,
                )
            )
            if batch_response.get("message"):
                raise RuntimeError(
                    f"batch optimizer failed for size sweep benchmark {benchmark_name}: "
                    f"{batch_response['message']}"
                )
            shared_stats = batch_response.get("shared_stats", {})
            responses_by_name = {
                entry["name"]: entry for entry in batch_response.get("results", [])
            }

            weighted = finalize_batch_run(
                responses_by_name["weighted"],
                shared_stats=shared_stats,
            )
            latency_under_area = finalize_batch_run(
                responses_by_name["latency_under_area"],
                shared_stats=shared_stats,
                applied_budgets=latency_area_budgets,
            )
            pareto = finalize_batch_run(
                responses_by_name["pareto_2d"],
                shared_stats=shared_stats,
            )
            counts = graph_op_counts(graph)
            family_entries.append(
                {
                    "benchmark_name": benchmark_name,
                    "family": family_name,
                    "problem_size": size,
                    "op_count": arithmetic_op_count(graph),
                    "input_count": counts["input"],
                    "const_count": counts["const"],
                    "original_ir": graph,
                    "original_metrics": original,
                    "shared_stats": shared_stats,
                    "weighted": weighted,
                    "latency_under_area": latency_under_area,
                    "pareto_2d": pareto,
                    "pareto_points": len(pareto.get("frontier", [])),
                }
            )
        results["families"][family_name] = family_entries
    return results


def summarize_size_sweep_results(results: dict) -> dict:
    summary = {"families": {}, "overview": {}}
    runtimes = []
    pareto_points = []
    op_counts = []
    for family_name, entries in results["families"].items():
        sorted_entries = sorted(entries, key=lambda item: item["problem_size"])
        family_runtime = [shared_runtime_ms(entry["shared_stats"]) for entry in sorted_entries]
        family_saturation = [
            phase_runtime_ms(entry["shared_stats"], "saturation_runtime_us")
            for entry in sorted_entries
        ]
        family_frontier = [
            phase_runtime_ms(entry["shared_stats"], "frontier_runtime_us")
            for entry in sorted_entries
        ]
        family_selection = [
            selection_runtime_ms(entry.get("latency_under_area", {}))
            for entry in sorted_entries
        ]
        family_end_to_end = [
            shared + select
            for shared, select in zip(family_runtime, family_selection)
        ]
        family_pareto = [entry["pareto_points"] for entry in sorted_entries]
        family_ops = [entry["op_count"] for entry in sorted_entries]
        runtimes.extend(family_runtime)
        pareto_points.extend(family_pareto)
        op_counts.extend(family_ops)
        summary["families"][family_name] = {
            "sizes": [entry["problem_size"] for entry in sorted_entries],
            "op_counts": family_ops,
            "runtime_ms": family_runtime,
            "saturation_runtime_ms": family_saturation,
            "frontier_runtime_ms": family_frontier,
            "selection_runtime_ms": family_selection,
            "end_to_end_runtime_ms": family_end_to_end,
            "pareto_points": family_pareto,
            "max_runtime_ms": max(family_runtime) if family_runtime else 0,
            "max_pareto_points": max(family_pareto) if family_pareto else 0,
        }
    summary["overview"] = {
        "family_count": len(results["families"]),
        "point_count": len(runtimes),
        "max_runtime_ms": max(runtimes) if runtimes else 0,
        "max_pareto_points": max(pareto_points) if pareto_points else 0,
        "max_op_count": max(op_counts) if op_counts else 0,
    }
    return summary


def print_summary(results: dict) -> None:
    for name, payload in results["benchmarks"].items():
        original = payload["original_metrics"]
        weighted = payload["runs"]["weighted"]
        latency_unconstrained = payload["runs"]["latency_unconstrained"]
        power_unconstrained = payload["runs"].get("power_unconstrained", {})
        zero_dsp = payload["runs"]["latency_under_dsp"]
        lut_cap = payload["runs"].get("latency_under_lut", {})
        weight_points = len(unique_weight_sweep_points(payload))
        dsp_points = len(dsp_budget_sweep_entries(payload))
        print(f"\n{name}")
        print(
            "  original:"
            f" area={original['area']} latency={original['latency']}"
            f" power={metric_value(original, 'power')}"
            f" dsp={original['dsp_count']} lut={original['lut_count']}"
        )
        if weighted.get("metrics"):
            metrics = weighted["metrics"]
            print(
                "  weighted:"
                f" area={metrics['area']} latency={metrics['latency']}"
                f" power={metric_value(metrics, 'power')}"
                f" dsp={metrics['dsp_count']} lut={metrics['lut_count']}"
            )
        if latency_unconstrained.get("metrics"):
            metrics = latency_unconstrained["metrics"]
            print(
                "  latency-optimal:"
                f" area={metrics['area']} latency={metrics['latency']}"
                f" power={metric_value(metrics, 'power')}"
                f" dsp={metrics['dsp_count']} lut={metrics['lut_count']}"
            )
        if power_unconstrained.get("metrics"):
            metrics = power_unconstrained["metrics"]
            print(
                "  power-optimal:"
                f" area={metrics['area']} latency={metrics['latency']}"
                f" power={metric_value(metrics, 'power')}"
                f" dsp={metrics['dsp_count']} lut={metrics['lut_count']}"
            )
        if zero_dsp.get("metrics"):
            metrics = zero_dsp["metrics"]
            print(
                "  zero-dsp:"
                f" area={metrics['area']} latency={metrics['latency']}"
                f" power={metric_value(metrics, 'power')}"
                f" dsp={metrics['dsp_count']} lut={metrics['lut_count']}"
            )
        if lut_cap.get("metrics"):
            metrics = lut_cap["metrics"]
            print(
                "  lut-cap:"
                f" area={metrics['area']} latency={metrics['latency']}"
                f" power={metric_value(metrics, 'power')}"
                f" dsp={metrics['dsp_count']} lut={metrics['lut_count']}"
            )
        elif lut_cap:
            print(f"  lut-cap: {lut_cap.get('message', 'infeasible')}")
        print(f"  pareto points: {len(unique_pareto_points(payload))}")
        print(f"  weight-sweep points: {weight_points}")
        print(f"  dsp-sweep points: {dsp_points}")


def print_size_sweep_summary(results: dict) -> None:
    print("\nSynthetic size sweeps")
    for family_name, entries in results["families"].items():
        print(f"  {family_name}")
        for entry in sorted(entries, key=lambda item: item["problem_size"]):
            print(
                "   "
                f" size={entry['problem_size']}"
                f" ops={entry['op_count']}"
                f" runtime_ms={entry['shared_stats']['runtime_ms']}"
                f" pareto_points={entry['pareto_points']}"
                f" eclasses={entry['shared_stats']['eclasses']}"
                f" enodes={entry['shared_stats']['enodes']}"
            )


def main() -> None:
    parser = argparse.ArgumentParser(description="Run datapath optimizer benchmarks")
    parser.add_argument(
        "--config",
        default=str(DEFAULT_CONFIG_PATH),
        help="Path to benchmark/config JSON file",
    )
    parser.add_argument(
        "--output",
        default=str(DEFAULT_RESULTS_PATH),
        help="Path to write JSON results",
    )
    parser.add_argument(
        "--results-input",
        help="Use an existing benchmark JSON file instead of rerunning the optimizer",
    )
    parser.add_argument(
        "--report",
        default=str(DEFAULT_REPORT_PATH),
        help="Path to write the HTML report",
    )
    parser.add_argument(
        "--analysis",
        default=str(DEFAULT_ANALYSIS_PATH),
        help="Path to write the markdown analysis summary",
    )
    parser.add_argument(
        "--summary-csv",
        default=str(DEFAULT_SUMMARY_CSV_PATH),
        help="Path to write the flattened CSV summary",
    )
    parser.add_argument(
        "--paper-figures-dir",
        help="Optional directory for standalone paper SVG/PNG figures",
    )
    parser.add_argument(
        "--run-size-sweeps",
        action="store_true",
        help="Run synthetic FIR and dot-product size sweeps and write scaling artifacts",
    )
    parser.add_argument(
        "--size-sweep-output",
        help="Optional path to write synthetic size-sweep JSON results",
    )
    parser.add_argument(
        "--size-sweep-figures-dir",
        help="Optional directory for synthetic size-sweep SVG/PNG figures",
    )
    parser.add_argument(
        "--smoke",
        action="store_true",
        help="Run the toy smoke cases instead of the full acceptance suite",
    )
    args = parser.parse_args()

    output_path = Path(args.output)
    config = load_benchmark_config(Path(args.config))
    results_source = str(output_path)
    if args.results_input:
        results_source = args.results_input
        results = json.loads(Path(args.results_input).read_text())
    else:
        benchmarks = build_smoke_cases() if args.smoke else build_acceptance_benchmarks()
        results = run_suite(benchmarks, config)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(json.dumps(results, indent=2))

    artifacts = write_report_artifacts(
        results,
        report_path=Path(args.report),
        analysis_path=Path(args.analysis),
        summary_csv_path=Path(args.summary_csv),
    )
    figure_artifacts = {}
    if args.paper_figures_dir:
        figure_artifacts = write_paper_figures(results, Path(args.paper_figures_dir))
    run_size_sweeps = (
        args.run_size_sweeps
        or args.size_sweep_output is not None
        or args.size_sweep_figures_dir is not None
    )
    size_sweep_results = None
    size_sweep_figure_artifacts = {}
    size_sweep_output_path = None
    if run_size_sweeps:
        size_sweep_results = run_size_sweep_suite(config)
        size_sweep_output_path = Path(args.size_sweep_output or DEFAULT_SIZE_SWEEP_RESULTS_PATH)
        size_sweep_output_path.parent.mkdir(parents=True, exist_ok=True)
        size_sweep_output_path.write_text(json.dumps(size_sweep_results, indent=2))
        size_sweep_figures_dir = Path(
            args.size_sweep_figures_dir or args.paper_figures_dir or DEFAULT_PAPER_FIGURES_DIR
        )
        size_sweep_figure_artifacts = write_size_sweep_figures(
            size_sweep_results,
            size_sweep_figures_dir,
        )
    print_summary(results)
    if size_sweep_results:
        print_size_sweep_summary(size_sweep_results)
    if args.results_input:
        print(f"\nResults loaded from {results_source}")
    else:
        print(f"\nResults written to {results_source}")
    print(f"HTML report written to {artifacts['report_path']}")
    print(f"Analysis markdown written to {artifacts['analysis_path']}")
    print(f"CSV summary written to {artifacts['summary_csv_path']}")
    print(f"Cost model CSV written to {artifacts['cost_model_csv_path']}")
    print(f"Cost model markdown written to {artifacts['cost_model_markdown_path']}")
    print(f"Cost model JSON written to {artifacts['cost_model_json_path']}")
    print(f"Baseline constraints CSV written to {artifacts['baseline_constraints_csv_path']}")
    print(
        f"Baseline constraints markdown written to {artifacts['baseline_constraints_markdown_path']}"
    )
    print(f"Baseline constraints JSON written to {artifacts['baseline_constraints_json_path']}")
    print(f"Main comparison CSV written to {artifacts['main_comparison_csv_path']}")
    print(f"Main comparison markdown written to {artifacts['main_comparison_markdown_path']}")
    print(f"Main comparison JSON written to {artifacts['main_comparison_json_path']}")
    if figure_artifacts:
        print(f"Paper figures written to {Path(args.paper_figures_dir)}")
    if size_sweep_output_path:
        print(f"Size-sweep results written to {size_sweep_output_path}")
    if size_sweep_figure_artifacts:
        print(
            "Size-sweep figures written to "
            f"{Path(args.size_sweep_figures_dir or args.paper_figures_dir or DEFAULT_PAPER_FIGURES_DIR)}"
        )


if __name__ == "__main__":
    main()
