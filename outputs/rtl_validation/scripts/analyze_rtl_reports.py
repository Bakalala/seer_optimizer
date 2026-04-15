#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
import math
import shutil
import subprocess
from pathlib import Path


VARIANT_ORDER = [
    "original",
    "weighted",
    "latency_unconstrained",
    "power_unconstrained",
    "latency_under_dsp",
    "latency_under_lut",
]


def read_rows(path: Path) -> list[dict[str, str]]:
    with path.open() as handle:
        return list(csv.DictReader(handle))


def to_float(value: str) -> float | None:
    try:
        return float(value)
    except (TypeError, ValueError):
        return None


def write_csv(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def write_md(path: Path, rows: list[dict[str, str]], fields: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as handle:
        handle.write("| " + " | ".join(fields) + " |\n")
        handle.write("| " + " | ".join("---" for _ in fields) + " |\n")
        for row in rows:
            handle.write("| " + " | ".join(str(row.get(field, "")) for field in fields) + " |\n")


def svg_text(x: float, y: float, text: str, size: int = 12, anchor: str = "middle") -> str:
    return f'<text x="{x:.1f}" y="{y:.1f}" font-size="{size}" text-anchor="{anchor}" fill="#102a43">{text}</text>'


def save_svg_png(path: Path, svg: str) -> None:
    path.write_text(svg)
    convert = shutil.which("convert")
    if convert:
        subprocess.run([convert, str(path), str(path.with_suffix(".png"))], check=False)


def build_expected_vs_actual(rows: list[dict[str, str]]) -> str:
    pts = []
    for row in rows:
        x = to_float(row.get("rtl_intended_dsp_count", ""))
        y = to_float(row.get("quartus_dsp_blocks", ""))
        if x is not None and y is not None:
            pts.append((x, y, row["benchmark"], row["variant"]))
    width, height = 760, 440
    margin = 70
    max_v = max([1.0] + [max(x, y) for x, y, _, _ in pts])
    def sx(x): return margin + x / max_v * (width - 2 * margin)
    def sy(y): return height - margin - y / max_v * (height - 2 * margin)
    elems = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#ffffff"/>',
        svg_text(width / 2, 32, "RTL Intended DSPs vs Quartus Fitted DSPs", 18),
        f'<line x1="{margin}" y1="{height-margin}" x2="{width-margin}" y2="{height-margin}" stroke="#334e68"/>',
        f'<line x1="{margin}" y1="{margin}" x2="{margin}" y2="{height-margin}" stroke="#334e68"/>',
        f'<line x1="{sx(0)}" y1="{sy(0)}" x2="{sx(max_v)}" y2="{sy(max_v)}" stroke="#9fb3c8" stroke-dasharray="5 5"/>',
        svg_text(width / 2, height - 22, "RTL intended multiplier/MAC DSP count", 13),
        f'<text x="20" y="{height/2}" transform="rotate(-90 20 {height/2})" font-size="13" text-anchor="middle" fill="#102a43">Quartus fitted DSP blocks</text>',
    ]
    colors = {"original": "#1f77b4", "weighted": "#ff7f0e", "latency_unconstrained": "#2ca02c", "power_unconstrained": "#9467bd", "latency_under_dsp": "#d62728", "latency_under_lut": "#17becf"}
    for x, y, bench, variant in pts:
        elems.append(f'<circle cx="{sx(x):.1f}" cy="{sy(y):.1f}" r="5" fill="{colors.get(variant, "#333")}"><title>{bench}/{variant}</title></circle>')
    elems.append("</svg>")
    return "\n".join(elems)


def build_resource_tradeoff(rows: list[dict[str, str]]) -> str:
    pts = []
    for row in rows:
        x = to_float(row.get("quartus_dsp_blocks", ""))
        y = to_float(row.get("quartus_alm_or_alut", ""))
        if x is not None and y is not None:
            pts.append((x, y, row["benchmark"], row["variant"]))
    width, height = 760, 440
    margin = 70
    max_x = max([1.0] + [p[0] for p in pts])
    max_y = max([1.0] + [p[1] for p in pts])
    def sx(x): return margin + x / max_x * (width - 2 * margin)
    def sy(y): return height - margin - y / max_y * (height - 2 * margin)
    elems = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#ffffff"/>',
        svg_text(width / 2, 32, "RTL Resource Tradeoff After Quartus Fit", 18),
        f'<line x1="{margin}" y1="{height-margin}" x2="{width-margin}" y2="{height-margin}" stroke="#334e68"/>',
        f'<line x1="{margin}" y1="{margin}" x2="{margin}" y2="{height-margin}" stroke="#334e68"/>',
        svg_text(width / 2, height - 22, "Quartus fitted DSP blocks", 13),
        f'<text x="20" y="{height/2}" transform="rotate(-90 20 {height/2})" font-size="13" text-anchor="middle" fill="#102a43">Quartus ALM/ALUT estimate</text>',
    ]
    for x, y, bench, variant in pts:
        elems.append(f'<circle cx="{sx(x):.1f}" cy="{sy(y):.1f}" r="5" fill="#2f80ed"><title>{bench}/{variant}</title></circle>')
    elems.append("</svg>")
    return "\n".join(elems)


