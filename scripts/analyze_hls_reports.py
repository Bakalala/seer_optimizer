#!/usr/bin/env python3
"""Create compact analysis tables and figures from Intel HLS validation reports."""

from __future__ import annotations

import argparse
import csv
import html
import math
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_HLS_DIR = ROOT / "outputs" / "hls_validation"
DEFAULT_REPORT_FIGURES = ROOT / "report" / "figures"

VARIANT_ORDER = [
    "original",
    "weighted",
    "latency_unconstrained",
    "power_unconstrained",
    "latency_under_dsp",
    "latency_under_lut",
]
VARIANT_LABELS = {
    "original": "Original",
    "weighted": "Weighted",
    "latency_unconstrained": "Lat-opt",
    "power_unconstrained": "Power-opt",
    "latency_under_dsp": "DSP cap",
    "latency_under_lut": "LUT cap",
}
BENCHMARK_LABELS = {
    "fir8": "fir8",
    "dot16": "dot16",
    "gemm_k8": "gemm-k8",
    "gemm_blocked_k8": "blocked-k8",
    "conv3x3": "conv3x3",
    "stencil5": "stencil5",
}
MODE_COLORS = {
    "default": "#2a9d8f",
    "prefer-dsp": "#e76f51",
    "prefer-softlogic": "#457b9d",
}
VARIANT_COLORS = {
    "original": "#6b7280",
    "weighted": "#2a9d8f",
    "latency_unconstrained": "#e76f51",
    "power_unconstrained": "#7b2cbf",
    "latency_under_dsp": "#f4a261",
    "latency_under_lut": "#457b9d",
}


def read_csv(path: Path) -> list[dict[str, str]]:
    with path.open(newline="") as handle:
        return list(csv.DictReader(handle))


