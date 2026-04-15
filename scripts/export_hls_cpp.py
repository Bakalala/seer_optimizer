#!/usr/bin/env python3
"""Export optimizer IR variants as Intel HLS-oriented C++ components."""

from __future__ import annotations

import argparse
import csv
import json
import re
import stat
from pathlib import Path
from typing import Iterable

import sys

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

import run_benchmarks


DEFAULT_RESULTS = ROOT / "outputs" / "benchmark_results.json"
DEFAULT_OUTPUT_DIR = ROOT / "outputs" / "hls_validation"
DEFAULT_BENCHMARKS = [
    "dot16",
    "gemm_blocked_k8",
    "stencil5",
    "fir8",
    "conv3x3",
    "gemm_k8",
]
DEFAULT_VARIANTS = [
    "original",
    "weighted",
    "latency_unconstrained",
    "power_unconstrained",
    "latency_under_dsp",
    "latency_under_lut",
]
LOCAL_TEST_VECTOR_COUNT = 1_000
LOCAL_TEST_MIN = -16
LOCAL_TEST_MAX = 16


def sanitize_identifier(value: str) -> str:
    cleaned = re.sub(r"[^a-zA-Z0-9_]", "_", value)
    if not cleaned:
        return "unnamed"
    if cleaned[0].isdigit():
        return f"_{cleaned}"
    return cleaned


def variant_graph_and_metrics(payload: dict, variant: str) -> tuple[dict | None, dict | None, str | None]:
    if variant == "original":
        return payload.get("original_ir"), payload.get("original_metrics"), None
    run = payload.get("runs", {}).get(variant)
    if not run:
        return None, None, f"variant {variant} is missing"
    if not run.get("feasible", False) or not run.get("optimized_ir"):
        return None, None, run.get("message") or f"variant {variant} is infeasible"
    return run.get("optimized_ir"), run.get("metrics"), None


def op_counts(graph: dict | None) -> dict[str, int]:
    counts = {op: 0 for op in run_benchmarks.OP_ROLES}
    if not graph:
        return counts
    for node in graph.get("ir_nodes", []):
        op = node["op"]
        counts[op] = counts.get(op, 0) + 1
    return counts


def input_names_from_graph(graph: dict) -> list[str]:
    names = sorted(
        {
            node["name"]
            for node in graph.get("ir_nodes", [])
            if node["op"] == "input"
        }
    )
    return names


def node_var(node_id: str) -> str:
    return sanitize_identifier(node_id)


def input_arg_name(input_name: str) -> str:
    return f"in_{sanitize_identifier(input_name)}"


def expression_for_node(node: dict) -> str:
    op = node["op"]
    inputs = [node_var(item) for item in node.get("inputs", [])]
    if op == "input":
        return input_arg_name(node["name"])
    if op == "const":
        return f"static_cast<hls_word_t>({int(node['value'])})"
    if op in {"add", "add_lut"}:
        return f"soft_add({inputs[0]}, {inputs[1]})"
    if op == "add_dsp":
        return f"dsp_add({inputs[0]}, {inputs[1]})"
    if op in {"sub", "sub_lut"}:
        return f"soft_sub({inputs[0]}, {inputs[1]})"
    if op == "sub_dsp":
        return f"dsp_sub({inputs[0]}, {inputs[1]})"
    if op in {"mul", "mul_dsp"}:
        return f"dsp_mul({inputs[0]}, {inputs[1]})"
    if op == "mul_lut":
        return f"soft_mul({inputs[0]}, {inputs[1]})"
    if op == "mac_dsp":
        return f"dsp_mac({inputs[0]}, {inputs[1]}, {inputs[2]})"
    raise ValueError(f"unsupported op {op}")


def op_comment(node: dict) -> str:
    metrics = run_benchmarks.SHARED_OP_METRICS.get(node["op"], {})
    return (
        f"// op: {node['op']}, analytical area={metrics.get('area', 0)} "
        f"latency={metrics.get('latency', 0)} power={metrics.get('power', 0)} "
        f"dsp={metrics.get('dsp_count', 0)} lut={metrics.get('lut_count', 0)}"
    )


def function_signature(
    function_name: str,
    input_names: Iterable[str],
    *,
    with_names: bool,
    component: bool,
) -> str:
    args = []
    for name in input_names:
        if with_names:
            args.append(f"hls_word_t {input_arg_name(name)}")
        else:
            args.append("hls_word_t")
    prefix = "HLS_COMPONENT " if component else ""
    return f"{prefix}hls_word_t {function_name}({', '.join(args)})"