def build_fmax(rows: list[dict[str, str]]) -> str:
    data = [row for row in rows if to_float(row.get("quartus_fmax_mhz", "")) is not None]
    width, height = 900, 460
    margin = 70
    max_y = max([1.0] + [to_float(row["quartus_fmax_mhz"]) or 0 for row in data])
    groups = sorted({row["benchmark"] for row in data})
    group_w = (width - 2 * margin) / max(1, len(groups))
    bar_w = group_w / 8
    colors = {"original": "#1f77b4", "weighted": "#ff7f0e", "latency_unconstrained": "#2ca02c", "power_unconstrained": "#9467bd", "latency_under_dsp": "#d62728", "latency_under_lut": "#17becf"}
    def sy(y): return height - margin - y / max_y * (height - 2 * margin)
    elems = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="#ffffff"/>',
        svg_text(width / 2, 32, "Quartus STA Fmax by Variant", 18),
        f'<line x1="{margin}" y1="{height-margin}" x2="{width-margin}" y2="{height-margin}" stroke="#334e68"/>',
        f'<line x1="{margin}" y1="{margin}" x2="{margin}" y2="{height-margin}" stroke="#334e68"/>',
        f'<text x="22" y="{height/2}" transform="rotate(-90 22 {height/2})" font-size="13" text-anchor="middle" fill="#102a43">Fmax (MHz)</text>',
    ]
    for gi, bench in enumerate(groups):
        rows_b = {row["variant"]: row for row in data if row["benchmark"] == bench}
        base_x = margin + gi * group_w + group_w * 0.1
        elems.append(svg_text(margin + gi * group_w + group_w / 2, height - 40, bench, 11))
        for vi, variant in enumerate(VARIANT_ORDER):
            row = rows_b.get(variant)
            if not row:
                continue
            value = to_float(row["quartus_fmax_mhz"]) or 0
            x = base_x + vi * bar_w
            y = sy(value)
            elems.append(f'<rect x="{x:.1f}" y="{y:.1f}" width="{bar_w*0.8:.1f}" height="{height-margin-y:.1f}" fill="{colors.get(variant, "#333")}"><title>{bench}/{variant}: {value:.1f} MHz</title></rect>')
    elems.append("</svg>")
    return "\n".join(elems)


def main() -> None:
    parser = argparse.ArgumentParser(description="Analyze RTL Quartus validation reports")
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--summary", type=Path, required=True)
    args = parser.parse_args()
    rows = read_rows(args.summary)
    analysis = args.root / "analysis"
    analysis.mkdir(parents=True, exist_ok=True)
    table_fields = [
        "benchmark", "variant", "rtl_intended_dsp_count", "quartus_dsp_blocks",
        "quartus_alm_or_alut", "quartus_fmax_mhz", "quartus_worst_slack_ns",
        "timing_passed", "status",
    ]
    table_rows = [{field: row.get(field, "") for field in table_fields} for row in rows]
    write_csv(analysis / "rtl_validation_table.csv", table_rows, table_fields)
    write_md(analysis / "rtl_validation_table.md", table_rows, table_fields)
    save_svg_png(analysis / "rtl_expected_vs_actual_dsp.svg", build_expected_vs_actual(rows))
    save_svg_png(analysis / "rtl_resource_tradeoff.svg", build_resource_tradeoff(rows))
    save_svg_png(analysis / "rtl_fmax_by_variant.svg", build_fmax(rows))
    print(f"Wrote RTL analysis artifacts to {analysis}")


if __name__ == "__main__":
    main()