def write_csv(path: Path, rows: list[dict[str, object]], fieldnames: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({name: row.get(name, "") for name in fieldnames})


def as_float(row: dict[str, str], key: str) -> float | None:
    value = row.get(key, "")
    if value in {"", "TBD", "None", None}:
        return None
    try:
        return float(value)
    except (TypeError, ValueError):
        return None


def ratio(numerator: float | None, denominator: float | None) -> float | None:
    if numerator is None or denominator in {None, 0}:
        return None
    return numerator / denominator


def pct_change_better(current: float | None, baseline: float | None) -> str:
    value = ratio(current, baseline)
    if value is None:
        return ""
    return f"{(1.0 - value) * 100.0:+.1f}%"


def run_parser(hls_dir: Path) -> Path:
    summary = hls_dir / "reports" / "hls_summary.csv"
    subprocess.run(
        [
            sys.executable,
            str(hls_dir / "scripts" / "parse_hls_reports.py"),
            "--root",
            str(hls_dir / "reports" / "hls"),
            "--metadata",
            str(hls_dir / "metadata" / "generated_variants.json"),
            "--out",
            str(summary),
        ],
        check=True,
    )
    return summary


def key(row: dict[str, str]) -> tuple[str, str, str]:
    return row["benchmark"], row["variant"], row["hls_mode"]


def default_rows(rows: list[dict[str, str]]) -> list[dict[str, str]]:
    return [row for row in rows if row["hls_mode"] == "default"]


def build_direction_checks(rows: list[dict[str, str]]) -> list[dict[str, object]]:
    by_key = {key(row): row for row in rows}
    checks: list[dict[str, object]] = []
    for row in default_rows(rows):
        benchmark = row["benchmark"]
        variant = row["variant"]
        if variant == "original":
            continue
        original = by_key.get((benchmark, "original", "default"))
        weighted = by_key.get((benchmark, "weighted", "default"))
        if not original or not weighted:
            continue
        expected_dsp = as_float(row, "expected_dsp")
        original_expected_dsp = as_float(original, "expected_dsp")
        hls_dsp = as_float(row, "hls_est_dsps")
        original_hls_dsp = as_float(original, "hls_est_dsps")
        hls_aluts = as_float(row, "hls_est_aluts")
        original_aluts = as_float(original, "hls_est_aluts")
        weighted_aluts = as_float(weighted, "hls_est_aluts")
        schedule = as_float(row, "hls_schedule_cycles")
        original_schedule = as_float(original, "hls_schedule_cycles")
        checks.append(
            {
                "benchmark": benchmark,
                "variant": variant,
                "expected_dsp_delta_vs_original": ""
                if expected_dsp is None or original_expected_dsp is None
                else expected_dsp - original_expected_dsp,
                "hls_dsp_delta_vs_original": ""
                if hls_dsp is None or original_hls_dsp is None
                else hls_dsp - original_hls_dsp,
                "hls_alut_change_vs_original": pct_change_better(hls_aluts, original_aluts),
                "hls_alut_change_vs_weighted": pct_change_better(hls_aluts, weighted_aluts),
                "hls_schedule_change_vs_original": pct_change_better(schedule, original_schedule),
                "dsp_direction_matches": ""
                if expected_dsp is None or original_expected_dsp is None or hls_dsp is None or original_hls_dsp is None
                else (
                    (expected_dsp - original_expected_dsp) == 0
                    or math.copysign(1, expected_dsp - original_expected_dsp)
                    == math.copysign(1, hls_dsp - original_hls_dsp)
                ),
            }
        )
    return checks


def build_validation_table(rows: list[dict[str, str]]) -> list[dict[str, object]]:
    table_rows: list[dict[str, object]] = []
    for benchmark in sorted({row["benchmark"] for row in rows}):
        bench_rows = [row for row in rows if row["benchmark"] == benchmark]
        default = [row for row in bench_rows if row["hls_mode"] == "default"]
        variants = sorted({row["variant"] for row in bench_rows})
        expected_dsps = [as_float(row, "expected_dsp") for row in default]
        expected_luts = [as_float(row, "expected_lut") for row in default]
        expected_dsps = [value for value in expected_dsps if value is not None]
        expected_luts = [value for value in expected_luts if value is not None]
        hls_tuples = {
            (
                row.get("hls_est_aluts", ""),
                row.get("hls_est_ffs", ""),
                row.get("hls_est_dsps", ""),
                row.get("hls_schedule_cycles", ""),
            )
            for row in bench_rows
        }
        representative = next((row for row in default if row["variant"] == "original"), default[0])
        varied = len(hls_tuples)
        table_rows.append(
            {
                "benchmark": benchmark,
                "variants": len(variants),
                "analytical_dsp_range": f"{int(min(expected_dsps))}-{int(max(expected_dsps))}" if expected_dsps else "",
                "analytical_lut_range": f"{int(min(expected_luts))}-{int(max(expected_luts))}" if expected_luts else "",
                "hls_original_alut_ff_dsp_cycles": (
                    f"{representative['hls_est_aluts']}/"
                    f"{representative['hls_est_ffs']}/"
                    f"{representative['hls_est_dsps']}/"
                    f"{representative['hls_schedule_cycles']}"
                ),
                "unique_hls_estimates": varied,
                "interpretation": "collapsed" if varied == 1 else "minor ALUT variation",
            }
        )
    return table_rows


def write_markdown_table(path: Path, rows: list[dict[str, object]], fieldnames: list[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    labels = [name.replace("_", " ") for name in fieldnames]
    lines = ["| " + " | ".join(labels) + " |", "| " + " | ".join(["---"] * len(labels)) + " |"]
    for row in rows:
        lines.append("| " + " | ".join(str(row.get(name, "")) for name in fieldnames) + " |")
    path.write_text("\n".join(lines) + "\n")


def scale(value: float, domain_min: float, domain_max: float, range_min: float, range_max: float) -> float:
    if domain_max == domain_min:
        return (range_min + range_max) / 2
    return range_min + (value - domain_min) / (domain_max - domain_min) * (range_max - range_min)


def svg_text(x: float, y: float, text: str, *, size: int = 12, anchor: str = "middle", weight: str = "400", color: str = "#102a43", rotate: str = "") -> str:
    transform = f' transform="{rotate}"' if rotate else ""
    return f'<text x="{x:.1f}" y="{y:.1f}" text-anchor="{anchor}" font-size="{size}" font-weight="{weight}" fill="{color}"{transform}>{html.escape(text)}</text>'


def save_svg_and_png(svg: str, svg_path: Path) -> None:
    svg_path.parent.mkdir(parents=True, exist_ok=True)
    svg_path.write_text(svg)
    png_path = svg_path.with_suffix(".png")
    subprocess.run(["convert", "-background", "white", "-density", "192", str(svg_path), str(png_path)], check=True)


def build_expected_vs_reported_dsp(rows: list[dict[str, str]]) -> str:
    width, height = 760, 470
    left, right, top, bottom = 70, 30, 82, 70
    points = []
    for row in rows:
        expected = as_float(row, "expected_dsp")
        actual = as_float(row, "hls_est_dsps")
        if expected is None or actual is None:
            continue
        points.append((expected, actual, row["hls_mode"], row["benchmark"], row["variant"]))
    max_val = max([max(x, y) for x, y, *_ in points] + [1])
    max_axis = math.ceil(max_val / 4) * 4
    plot_w = width - left - right
    plot_h = height - top - bottom
    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg">',
        svg_text(width / 2, 28, "Analytical DSP Intent vs Intel HLS Estimated DSPs", size=19, weight="700"),
        svg_text(width / 2, 50, "Each point is one benchmark/variant/mode; diagonal indicates exact agreement.", size=12, color="#486581"),
        f'<rect x="0" y="0" width="{width}" height="{height}" fill="white"/>',
    ]
    # Put title after background.
    lines.extend(
        [
            svg_text(width / 2, 28, "Analytical DSP Intent vs Intel HLS Estimated DSPs", size=19, weight="700"),
            svg_text(width / 2, 50, "Each point is one benchmark/variant/mode; diagonal indicates exact agreement.", size=12, color="#486581"),
        ]
    )
    for tick in range(0, max_axis + 1, max(1, max_axis // 4)):
        x = scale(tick, 0, max_axis, left, left + plot_w)
        y = scale(tick, 0, max_axis, top + plot_h, top)
        lines.append(f'<line x1="{left}" y1="{y:.1f}" x2="{left + plot_w}" y2="{y:.1f}" stroke="#e5e7eb"/>')
        lines.append(svg_text(left - 12, y + 4, str(tick), anchor="end", color="#486581"))
        lines.append(f'<line x1="{x:.1f}" y1="{top}" x2="{x:.1f}" y2="{top + plot_h}" stroke="#f1f5f9"/>')
        lines.append(svg_text(x, top + plot_h + 22, str(tick), color="#486581"))
    lines.append(f'<line x1="{left}" y1="{top + plot_h}" x2="{left + plot_w}" y2="{top + plot_h}" stroke="#334e68" stroke-width="1.4"/>')
    lines.append(f'<line x1="{left}" y1="{top}" x2="{left}" y2="{top + plot_h}" stroke="#334e68" stroke-width="1.4"/>')
    lines.append(f'<line x1="{left}" y1="{top + plot_h}" x2="{left + plot_w}" y2="{top}" stroke="#94a3b8" stroke-dasharray="5 5" stroke-width="1.5"/>')
    jitter = {"default": -4, "prefer-dsp": 0, "prefer-softlogic": 4}
    for expected, actual, mode, benchmark, variant in points:
        x = scale(expected, 0, max_axis, left, left + plot_w) + jitter.get(mode, 0)
        y = scale(actual, 0, max_axis, top + plot_h, top)
        color = MODE_COLORS.get(mode, "#111827")
        lines.append(f'<circle cx="{x:.1f}" cy="{y:.1f}" r="4.3" fill="{color}" fill-opacity="0.72"><title>{benchmark} {variant} {mode}</title></circle>')
    legend_x = left + 15
    for mode, color in MODE_COLORS.items():
        lines.append(f'<circle cx="{legend_x}" cy="68" r="5" fill="{color}" fill-opacity="0.8"/>')
        lines.append(svg_text(legend_x + 10, 72, mode, anchor="start", color="#243b53"))
        legend_x += 125
    lines.append(svg_text(width / 2, height - 20, "Analytical DSP count (normalized)", size=13, weight="600"))
    lines.append(svg_text(18, top + plot_h / 2, "Intel HLS estimated DSPs", size=13, weight="600", rotate=f"rotate(-90 18 {top + plot_h / 2})"))
    lines.append("</svg>")
    return "\n".join(lines)


def build_resource_modes(rows: list[dict[str, str]]) -> str:
    width, height = 880, 430
    top, bottom, left, right = 78, 78, 68, 30
    benchmark = "dot16"
    variants = ["original", "weighted", "power_unconstrained", "latency_under_dsp", "latency_unconstrained"]
    modes = ["default", "prefer-dsp", "prefer-softlogic"]
    by_key = {key(row): row for row in rows}
    max_alut = max(as_float(row, "hls_est_aluts") or 0 for row in rows if row["benchmark"] == benchmark)
    plot_h = height - top - bottom
    plot_w = width - left - right
    group_w = plot_w / len(variants)
    bar_w = group_w / (len(modes) + 1.4)
    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg">',
        f'<rect width="{width}" height="{height}" fill="white"/>',
        svg_text(width / 2, 28, "Intel HLS Resource Estimates for dot16", size=19, weight="700"),
        svg_text(width / 2, 50, "Grouped bars show ALUT estimates; labels above bars show estimated DSP blocks.", size=12, color="#486581"),
    ]
    for tick in range(0, int(max_alut) + 1, 250):
        y = scale(tick, 0, max_alut * 1.08, top + plot_h, top)
        lines.append(f'<line x1="{left}" y1="{y:.1f}" x2="{left + plot_w}" y2="{y:.1f}" stroke="#e5e7eb"/>')
        lines.append(svg_text(left - 10, y + 4, str(tick), anchor="end", color="#486581"))
    lines.append(f'<line x1="{left}" y1="{top + plot_h}" x2="{left + plot_w}" y2="{top + plot_h}" stroke="#334e68"/>')
    lines.append(f'<line x1="{left}" y1="{top}" x2="{left}" y2="{top + plot_h}" stroke="#334e68"/>')
    for i, variant in enumerate(variants):
        group_left = left + i * group_w + 12
        for j, mode in enumerate(modes):
            row = by_key.get((benchmark, variant, mode))
            if not row:
                continue
            aluts = as_float(row, "hls_est_aluts") or 0
            dsps = as_float(row, "hls_est_dsps")
            h = scale(aluts, 0, max_alut * 1.08, 0, plot_h)
            x = group_left + j * bar_w
            y = top + plot_h - h
            color = MODE_COLORS[mode]
            lines.append(f'<rect x="{x:.1f}" y="{y:.1f}" width="{bar_w - 3:.1f}" height="{h:.1f}" rx="2" fill="{color}"><title>{variant} {mode}: ALUT={aluts:.0f}, DSP={dsps}</title></rect>')
            if dsps is not None:
                lines.append(svg_text(x + (bar_w - 3) / 2, y - 5, f"D{int(dsps)}", size=10, color="#102a43"))
        lines.append(svg_text(group_left + 1.5 * bar_w, top + plot_h + 20, VARIANT_LABELS[variant], size=11, color="#243b53"))
    legend_x = left + 30
    for mode, color in MODE_COLORS.items():
        lines.append(f'<rect x="{legend_x}" y="62" width="12" height="12" fill="{color}" rx="2"/>')
        lines.append(svg_text(legend_x + 18, 72, mode, anchor="start", color="#243b53"))
        legend_x += 130
    lines.append(svg_text(20, top + plot_h / 2, "Estimated ALUTs", size=13, weight="600", rotate=f"rotate(-90 20 {top + plot_h / 2})"))
    lines.append("</svg>")
    return "\n".join(lines)


def build_variant_tradeoffs(rows: list[dict[str, str]]) -> str:
    width, height = 920, 470
    left, right, top, bottom = 74, 28, 82, 84
    rows = [row for row in rows if row["hls_mode"] == "default" and row["variant"] in VARIANT_ORDER]
    max_alut = max(as_float(row, "hls_est_aluts") or 0 for row in rows)
    max_dsp = max(as_float(row, "hls_est_dsps") or 0 for row in rows)
    plot_w = width - left - right
    plot_h = height - top - bottom
    lines = [
        f'<svg viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg">',
        f'<rect width="{width}" height="{height}" fill="white"/>',
        svg_text(width / 2, 28, "Default-Mode HLS Resource Tradeoffs", size=19, weight="700"),
        svg_text(width / 2, 50, "Each point is one generated variant; x is estimated ALUTs and y is estimated DSP blocks.", size=12, color="#486581"),
    ]
    for tick in range(0, int(max_alut) + 1, 250):
        x = scale(tick, 0, max_alut * 1.08, left, left + plot_w)
        lines.append(f'<line x1="{x:.1f}" y1="{top}" x2="{x:.1f}" y2="{top + plot_h}" stroke="#f1f5f9"/>')
        lines.append(svg_text(x, top + plot_h + 22, str(tick), color="#486581"))
    for tick in range(0, int(max_dsp) + 1, 8):
        y = scale(tick, 0, max_dsp * 1.15, top + plot_h, top)
        lines.append(f'<line x1="{left}" y1="{y:.1f}" x2="{left + plot_w}" y2="{y:.1f}" stroke="#e5e7eb"/>')
        lines.append(svg_text(left - 12, y + 4, str(tick), anchor="end", color="#486581"))
    lines.append(f'<line x1="{left}" y1="{top + plot_h}" x2="{left + plot_w}" y2="{top + plot_h}" stroke="#334e68"/>')
    lines.append(f'<line x1="{left}" y1="{top}" x2="{left}" y2="{top + plot_h}" stroke="#334e68"/>')
    bench_offsets = {name: index for index, name in enumerate(sorted({row["benchmark"] for row in rows}))}
    for row in rows:
        aluts = as_float(row, "hls_est_aluts")
        dsps = as_float(row, "hls_est_dsps")
        if aluts is None or dsps is None:
            continue
        x = scale(aluts, 0, max_alut * 1.08, left, left + plot_w) + (bench_offsets[row["benchmark"]] - 2.5) * 1.8
        y = scale(dsps, 0, max_dsp * 1.15, top + plot_h, top)
        variant = row["variant"]
        color = VARIANT_COLORS.get(variant, "#111827")
        lines.append(f'<circle cx="{x:.1f}" cy="{y:.1f}" r="5.2" fill="{color}" fill-opacity="0.78"><title>{row["benchmark"]} {variant}: ALUT={aluts:.0f}, DSP={dsps:.0f}</title></circle>')
    legend_x = left
    legend_y = height - 34
    for variant in VARIANT_ORDER:
        lines.append(f'<circle cx="{legend_x}" cy="{legend_y}" r="5" fill="{VARIANT_COLORS[variant]}" fill-opacity="0.8"/>')
        lines.append(svg_text(legend_x + 9, legend_y + 4, VARIANT_LABELS[variant], anchor="start", size=11, color="#243b53"))
        legend_x += 130
    lines.append(svg_text(width / 2, height - 12, "Intel HLS estimated ALUTs", size=13, weight="600"))
    lines.append(svg_text(20, top + plot_h / 2, "Intel HLS estimated DSPs", size=13, weight="600", rotate=f"rotate(-90 20 {top + plot_h / 2})"))
    lines.append("</svg>")
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(description="Analyze Intel HLS validation reports")
    parser.add_argument("--hls-dir", type=Path, default=DEFAULT_HLS_DIR)
    parser.add_argument("--report-figures-dir", type=Path, default=DEFAULT_REPORT_FIGURES)
    args = parser.parse_args()

    summary_path = run_parser(args.hls_dir)
    rows = read_csv(summary_path)
    analysis_dir = args.hls_dir / "analysis"
    analysis_dir.mkdir(parents=True, exist_ok=True)

    clean_fields = list(rows[0].keys()) if rows else []
    write_csv(analysis_dir / "hls_summary_clean.csv", rows, clean_fields)

    direction_checks = build_direction_checks(rows)
    direction_fields = [
        "benchmark",
        "variant",
        "expected_dsp_delta_vs_original",
        "hls_dsp_delta_vs_original",
        "hls_alut_change_vs_original",
        "hls_alut_change_vs_weighted",
        "hls_schedule_change_vs_original",
        "dsp_direction_matches",
    ]
    write_csv(analysis_dir / "hls_direction_checks.csv", direction_checks, direction_fields)

    validation_table = build_validation_table(rows)
    table_fields = [
        "benchmark",
        "variants",
        "analytical_dsp_range",
        "analytical_lut_range",
        "hls_original_alut_ff_dsp_cycles",
        "unique_hls_estimates",
        "interpretation",
    ]
    write_csv(analysis_dir / "hls_validation_table.csv", validation_table, table_fields)
    write_markdown_table(analysis_dir / "hls_validation_table.md", validation_table, table_fields)

    figures = {
        "hls_expected_vs_reported_dsp": build_expected_vs_reported_dsp(rows),
        "hls_resource_modes": build_resource_modes(rows),
        "hls_variant_tradeoffs": build_variant_tradeoffs(rows),
    }
    for name, svg in figures.items():
        save_svg_and_png(svg, analysis_dir / f"{name}.svg")
        save_svg_and_png(svg, args.report_figures_dir / f"{name}.svg")

    print(f"Parsed {len(rows)} HLS report rows")
    print(f"Wrote analysis outputs to {analysis_dir}")


if __name__ == "__main__":
    main()