def render_cpp_source(
    *,
    benchmark: str,
    variant: str,
    function_name: str,
    graph: dict,
    metrics: dict,
    benchmark_input_names: list[str],
) -> str:
    lines = [
        '#include "generated_datapaths.hpp"',
        "",
        f"// benchmark: {benchmark}",
        f"// variant: {variant}",
        (
            "// analytical metrics: "
            f"area={metrics['area']} latency={metrics['latency']} "
            f"power={metrics.get('power', 0)} dsp={metrics['dsp_count']} "
            f"lut={metrics['lut_count']}"
        ),
        f"// expression: {run_benchmarks.graph_to_expr_text(graph)}",
        "",
        f'extern "C" {function_signature(function_name, benchmark_input_names, with_names=True, component=True)} {{',
    ]
    for node in graph["ir_nodes"]:
        var = node_var(node["id"])
        expr = expression_for_node(node)
        lines.append(f"    {op_comment(node)}")
        lines.append(f"    hls_word_t {var} = {expr};")
        lines.append("")
    lines.append(f"    return {node_var(graph['root'])};")
    lines.append("}")
    lines.append("")
    return "\n".join(lines)


def render_header(functions: list[dict]) -> str:
    lines = [
        "#pragma once",
        "",
        "#include <cstdint>",
        "",
        "#if defined(__INTELFPGA_COMPILER__) || defined(HLS_INTEL)",
        '#include "HLS/hls.h"',
        '#include "HLS/math_dsp_control.h"',
        "#define HLS_COMPONENT component",
        "#else",
        "#define HLS_COMPONENT",
        "#endif",
        "#if defined(__has_cpp_attribute)",
        "#if __has_cpp_attribute(maybe_unused)",
        "#define HLS_MAYBE_UNUSED [[maybe_unused]]",
        "#else",
        "#define HLS_MAYBE_UNUSED",
        "#endif",
        "#else",
        "#define HLS_MAYBE_UNUSED",
        "#endif",
        "",
        "using hls_word_t = int32_t;",
        "",
        "template <typename F>",
        "static hls_word_t prefer_dsp(F f) {",
        "#if defined(__INTELFPGA_COMPILER__) || defined(HLS_INTEL)",
        "    hls_word_t out = 0;",
        "    ihc::math_dsp_control<ihc::Preference::DSP>([&] { out = f(); });",
        "    return out;",
        "#else",
        "    return f();",
        "#endif",
        "}",
        "",
        "template <typename F>",
        "static hls_word_t prefer_softlogic(F f) {",
        "#if defined(__INTELFPGA_COMPILER__) || defined(HLS_INTEL)",
        "    hls_word_t out = 0;",
        "    ihc::math_dsp_control<ihc::Preference::Softlogic>([&] { out = f(); });",
        "    return out;",
        "#else",
        "    return f();",
        "#endif",
        "}",
        "",
        "HLS_MAYBE_UNUSED static hls_word_t dsp_add(hls_word_t a, hls_word_t b) { return prefer_dsp([&] { return a + b; }); }",
        "HLS_MAYBE_UNUSED static hls_word_t soft_add(hls_word_t a, hls_word_t b) { return prefer_softlogic([&] { return a + b; }); }",
        "HLS_MAYBE_UNUSED static hls_word_t dsp_sub(hls_word_t a, hls_word_t b) { return prefer_dsp([&] { return a - b; }); }",
        "HLS_MAYBE_UNUSED static hls_word_t soft_sub(hls_word_t a, hls_word_t b) { return prefer_softlogic([&] { return a - b; }); }",
        "HLS_MAYBE_UNUSED static hls_word_t dsp_mul(hls_word_t a, hls_word_t b) { return prefer_dsp([&] { return a * b; }); }",
        "HLS_MAYBE_UNUSED static hls_word_t soft_mul(hls_word_t a, hls_word_t b) { return prefer_softlogic([&] { return a * b; }); }",
        "HLS_MAYBE_UNUSED static hls_word_t dsp_mac(hls_word_t acc, hls_word_t a, hls_word_t b) {",
        "    return prefer_dsp([&] { return acc + a * b; });",
        "}",
        "",
    ]
    for item in functions:
        lines.append(
            f'extern "C" {function_signature(item["function_name"], item["input_names"], with_names=False, component=False)};'
        )
    lines.append("")
    return "\n".join(lines)


