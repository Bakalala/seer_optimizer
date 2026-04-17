#!/usr/bin/env python3
"""Generate structural validation artifacts from optimizer benchmark results."""

import argparse
import csv
import json
import math
import struct
import subprocess
import sys
import zlib
from pathlib import Path
from typing import Dict, List, Optional, Tuple

ROOT = Path(__file__).resolve().parents[1]


DEFAULT_RESULTS = ROOT / "outputs" / "benchmark_results.json"
DEFAULT_OUT_DIR = ROOT / "outputs" / "variant_structure"
VARIANTS = [
    "original",
    "weighted",
    "latency_unconstrained",
    "latency_under_dsp",
    "latency_under_lut",
    "power_unconstrained",
]
BENCHMARK_ORDER = ["fir8", "dot16", "gemm_k8", "gemm_blocked_k8", "conv3x3", "stencil5"]
COLORS = {
    "add": "#4e79a7",
    "sub": "#59a14f",
    "mul": "#f28e2b",
    "mac": "#e15759",
    "area": "#4e79a7",
    "latency": "#f28e2b",
    "power": "#59a14f",
    "dsp": "#e15759",
    "lut": "#76b7b2",
}
OP_ROLES = [
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


def graph_to_expr_text(graph: Optional[dict]) -> str:
    if not graph:
        return "n/a"
    nodes = {node["id"]: node for node in graph.get("ir_nodes", [])}

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
            return "(mac_dsp {} {} {})".format(acc, left, right)
        left = render(node["inputs"][0])
        right = render(node["inputs"][1])
        if op == "add_dsp":
            return "({} +dsp {})".format(left, right)
        if op == "add_lut":
            return "({} +lut {})".format(left, right)
        if op == "sub_dsp":
            return "({} -dsp {})".format(left, right)
        if op == "sub_lut":
            return "({} -lut {})".format(left, right)
        if op == "mul_dsp":
            return "({} *dsp {})".format(left, right)
        if op == "mul_lut":
            return "({} *lut {})".format(left, right)
        symbol = {"add": "+", "sub": "-", "mul": "*"}[op]
        return "({} {} {})".format(left, symbol, right)

    return render(graph["root"])


def variant_graph_and_metrics(payload: dict, variant: str) -> Tuple[Optional[dict], Optional[dict], str]:
    if variant == "original":
        return payload.get("original_ir"), payload.get("original_metrics"), "generated"
    run = payload.get("runs", {}).get(variant)
    if not run:
        return None, None, "variant {} is missing".format(variant)
    if not run.get("feasible", False) or not run.get("optimized_ir"):
        return None, None, run.get("message") or "variant {} is infeasible".format(variant)
    return run.get("optimized_ir"), run.get("metrics"), "generated"


def op_counts(graph: Optional[dict]) -> Dict[str, int]:
    counts = {op: 0 for op in OP_ROLES}
    if not graph:
        return counts
    for node in graph.get("ir_nodes", []):
        op = node.get("op", "")
        counts[op] = counts.get(op, 0) + 1
    return counts


def int_metric(metrics: Optional[dict], key: str) -> str:
    if not metrics:
        return ""
    return str(metrics.get(key, ""))


def row_for_variant(benchmark: str, variant: str, payload: dict) -> Dict[str, str]:
    graph, metrics, status = variant_graph_and_metrics(payload, variant)
    counts = op_counts(graph)
    add_count = counts.get("add", 0) + counts.get("add_lut", 0) + counts.get("add_dsp", 0)
    sub_count = counts.get("sub", 0) + counts.get("sub_lut", 0) + counts.get("sub_dsp", 0)
    mul_count = counts.get("mul", 0) + counts.get("mul_lut", 0) + counts.get("mul_dsp", 0)
    mac_count = counts.get("mac_dsp", 0)
    dsp_mul = counts.get("mul", 0) + counts.get("mul_dsp", 0) + counts.get("mac_dsp", 0)
    lut_mul = counts.get("mul_lut", 0)
    dsp_addsub = counts.get("add_dsp", 0) + counts.get("sub_dsp", 0)
    lut_addsub = (
        counts.get("add", 0)
        + counts.get("add_lut", 0)
        + counts.get("sub", 0)
        + counts.get("sub_lut", 0)
    )
    return {
        "benchmark": benchmark,
        "variant": variant,
        "feasible/status": "feasible" if graph and metrics else status,
        "analytical_area": int_metric(metrics, "area"),
        "analytical_latency": int_metric(metrics, "latency"),
        "analytical_power": int_metric(metrics, "power"),
        "analytical_dsp_count": int_metric(metrics, "dsp_count"),
        "analytical_lut_count": int_metric(metrics, "lut_count"),
        "add_count": str(add_count),
        "sub_count": str(sub_count),
        "mul_count": str(mul_count),
        "mac_count": str(mac_count),
        "dsp_intended_mul_count": str(dsp_mul),
        "lut_intended_mul_count": str(lut_mul),
        "dsp_intended_addsub_count": str(dsp_addsub),
        "lut_intended_addsub_count": str(lut_addsub),
        "total_ops": str(add_count + sub_count + mul_count + mac_count),
        "expression_text": graph_to_expr_text(graph) if graph else status,
    }


def write_csv(path: Path, rows: List[Dict[str, str]], fields: List[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_md(path: Path, rows: List[Dict[str, str]], fields: List[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as handle:
        handle.write("| " + " | ".join(fields) + " |\n")
        handle.write("| " + " | ".join("---" for _ in fields) + " |\n")
        for row in rows:
            handle.write("| " + " | ".join(str(row.get(field, "")).replace("|", "\\|") for field in fields) + " |\n")


def numeric(row: Dict[str, str], key: str) -> Optional[float]:
    try:
        return float(row.get(key, ""))
    except ValueError:
        return None


def svg_text(x: float, y: float, text: str, size: int = 12, anchor: str = "middle") -> str:
    safe = (
        str(text)
        .replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
        .replace('"', "&quot;")
    )
    return f'<text x="{x:.1f}" y="{y:.1f}" font-size="{size}" text-anchor="{anchor}" fill="#111">{safe}</text>'


def write_png_placeholder(path: Path, width: int, height: int, bars: List[Tuple[int, int, int, int, Tuple[int, int, int]]]) -> None:
    pixels = bytearray([255, 255, 255] * width * height)
    for x, y, w, h, color in bars:
        for yy in range(max(0, y), min(height, y + h)):
            for xx in range(max(0, x), min(width, x + w)):
                idx = (yy * width + xx) * 3
                pixels[idx : idx + 3] = bytes(color)
    raw = b"".join(b"\x00" + pixels[row * width * 3 : (row + 1) * width * 3] for row in range(height))

    def chunk(kind: bytes, data: bytes) -> bytes:
        return struct.pack(">I", len(data)) + kind + data + struct.pack(">I", zlib.crc32(kind + data) & 0xFFFFFFFF)

    path.write_bytes(
        b"\x89PNG\r\n\x1a\n"
        + chunk(b"IHDR", struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0))
        + chunk(b"IDAT", zlib.compress(raw, 9))
        + chunk(b"IEND", b"")
    )


def hex_to_rgb(value: str) -> Tuple[int, int, int]:
    value = value.lstrip("#")
    return int(value[0:2], 16), int(value[2:4], 16), int(value[4:6], 16)


def save_svg_and_png(path: Path, svg: str, bars: List[Tuple[int, int, int, int, str]]) -> None:
    path.write_text(svg)
    png = path.with_suffix(".png")
    converted = False
    for cmd in (["convert", str(path), str(png)], ["rsvg-convert", "-o", str(png), str(path)]):
        try:
            result = subprocess.run(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
            if result.returncode == 0 and png.exists():
                converted = True
                break
        except FileNotFoundError:
            pass
    if not converted:
        write_png_placeholder(png, 900, 520, [(x, y, w, h, hex_to_rgb(c)) for x, y, w, h, c in bars])


def build_operation_mix(rows: List[Dict[str, str]]) -> Tuple[str, List[Tuple[int, int, int, int, str]]]:
    data = [row for row in rows if row["feasible/status"] == "feasible"]
    width, height = 1100, 620
    left, top, bottom = 70, 60, 110
    chart_h = height - top - bottom
    bar_w = max(5, (width - left - 30) / max(1, len(data)) * 0.72)
    step = (width - left - 30) / max(1, len(data))
    max_ops = max([1] + [sum(int(row[k]) for k in ["add_count", "sub_count", "mul_count", "mac_count"]) for row in data])
    elems = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#fff"/>',
        svg_text(width / 2, 28, "Operation mix by benchmark variant", 18),
        f'<line x1="{left}" y1="{height-bottom}" x2="{width-20}" y2="{height-bottom}" stroke="#333"/>',
        f'<line x1="{left}" y1="{top}" x2="{left}" y2="{height-bottom}" stroke="#333"/>',
    ]
    bars = []
    for idx, row in enumerate(data):
        x = left + idx * step + step * 0.12
        y = height - bottom
        for key, label, color in [
            ("add_count", "add", COLORS["add"]),
            ("sub_count", "sub", COLORS["sub"]),
            ("mul_count", "mul", COLORS["mul"]),
            ("mac_count", "mac", COLORS["mac"]),
        ]:
            h = int(row[key]) / max_ops * chart_h
            y -= h
            elems.append(f'<rect x="{x:.1f}" y="{y:.1f}" width="{bar_w:.1f}" height="{h:.1f}" fill="{color}"><title>{row["benchmark"]}/{row["variant"]} {label}: {row[key]}</title></rect>')
            bars.append((int(x), int(y), int(bar_w), max(1, int(h)), color))
        if idx % 2 == 0:
            elems.append(f'<text x="{x + bar_w/2:.1f}" y="{height-94}" font-size="8" text-anchor="end" transform="rotate(-55 {x + bar_w/2:.1f} {height-94})" fill="#111">{row["benchmark"]}/{row["variant"]}</text>')
    for i, (label, color) in enumerate([("add", COLORS["add"]), ("sub", COLORS["sub"]), ("mul", COLORS["mul"]), ("mac", COLORS["mac"])]):
        x = left + i * 90
        elems.append(f'<rect x="{x}" y="{height-42}" width="14" height="14" fill="{color}"/>')
        elems.append(svg_text(x + 42, height - 30, label, 11))
    elems.append("</svg>")
    return "\n".join(elems), bars


def build_metric_tradeoffs(rows: List[Dict[str, str]]) -> Tuple[str, List[Tuple[int, int, int, int, str]]]:
    data = [row for row in rows if row["feasible/status"] == "feasible"]
    width, height = 960, 540
    left, top, bottom = 70, 55, 90
    metrics = [("analytical_area", "area"), ("analytical_latency", "latency"), ("analytical_power", "power")]
    max_x = max([1.0] + [numeric(row, "analytical_area") or 0 for row in data])
    max_y = max([1.0] + [numeric(row, "analytical_latency") or 0 for row in data])
    def sx(v: float) -> float:
        return left + v / max_x * (width - left - 40)
    def sy(v: float) -> float:
        return height - bottom - v / max_y * (height - top - bottom)
    elems = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#fff"/>',
        svg_text(width / 2, 28, "Analytical area/latency tradeoff", 18),
        f'<line x1="{left}" y1="{height-bottom}" x2="{width-20}" y2="{height-bottom}" stroke="#333"/>',
        f'<line x1="{left}" y1="{top}" x2="{left}" y2="{height-bottom}" stroke="#333"/>',
        svg_text(width / 2, height - 25, "Analytical area", 13),
        f'<text x="22" y="{height/2}" transform="rotate(-90 22 {height/2})" font-size="13" text-anchor="middle" fill="#111">Analytical latency</text>',
    ]
    bars = []
    for row in data:
        area = numeric(row, "analytical_area")
        latency = numeric(row, "analytical_latency")
        power = numeric(row, "analytical_power") or 0
        if area is None or latency is None:
            continue
        r = 4 + min(12, power / max(1, max(numeric(rw, "analytical_power") or 0 for rw in data)) * 12)
        color = COLORS.get(row["variant"].split("_")[0], COLORS["area"])
        elems.append(f'<circle cx="{sx(area):.1f}" cy="{sy(latency):.1f}" r="{r:.1f}" fill="{color}" opacity="0.75"><title>{row["benchmark"]}/{row["variant"]}: area={area}, latency={latency}, power={power}</title></circle>')
        bars.append((int(sx(area) - r), int(sy(latency) - r), max(1, int(2 * r)), max(1, int(2 * r)), color))
    elems.append("</svg>")
    return "\n".join(elems), bars


def build_dsp_lut_intent(rows: List[Dict[str, str]]) -> Tuple[str, List[Tuple[int, int, int, int, str]]]:
    data = [row for row in rows if row["feasible/status"] == "feasible"]
    width, height = 1100, 620
    left, top, bottom = 70, 60, 110
    chart_h = height - top - bottom
    step = (width - left - 30) / max(1, len(data))
    bar_w = max(4, step * 0.32)
    max_v = max([1] + [int(row["dsp_intended_mul_count"]) + int(row["lut_intended_mul_count"]) for row in data])
    elems = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#fff"/>',
        svg_text(width / 2, 28, "DSP vs LUT multiplier intent by variant", 18),
        f'<line x1="{left}" y1="{height-bottom}" x2="{width-20}" y2="{height-bottom}" stroke="#333"/>',
        f'<line x1="{left}" y1="{top}" x2="{left}" y2="{height-bottom}" stroke="#333"/>',
    ]
    bars = []
    for idx, row in enumerate(data):
        x0 = left + idx * step + step * 0.12
        for offset, key, color in [(0, "dsp_intended_mul_count", COLORS["dsp"]), (bar_w + 2, "lut_intended_mul_count", COLORS["lut"])]:
            h = int(row[key]) / max_v * chart_h
            y = height - bottom - h
            elems.append(f'<rect x="{x0+offset:.1f}" y="{y:.1f}" width="{bar_w:.1f}" height="{h:.1f}" fill="{color}"><title>{row["benchmark"]}/{row["variant"]} {key}: {row[key]}</title></rect>')
            bars.append((int(x0 + offset), int(y), int(bar_w), max(1, int(h)), color))
        if idx % 2 == 0:
            elems.append(f'<text x="{x0 + bar_w:.1f}" y="{height-94}" font-size="8" text-anchor="end" transform="rotate(-55 {x0 + bar_w:.1f} {height-94})" fill="#111">{row["benchmark"]}/{row["variant"]}</text>')
    elems.append(f'<rect x="{left}" y="{height-42}" width="14" height="14" fill="{COLORS["dsp"]}"/>')
    elems.append(svg_text(left + 62, height - 30, "DSP-intended mul/MAC", 11))
    elems.append(f'<rect x="{left+170}" y="{height-42}" width="14" height="14" fill="{COLORS["lut"]}"/>')
    elems.append(svg_text(left + 240, height - 30, "LUT-intended mul", 11))
    elems.append("</svg>")
    return "\n".join(elems), bars


def delta_text(value: Optional[float], base: Optional[float]) -> str:
    if value is None or base is None:
        return "n/a"
    delta = value - base
    sign = "+" if delta > 0 else ""
    return f"{value:g} ({sign}{delta:g})"


def write_interpretation(path: Path, rows: List[Dict[str, str]]) -> None:
    by_bench = {}
    for row in rows:
        by_bench.setdefault(row["benchmark"], []).append(row)
    lines = [
        "# Structural Validation Interpretation",
        "",
        "The optimizer generates functionally equivalent RTL variants with different analytical and structural DSP/LUT intent. A real FPGA fitted-metric validation flow is implemented, but the available Quartus installation cannot produce fit/STA reports on this server, so no fitted FPGA improvement is claimed yet.",
        "",
        "This server is valid for Rust optimizer tests, Python benchmark tests, RTL generation, ModelSim functional equivalence, structural analytical validation, and Quartus preflight failure diagnosis. It is not valid for fitted ALM/DSP claims, Fmax claims, Quartus power claims, or any real-FPGA improvement statement.",
        "",
        "The tables and figures compare feasible optimizer-selected datapaths under the analytical cost model. They do not claim a globally best implementation; they show that constrained extraction selects different feasible implementations for different objectives and budgets.",
        "",
    ]
    for bench in sorted(by_bench, key=lambda b: BENCHMARK_ORDER.index(b) if b in BENCHMARK_ORDER else 999):
        bench_rows = {row["variant"]: row for row in by_bench[bench]}
        base = bench_rows.get("original")
        lines.append(f"## {bench}")
        if not base or base["feasible/status"] != "feasible":
            lines.append("Original variant is unavailable, so deltas are not computed.")
            lines.append("")
            continue
        base_area = numeric(base, "analytical_area")
        base_latency = numeric(base, "analytical_latency")
        base_power = numeric(base, "analytical_power")
        base_dsp = numeric(base, "analytical_dsp_count")
        base_lut = numeric(base, "analytical_lut_count")
        for variant in VARIANTS:
            row = bench_rows.get(variant)
            if not row:
                continue
            if row["feasible/status"] != "feasible":
                lines.append(f"- `{variant}` is infeasible or missing: {row['feasible/status']}.")
                continue
            area = delta_text(numeric(row, "analytical_area"), base_area)
            latency = delta_text(numeric(row, "analytical_latency"), base_latency)
            power = delta_text(numeric(row, "analytical_power"), base_power)
            dsp = delta_text(numeric(row, "analytical_dsp_count"), base_dsp)
            lut = delta_text(numeric(row, "analytical_lut_count"), base_lut)
            mix = (
                f"ops add/sub/mul/MAC={row['add_count']}/{row['sub_count']}/"
                f"{row['mul_count']}/{row['mac_count']}, "
                f"DSP-mul-intent={row['dsp_intended_mul_count']}, LUT-mul-intent={row['lut_intended_mul_count']}"
            )
            lines.append(
                f"- `{variant}`: area {area}, latency {latency}, power {power}, "
                f"DSP {dsp}, LUT {lut}; {mix}."
            )
        if bench == "dot16":
            row = bench_rows.get("latency_under_lut")
            if row and row["feasible/status"] != "feasible":
                lines.append("- `dot16/latency_under_lut` is explicitly infeasible under the requested LUT constraint, which is expected for a dot product with many multiplier sites.")
        lines.append("")
    path.write_text("\n".join(lines))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--results", type=Path, default=DEFAULT_RESULTS)
    parser.add_argument("--out-dir", type=Path, default=DEFAULT_OUT_DIR)
    args = parser.parse_args()

    data = json.loads(args.results.read_text())
    rows = []
    for benchmark in BENCHMARK_ORDER:
        payload = data.get("benchmarks", {}).get(benchmark)
        if not payload:
            continue
        for variant in VARIANTS:
            rows.append(row_for_variant(benchmark, variant, payload))

    fields = [
        "benchmark",
        "variant",
        "feasible/status",
        "analytical_area",
        "analytical_latency",
        "analytical_power",
        "analytical_dsp_count",
        "analytical_lut_count",
        "add_count",
        "sub_count",
        "mul_count",
        "mac_count",
        "dsp_intended_mul_count",
        "lut_intended_mul_count",
        "dsp_intended_addsub_count",
        "lut_intended_addsub_count",
        "total_ops",
        "expression_text",
    ]
    out = args.out_dir
    figures = out / "figures"
    out.mkdir(parents=True, exist_ok=True)
    figures.mkdir(parents=True, exist_ok=True)

    write_csv(out / "variant_structure_summary.csv", rows, fields)
    (out / "variant_structure_summary.json").write_text(json.dumps(rows, indent=2))
    comparison_fields = [
        "benchmark",
        "variant",
        "feasible/status",
        "analytical_area",
        "analytical_latency",
        "analytical_power",
        "analytical_dsp_count",
        "analytical_lut_count",
        "dsp_intended_mul_count",
        "lut_intended_mul_count",
        "total_ops",
    ]
    comparison_rows = [{field: row.get(field, "") for field in comparison_fields} for row in rows]
    write_csv(out / "main_structural_comparison.csv", comparison_rows, comparison_fields)
    write_md(out / "main_structural_comparison.md", comparison_rows, comparison_fields)
    write_md(out / "variant_structure_table.md", rows, fields)
    write_interpretation(out / "interpretation.md", rows)

    svg, bars = build_operation_mix(rows)
    save_svg_and_png(figures / "operation_mix_by_variant.svg", svg, bars)
    svg, bars = build_metric_tradeoffs(rows)
    save_svg_and_png(figures / "analytical_metric_tradeoffs.svg", svg, bars)
    svg, bars = build_dsp_lut_intent(rows)
    save_svg_and_png(figures / "dsp_lut_intent_by_variant.svg", svg, bars)
    print(f"Wrote structural validation artifacts to {out}")


if __name__ == "__main__":
    main()