def render_test_harness(functions: list[dict], test_vectors: int) -> str:
    functions_by_benchmark: dict[str, list[dict]] = {}
    for item in functions:
        functions_by_benchmark.setdefault(item["benchmark"], []).append(item)

    lines = [
        '#include "generated_datapaths.hpp"',
        "",
        "#include <array>",
        "#include <cstdint>",
        "#include <iostream>",
        "#include <random>",
        "#include <string>",
        "#include <vector>",
        "",
        f"static constexpr int kTestVectors = {test_vectors};",
        f"static constexpr int kInputMin = {LOCAL_TEST_MIN};",
        f"static constexpr int kInputMax = {LOCAL_TEST_MAX};",
        "",
        "int main() {",
        "    std::mt19937 rng(0x5eed1234);",
        "    std::uniform_int_distribution<int> dist(kInputMin, kInputMax);",
        "    int failures = 0;",
        "",
    ]

    for benchmark, items in sorted(functions_by_benchmark.items()):
        original = next(item for item in items if item["variant"] == "original")
        variants = [item for item in items if item["variant"] != "original"]
        input_count = len(original["input_names"])
        lines.extend(
            [
                f'    std::cout << "Testing {benchmark} ({len(variants)} optimized variants)..." << std::endl;',
                f"    for (int t = 0; t < kTestVectors; ++t) {{",
                f"        std::array<hls_word_t, {input_count}> inputs{{}};",
                f"        for (auto &value : inputs) value = static_cast<hls_word_t>(dist(rng));",
                (
                    f"        hls_word_t expected = {original['function_name']}("
                    + ", ".join(f"inputs[{idx}]" for idx in range(input_count))
                    + ");"
                ),
            ]
        )
        for variant in variants:
            call = (
                f"{variant['function_name']}("
                + ", ".join(f"inputs[{idx}]" for idx in range(input_count))
                + ")"
            )
            lines.extend(
                [
                    f"        hls_word_t actual_{variant['function_name']} = {call};",
                    f"        if (actual_{variant['function_name']} != expected) {{",
                    "            ++failures;",
                    (
                        f'            std::cerr << "Mismatch benchmark={benchmark} variant={variant["variant"]} vector=" << t'
                        f' << " expected=" << expected << " actual=" << actual_{variant["function_name"]} << std::endl;'
                    ),
                    '            std::cerr << "inputs:";',
                    "            for (const auto value : inputs) std::cerr << ' ' << value;",
                    "            std::cerr << std::endl;",
                    "            return 1;",
                    "        }",
                ]
            )
        lines.append("    }")
        lines.append("")
    lines.extend(
        [
            "    if (failures == 0) {",
            '        std::cout << "All generated datapath tests passed." << std::endl;',
            "    }",
            "    return failures == 0 ? 0 : 1;",
            "}",
            "",
        ]
    )
    return "\n".join(lines)


def render_run_cpp_tests() -> str:
    return """#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPORT_DIR="$ROOT_DIR/reports"
mkdir -p "$REPORT_DIR"

CXX="${CXX:-}"
if [[ -z "$CXX" ]]; then
  if command -v g++ >/dev/null 2>&1; then
    CXX=g++
  elif command -v clang++ >/dev/null 2>&1; then
    CXX=clang++
  else
    echo "No C++ compiler found. Set CXX=/path/to/compiler." >&2
    exit 1
  fi
fi

standards=()
if [[ -n "${CXX_STD:-}" ]]; then
  standards+=("$CXX_STD")
fi
standards+=(c++17 c++14 c++11 c++0x "")
compile_ok=0
for standard in "${standards[@]}"; do
  std_arg=()
  std_label="compiler default"
  if [[ -n "$standard" ]]; then
    std_arg=(-std="$standard")
    std_label="-std=$standard"
  fi
  echo "Compiling generated datapath tests with $CXX $std_label"
  if "$CXX" "${std_arg[@]}" -O2 -Wall -Wextra -I"$ROOT_DIR/src" \
      "$ROOT_DIR"/src/*.cpp "$ROOT_DIR/tests/test_generated_datapaths.cpp" \
      -o "$REPORT_DIR/generated_datapaths_test"; then
    compile_ok=1
    break
  fi
done

if [[ "$compile_ok" -ne 1 ]]; then
  echo "Failed to compile generated datapath tests. Set CXX=/path/to/newer/g++ or SKIP_CPP_TESTS=1 in the server runner." >&2
  exit 1
fi

"$REPORT_DIR/generated_datapaths_test" | tee "$REPORT_DIR/cpp_correctness.log"
"""


def render_run_intel_hls(functions: list[dict]) -> str:
    return """#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IXX="${INTEL_HLS_CXX:-i++}"
HLS_TARGET="${HLS_TARGET:-}"
MODE_SET="${HLS_DSP_MODES:-default prefer-dsp prefer-softlogic}"
SRC_GLOB="${HLS_SRC_GLOB:-*.cpp}"

if [[ -z "$HLS_TARGET" ]]; then
  echo "Set HLS_TARGET to your Intel FPGA target/part/family before running." >&2
  echo "Example: HLS_TARGET=<your_target> ./scripts/run_intel_hls.sh" >&2
  exit 1
fi

if ! command -v "$IXX" >/dev/null 2>&1; then
  echo "Intel HLS compiler not found: $IXX" >&2
  echo "Set INTEL_HLS_CXX=/path/to/i++ or put i++ on PATH." >&2
  exit 1
fi

shopt -s nullglob
sources=("$ROOT_DIR"/src/$SRC_GLOB)
if [[ "${#sources[@]}" -eq 0 ]]; then
  echo "No sources matched HLS_SRC_GLOB=$SRC_GLOB under $ROOT_DIR/src" >&2
  exit 1
fi

for src in "${sources[@]}"; do
  name="$(basename "$src" .cpp)"
  for mode in $MODE_SET; do
    build_dir="$ROOT_DIR/reports/hls/$name/$mode"
    mkdir -p "$build_dir"
    dsp_args=()
    if [[ "$mode" != "default" ]]; then
      dsp_args=(--dsp-mode="$mode")
    fi
    echo "Building $name with mode=$mode"
    (
      cd "$build_dir"
      if [[ "${#dsp_args[@]}" -gt 0 ]]; then
        "$IXX" -march="$HLS_TARGET" "${dsp_args[@]}" "$src" -o "$name" \
          > build.log 2>&1
      else
        "$IXX" -march="$HLS_TARGET" "$src" -o "$name" \
          > build.log 2>&1
      fi
    )
  done
done
"""


def render_parse_hls_reports() -> str:
    return """#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import json
import re
from pathlib import Path


def read_texts(path: Path) -> str:
    parts = []
    for candidate in path.rglob("*"):
        if candidate.is_file() and candidate.suffix.lower() in {".rpt", ".log", ".txt", ".html"}:
            try:
                parts.append(candidate.read_text(errors="ignore"))
            except OSError:
                pass
    return "\\n".join(parts)


def first_number(patterns: list[str], text: str) -> str:
    for pattern in patterns:
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            return match.group(1).replace(",", "")
    return ""


def main() -> None:
    parser = argparse.ArgumentParser(description="Parse Intel HLS/Quartus reports into CSV")
    parser.add_argument("--root", type=Path, default=Path("reports/hls"))
    parser.add_argument("--metadata", type=Path, default=Path("metadata/generated_variants.json"))
    parser.add_argument("--out", type=Path, default=Path("reports/hls_summary.csv"))
    args = parser.parse_args()

    metadata = json.loads(args.metadata.read_text())
    by_function = {item["function_name"]: item for item in metadata["variants"] if item["status"] == "generated"}
    rows = []
    for function_name, item in sorted(by_function.items()):
        function_root = args.root / function_name
        if not function_root.exists():
            rows.append({**item, "hls_mode": "", "report_path": str(function_root), "status": "missing_reports"})
            continue
        for mode_dir in sorted(path for path in function_root.iterdir() if path.is_dir()):
            text = read_texts(mode_dir)
            rows.append(
                {
                    "benchmark": item["benchmark"],
                    "variant": item["variant"],
                    "function_name": function_name,
                    "hls_mode": mode_dir.name,
                    "expected_dsp": item["metrics"]["dsp_count"],
                    "expected_lut": item["metrics"]["lut_count"],
                    "analytical_area": item["metrics"]["area"],
                    "analytical_latency": item["metrics"]["latency"],
                    "analytical_power": item["metrics"].get("power", ""),
                    "quartus_dsp": first_number([r"DSP[^\\n\\r]*?([0-9][0-9,]*)", r"Multiplier[^\\n\\r]*?([0-9][0-9,]*)"], text),
                    "quartus_alm_or_lut": first_number([r"ALM[^\\n\\r]*?([0-9][0-9,]*)", r"LUT[^\\n\\r]*?([0-9][0-9,]*)"], text),
                    "quartus_registers": first_number([r"Register[^\\n\\r]*?([0-9][0-9,]*)"], text),
                    "quartus_fmax_mhz": first_number([r"Fmax[^\\n\\r]*?([0-9]+(?:\\.[0-9]+)?)\\s*MHz"], text),
                    "quartus_power": first_number([r"Power[^\\n\\r]*?([0-9]+(?:\\.[0-9]+)?)"], text),
                    "report_path": str(mode_dir),
                    "status": "parsed",
                }
            )

    args.out.parent.mkdir(parents=True, exist_ok=True)
    fieldnames = [
        "benchmark",
        "variant",
        "function_name",
        "hls_mode",
        "expected_dsp",
        "expected_lut",
        "analytical_area",
        "analytical_latency",
        "analytical_power",
        "quartus_dsp",
        "quartus_alm_or_lut",
        "quartus_registers",
        "quartus_fmax_mhz",
        "quartus_power",
        "report_path",
        "status",
    ]
    with args.out.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({key: row.get(key, "") for key in fieldnames})
    print(f"Wrote {args.out}")


if __name__ == "__main__":
    main()
"""


def render_readme() -> str:
    return """# HLS Validation Export

This folder is generated from `outputs/benchmark_results.json`.

## Local correctness test

Run this on any machine with `g++` or `clang++`:

```bash
./scripts/run_cpp_tests.sh
```

This checks functional equivalence only. It does not measure area, latency, DSP,
LUT, or power.

## Intel HLS / Quartus run

Copy this folder to the Linux server with Intel HLS installed, then run:

```bash
HLS_TARGET=<your_fpga_target> ./scripts/run_intel_hls.sh
```

By default the script builds each variant in three modes:

```text
default
prefer-dsp
prefer-softlogic
```

You can override the mode list:

```bash
HLS_TARGET=<your_fpga_target> HLS_DSP_MODES="prefer-dsp prefer-softlogic" ./scripts/run_intel_hls.sh
```

## Report parsing

After Intel HLS runs:

```bash
python3 scripts/parse_hls_reports.py \
  --root reports/hls \
  --metadata metadata/generated_variants.json \
  --out reports/hls_summary.csv
```

Use `metadata/expected_resource_summary.csv` to compare analytical DSP/LUT
expectations with Quartus/HLS reports.
"""


def write_executable(path: Path, content: str) -> None:
    path.write_text(content)
    path.chmod(path.stat().st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)


def write_expected_summary_csv(path: Path, variants: list[dict]) -> None:
    fieldnames = [
        "benchmark",
        "variant",
        "function_name",
        "status",
        "area",
        "latency",
        "power",
        "expected_dsp",
        "expected_lut",
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
        "message",
    ]
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for item in variants:
            metrics = item.get("metrics") or {}
            counts = item.get("op_counts") or {}
            writer.writerow(
                {
                    "benchmark": item["benchmark"],
                    "variant": item["variant"],
                    "function_name": item.get("function_name", ""),
                    "status": item["status"],
                    "area": metrics.get("area", ""),
                    "latency": metrics.get("latency", ""),
                    "power": metrics.get("power", ""),
                    "expected_dsp": metrics.get("dsp_count", ""),
                    "expected_lut": metrics.get("lut_count", ""),
                    "add": counts.get("add", ""),
                    "add_dsp": counts.get("add_dsp", ""),
                    "add_lut": counts.get("add_lut", ""),
                    "sub": counts.get("sub", ""),
                    "sub_dsp": counts.get("sub_dsp", ""),
                    "sub_lut": counts.get("sub_lut", ""),
                    "mul": counts.get("mul", ""),
                    "mul_dsp": counts.get("mul_dsp", ""),
                    "mul_lut": counts.get("mul_lut", ""),
                    "mac_dsp": counts.get("mac_dsp", ""),
                    "message": item.get("message", ""),
                }
            )


def export_hls_cpp(
    *,
    results_path: Path,
    output_dir: Path,
    benchmarks: list[str],
    variants: list[str],
    test_vectors: int,
) -> dict:
    results = json.loads(results_path.read_text())
    src_dir = output_dir / "src"
    tests_dir = output_dir / "tests"
    scripts_dir = output_dir / "scripts"
    metadata_dir = output_dir / "metadata"
    reports_dir = output_dir / "reports"
    for directory in (src_dir, tests_dir, scripts_dir, metadata_dir, reports_dir):
        directory.mkdir(parents=True, exist_ok=True)

    generated_functions = []
    variant_metadata = []
    for benchmark in benchmarks:
        if benchmark not in results.get("benchmarks", {}):
            variant_metadata.append(
                {
                    "benchmark": benchmark,
                    "variant": "",
                    "status": "skipped",
                    "message": "benchmark missing from results",
                }
            )
            continue
        payload = results["benchmarks"][benchmark]
        benchmark_input_names = input_names_from_graph(payload["original_ir"])
        for variant in variants:
            graph, metrics, message = variant_graph_and_metrics(payload, variant)
            function_name = sanitize_identifier(f"{benchmark}_{variant}")
            if graph is None or metrics is None:
                variant_metadata.append(
                    {
                        "benchmark": benchmark,
                        "variant": variant,
                        "function_name": function_name,
                        "status": "skipped",
                        "message": message or "not generated",
                    }
                )
                continue
            metadata = {
                "benchmark": benchmark,
                "variant": variant,
                "function_name": function_name,
                "source_path": str(src_dir / f"{function_name}.cpp"),
                "status": "generated",
                "input_names": benchmark_input_names,
                "metrics": metrics,
                "op_counts": op_counts(graph),
                "expression": run_benchmarks.graph_to_expr_text(graph),
            }
            (src_dir / f"{function_name}.cpp").write_text(
                render_cpp_source(
                    benchmark=benchmark,
                    variant=variant,
                    function_name=function_name,
                    graph=graph,
                    metrics=metrics,
                    benchmark_input_names=benchmark_input_names,
                )
            )
            generated_functions.append(metadata)
            variant_metadata.append(metadata)

    (src_dir / "generated_datapaths.hpp").write_text(render_header(generated_functions))
    (tests_dir / "test_generated_datapaths.cpp").write_text(
        render_test_harness(generated_functions, test_vectors)
    )
    write_executable(scripts_dir / "run_cpp_tests.sh", render_run_cpp_tests())
    write_executable(scripts_dir / "run_intel_hls.sh", render_run_intel_hls(generated_functions))
    write_executable(scripts_dir / "parse_hls_reports.py", render_parse_hls_reports())
    (output_dir / "README.md").write_text(render_readme())

    metadata = {
        "results_path": str(results_path),
        "output_dir": str(output_dir),
        "benchmarks": benchmarks,
        "requested_variants": variants,
        "test_vectors": test_vectors,
        "variants": variant_metadata,
    }
    (metadata_dir / "generated_variants.json").write_text(json.dumps(metadata, indent=2))
    write_expected_summary_csv(metadata_dir / "expected_resource_summary.csv", variant_metadata)
    return metadata


def main() -> None:
    parser = argparse.ArgumentParser(description="Export optimized datapaths as Intel HLS C++")
    parser.add_argument("--results", type=Path, default=DEFAULT_RESULTS)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUTPUT_DIR)
    parser.add_argument("--benchmarks", nargs="+", default=DEFAULT_BENCHMARKS)
    parser.add_argument("--variants", nargs="+", default=DEFAULT_VARIANTS)
    parser.add_argument("--test-vectors", type=int, default=LOCAL_TEST_VECTOR_COUNT)
    args = parser.parse_args()

    metadata = export_hls_cpp(
        results_path=args.results,
        output_dir=args.out,
        benchmarks=args.benchmarks,
        variants=args.variants,
        test_vectors=args.test_vectors,
    )
    generated = sum(1 for item in metadata["variants"] if item["status"] == "generated")
    skipped = sum(1 for item in metadata["variants"] if item["status"] != "generated")
    print(f"Wrote {generated} generated C++ variants to {args.out}")
    if skipped:
        print(f"Skipped {skipped} infeasible or missing variants; see metadata/generated_variants.json")


if __name__ == "__main__":
    main()
