#!/usr/bin/env python3
"""Export every generated plot into one labeled figure gallery.

The benchmark harness embeds several plots directly in the HTML report and writes
only a subset as standalone paper figures. This script makes all of them
standalone, with SVG, PNG, a machine-readable manifest, and a browsable index.
"""

from __future__ import annotations

import argparse
import html
import json
import re
import shutil
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

import run_benchmarks as rb  # noqa: E402


DEFAULT_OUTPUT_DIR = ROOT / "outputs" / "figure_gallery"
DEFAULT_RESULTS = ROOT / "outputs" / "benchmark_results.json"
DEFAULT_SIZE_SWEEP_RESULTS = ROOT / "outputs" / "size_sweep_results.json"


@dataclass(frozen=True)
class FigureSpec:
    slug: str
    category: str
    title: str
    caption: str
    svg: str


def slugify(value: str) -> str:
    value = value.lower()
    value = re.sub(r"[^a-z0-9]+", "_", value)
    return value.strip("_")


def load_json(path: Path) -> dict:
    if not path.exists():
        raise FileNotFoundError(f"missing input JSON: {path}")
    return json.loads(path.read_text())


def benchmark_names(results: dict) -> list[str]:
    return list(results["benchmarks"].keys())


def html_cross_benchmark_figures(results: dict) -> list[FigureSpec]:
    palette = rb.chart_palette()
    names = benchmark_names(results)

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
            return rb.metric_value(metrics, "power")
        return rb.metric_value(payload["runs"]["weighted"]["metrics"], "power")

    weighted_area = [
        results["benchmarks"][name]["runs"]["weighted"]["metrics"]["area"] for name in names
    ]
    weighted_latency = [
        results["benchmarks"][name]["runs"]["weighted"]["metrics"]["latency"] for name in names
    ]
    latency_unconstrained = [
        results["benchmarks"][name]["runs"]["latency_unconstrained"]["metrics"]["latency"]
        for name in names
    ]
    power_unconstrained = [power_for(name, "power_unconstrained") for name in names]
    weighted_power = [
        rb.metric_value(results["benchmarks"][name]["runs"]["weighted"]["metrics"], "power")
        for name in names
    ]
    weighted_dsp = [
        results["benchmarks"][name]["runs"]["weighted"]["metrics"]["dsp_count"] for name in names
    ]
    latency_under_power = [latency_for(name, "latency_under_power") for name in names]
    zero_dsp_latency = [latency_for(name, "latency_under_dsp") for name in names]
    lut_cap_latency = [latency_for(name, "latency_under_lut") for name in names]
    original_area = [results["benchmarks"][name]["original_metrics"]["area"] for name in names]
    original_latency = [
        results["benchmarks"][name]["original_metrics"]["latency"] for name in names
    ]
    original_power = [
        rb.metric_value(results["benchmarks"][name]["original_metrics"], "power")
        for name in names
    ]
    original_dsp = [
        results["benchmarks"][name]["original_metrics"]["dsp_count"] for name in names
    ]
    runtime_values = [
        results["benchmarks"][name]["runs"]["weighted"]["stats"]["runtime_ms"] for name in names
    ]
    pareto_counts = [
        len(rb.unique_pareto_points(results["benchmarks"][name])) for name in names
    ]
    weight_sweep_counts = [
        len(rb.unique_weight_sweep_points(results["benchmarks"][name])) for name in names
    ]

    return [
        FigureSpec(
            slug="html_area_comparison",
            category="html_cross_benchmark",
            title="Area Comparison",
            caption="HTML report chart comparing baseline area against weighted extraction area across benchmarks.",
            svg=rb.render_horizontal_bar_chart(
                "Area Comparison",
                names,
                [
                    ("original", palette["original"], original_area),
                    ("weighted", palette["weighted"], weighted_area),
                ],
            ),
        ),
        FigureSpec(
            slug="html_latency_comparison",
            category="html_cross_benchmark",
            title="Latency Comparison",
            caption="HTML report chart comparing baseline, weighted, and latency-optimal critical-path latency.",
            svg=rb.render_horizontal_bar_chart(
                "Latency Comparison",
                names,
                [
                    ("original", palette["original"], original_latency),
                    ("weighted", palette["weighted"], weighted_latency),
                    (
                        "latency_unconstrained",
                        palette["latency_unconstrained"],
                        latency_unconstrained,
                    ),
                ],
            ),
        ),
        FigureSpec(
            slug="html_power_comparison",
            category="html_cross_benchmark",
            title="Power Comparison",
            caption="HTML report chart comparing baseline, weighted, and power-optimal normalized power proxy.",
            svg=rb.render_horizontal_bar_chart(
                "Power Comparison",
                names,
                [
                    ("original", palette["original"], original_power),
                    ("weighted", palette["weighted"], weighted_power),
                    ("power_unconstrained", palette["power_unconstrained"], power_unconstrained),
                ],
            ),
        ),
        FigureSpec(
            slug="html_dsp_comparison",
            category="html_cross_benchmark",
            title="DSP Comparison",
            caption="HTML report chart showing how weighted extraction changes DSP use relative to baseline.",
            svg=rb.render_horizontal_bar_chart(
                "DSP Comparison",
                names,
                [
                    ("original", palette["original"], original_dsp),
                    ("weighted", palette["weighted"], weighted_dsp),
                ],
            ),
        ),
        FigureSpec(
            slug="html_latency_under_component_budgets",
            category="html_cross_benchmark",
            title="Latency Under Component Budgets",
            caption="HTML report chart comparing weighted latency with latency under power, zero-DSP, and LUT-cap constraints.",
            svg=rb.render_horizontal_bar_chart(
                "Latency Under Component Budgets",
                names,
                [
                    ("weighted", palette["weighted"], weighted_latency),
                    ("latency_under_power", palette["latency_under_power"], latency_under_power),
                    ("latency_under_dsp", palette["latency_under_dsp"], zero_dsp_latency),
                    ("latency_under_lut", palette["latency_under_lut"], lut_cap_latency),
                ],
            ),
        ),
        FigureSpec(
            slug="html_tradeoff_point_counts",
            category="html_cross_benchmark",
            title="Tradeoff Point Counts",
            caption="HTML report chart comparing exact area-latency Pareto point counts with sampled weight-sweep point counts.",
            svg=rb.render_horizontal_bar_chart(
                "Tradeoff Point Counts",
                names,
                [
                    ("pareto_2d", palette["pareto"], pareto_counts),
                    ("weight_sweep", palette["weight_sweep"], weight_sweep_counts),
                ],
            ),
        ),
        FigureSpec(
            slug="html_weighted_metric_change",
            category="html_cross_benchmark",
            title="Weighted Metric Change vs Original (%)",
            caption="HTML report diverging bar chart summarizing area, latency, DSP, and power changes from weighted extraction.",
            svg=rb.render_percentage_chart(results),
        ),
        FigureSpec(
            slug="html_weighted_runtime_ms",
            category="html_cross_benchmark",
            title="Weighted Runtime (ms)",
            caption="HTML report chart showing weighted extraction runtime in milliseconds for each benchmark.",
            svg=rb.render_horizontal_bar_chart(
                "Weighted Runtime (ms)",
                names,
                [("runtime_ms", palette["pareto"], runtime_values)],
            ),
        ),
    ]


def paper_figures(results: dict) -> list[FigureSpec]:
    if "fir8" not in results["benchmarks"]:
        raise KeyError("paper figure export expects the fir8 benchmark to be present")
    fir8 = results["benchmarks"]["fir8"]
    return [
        FigureSpec(
            slug="paper_suite_objective_tradeoffs",
            category="paper",
            title="Cross-Benchmark Objective Tradeoffs",
            caption="Paper figure comparing optimized/baseline ratios for area, latency, and power across weighted, latency-optimal, and power-optimal extraction.",
            svg=rb.build_normalized_objective_comparison_svg(results),
        ),
        FigureSpec(
            slug="paper_suite_constraint_sensitivity",
            category="paper",
            title="Constraint Sensitivity Across Benchmarks",
            caption="Paper figure showing target-metric improvement from constrained queries relative to weighted extraction, with infeasible cells highlighted.",
            svg=rb.build_constraint_sensitivity_svg(results),
        ),
        FigureSpec(
            slug="paper_suite_dsp_scaling",
            category="paper",
            title="Latency Scaling Under Increasing DSP Budgets",
            caption="Suite-level DSP budget curve showing best latency normalized to baseline latency as DSP budget increases.",
            svg=rb.build_suite_dsp_scaling_svg(results),
        ),
        FigureSpec(
            slug="paper_fir8_tradeoff",
            category="paper",
            title="fir8 Area-Latency Tradeoff",
            caption="Representative paper figure showing weighted, latency-optimal, power-optimal, sampled weight-sweep, and Pareto points for fir8.",
            svg=rb.build_tradeoff_svg("fir8", fir8, width=640, height=420, annotate_selected=True),
        ),
        FigureSpec(
            slug="paper_fir8_dsp_scaling",
            category="paper",
            title="fir8 DSP Budget Scaling",
            caption="Representative paper figure showing how the best fir8 latency changes as the allowed DSP budget increases.",
            svg=rb.build_resource_scaling_svg(
                "fir8",
                fir8,
                width=640,
                height=360,
                annotate_original_budget=True,
            ),
        ),
    ]


def per_benchmark_figures(results: dict) -> list[FigureSpec]:
    figures: list[FigureSpec] = []
    for name, payload in results["benchmarks"].items():
        figures.append(
            FigureSpec(
                slug=f"benchmark_{slugify(name)}_dsp_scaling",
                category="html_per_benchmark",
                title=f"{name}: DSP Budget Scaling",
                caption=f"HTML benchmark-detail plot showing best {name} latency as the allowed DSP budget increases.",
                svg=rb.build_resource_scaling_svg(name, payload, width=500, height=300),
            )
        )
        figures.append(
            FigureSpec(
                slug=f"benchmark_{slugify(name)}_area_latency_tradeoff",
                category="html_per_benchmark",
                title=f"{name}: Area-Latency Tradeoff",
                caption=f"HTML benchmark-detail plot showing exact Pareto points and sampled weight-sweep points for {name}.",
                svg=rb.build_tradeoff_svg(name, payload, width=500, height=340),
            )
        )
    return figures


def size_sweep_figures(size_sweep_results: dict | None) -> list[FigureSpec]:
    if not size_sweep_results:
        return []
    return [
        FigureSpec(
            slug="synthetic_size_sweep_frontier",
            category="synthetic_size_sweep",
            title="Synthetic Size Sweep Frontier Growth",
            caption="Synthetic sweep plot showing retained Pareto frontier size against arithmetic operation count for FIR and dot-product families.",
            svg=rb.build_size_sweep_frontier_svg(size_sweep_results),
        ),
        FigureSpec(
            slug="synthetic_size_sweep_scaling",
            category="synthetic_size_sweep",
            title="Synthetic Size Sweep Scaling",
            caption="Synthetic sweep plot showing optimizer runtime and retained frontier behavior as benchmark size increases.",
            svg=rb.build_size_sweep_scaling_svg(size_sweep_results),
        ),
    ]


def all_figure_specs(results: dict, size_sweep_results: dict | None) -> list[FigureSpec]:
    figures: list[FigureSpec] = []
    figures.extend(paper_figures(results))
    figures.extend(html_cross_benchmark_figures(results))
    figures.extend(per_benchmark_figures(results))
    figures.extend(size_sweep_figures(size_sweep_results))
    return figures


def write_figure(spec: FigureSpec, output_dir: Path) -> dict:
    category_dir = output_dir / spec.category
    category_dir.mkdir(parents=True, exist_ok=True)
    svg_path = category_dir / f"{spec.slug}.svg"
    png_path = category_dir / f"{spec.slug}.png"
    svg_path.write_text(spec.svg)
    rb.rasterize_svg(svg_path, png_path)
    return {
        "slug": spec.slug,
        "category": spec.category,
        "title": spec.title,
        "caption": spec.caption,
        "svg": str(svg_path.relative_to(output_dir)),
        "png": str(png_path.relative_to(output_dir)),
    }


def write_manifest(output_dir: Path, entries: list[dict]) -> None:
    payload = {
        "generated_from": {
            "benchmark_results": str(DEFAULT_RESULTS.relative_to(ROOT)),
            "size_sweep_results": str(DEFAULT_SIZE_SWEEP_RESULTS.relative_to(ROOT)),
        },
        "figure_count": len(entries),
        "figures": entries,
    }
    (output_dir / "manifest.json").write_text(json.dumps(payload, indent=2))


def group_entries(entries: Iterable[dict]) -> dict[str, list[dict]]:
    grouped: dict[str, list[dict]] = {}
    for entry in entries:
        grouped.setdefault(entry["category"], []).append(entry)
    return grouped


def category_label(category: str) -> str:
    labels = {
        "paper": "Paper Figures",
        "html_cross_benchmark": "HTML Cross-Benchmark Charts",
        "html_per_benchmark": "HTML Per-Benchmark Plots",
        "synthetic_size_sweep": "Synthetic Size-Sweep Figures",
    }
    return labels.get(category, category.replace("_", " ").title())


def write_readme(output_dir: Path, entries: list[dict]) -> None:
    lines = [
        "# Figure Gallery",
        "",
        "This folder contains every standalone plot generated from the benchmark results: report figures, HTML cross-benchmark charts, HTML per-benchmark plots, and synthetic size-sweep figures when available.",
        "",
        f"Total figures: {len(entries)}",
        "",
        "Open `index.html` for a visual gallery, or inspect `manifest.json` for a machine-readable list.",
        "",
        "## Rebuild Commands",
        "",
        "Regenerate the gallery from existing benchmark JSON:",
        "",
        "```bash",
        "./scripts/export_figure_gallery.py --include-size-sweeps --clean",
        "```",
        "",
        "Rerun benchmarks first, then regenerate the gallery:",
        "",
        "```bash",
        "./scripts/export_figure_gallery.py --refresh-results --include-size-sweeps --clean",
        "```",
        "",
    ]
    for category, category_entries in group_entries(entries).items():
        lines.append(f"## {category_label(category)}")
        lines.append("")
        for entry in category_entries:
            lines.append(f"- **{entry['title']}**")
            lines.append(f"  - PNG: `{entry['png']}`")
            lines.append(f"  - SVG: `{entry['svg']}`")
            lines.append(f"  - {entry['caption']}")
        lines.append("")
    (output_dir / "README.md").write_text("\n".join(lines))


def write_index_html(output_dir: Path, entries: list[dict]) -> None:
    grouped = group_entries(entries)
    parts = [
        "<!doctype html><html><head><meta charset='utf-8'>",
        "<title>Figure Gallery</title>",
        "<style>",
        "body{font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;background:#f7fafc;color:#102a43;margin:0;padding:32px;line-height:1.45;}",
        "h1{margin:0 0 8px;font-size:34px} h2{margin:36px 0 16px;font-size:24px}",
        ".subtle{color:#627d98}.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(420px,1fr));gap:22px}",
        ".card{background:white;border:1px solid #d9e2ec;border-radius:18px;padding:18px;box-shadow:0 8px 24px rgba(15,23,42,.06)}",
        ".card img{display:block;max-width:100%;height:auto;border:1px solid #e6edf3;border-radius:10px;background:white}",
        ".caption{color:#334e68;margin:10px 0 0}.links{font-size:13px;margin-top:8px}.links a{color:#1d4ed8;text-decoration:none;margin-right:12px}",
        "</style></head><body>",
        "<h1>Figure Gallery</h1>",
        f"<p class='subtle'>Total figures: {len(entries)}. Generated from benchmark JSON artifacts.</p>",
    ]
    for category, category_entries in grouped.items():
        parts.append(f"<h2>{html.escape(category_label(category))}</h2><div class='grid'>")
        for entry in category_entries:
            png = html.escape(entry["png"])
            svg = html.escape(entry["svg"])
            parts.extend(
                [
                    "<article class='card'>",
                    f"<h3>{html.escape(entry['title'])}</h3>",
                    f"<a href='{png}'><img src='{png}' alt='{html.escape(entry['title'])}'></a>",
                    f"<p class='caption'>{html.escape(entry['caption'])}</p>",
                    f"<p class='links'><a href='{png}'>PNG</a><a href='{svg}'>SVG</a></p>",
                    "</article>",
                ]
            )
        parts.append("</div>")
    parts.append("</body></html>")
    (output_dir / "index.html").write_text("".join(parts))


def refresh_results(config_path: Path, results_path: Path, include_size_sweeps: bool) -> None:
    cmd = [
        sys.executable,
        str(ROOT / "run_benchmarks.py"),
        "--config",
        str(config_path),
        "--output",
        str(results_path),
    ]
    if include_size_sweeps:
        cmd.extend(
            [
                "--run-size-sweeps",
                "--size-sweep-output",
                str(DEFAULT_SIZE_SWEEP_RESULTS),
            ]
        )
    import subprocess

    subprocess.run(cmd, cwd=ROOT, check=True)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Export all benchmark plots into a labeled gallery")
    parser.add_argument("--results", type=Path, default=DEFAULT_RESULTS, help="Benchmark results JSON")
    parser.add_argument(
        "--size-sweep-results",
        type=Path,
        default=DEFAULT_SIZE_SWEEP_RESULTS,
        help="Optional synthetic size-sweep results JSON",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=DEFAULT_OUTPUT_DIR,
        help="Directory to write the figure gallery",
    )
    parser.add_argument(
        "--config",
        type=Path,
        default=ROOT / "benchmark_config.json",
        help="Config to use with --refresh-results",
    )
    parser.add_argument(
        "--refresh-results",
        action="store_true",
        help="Rerun the benchmark harness before exporting figures",
    )
    parser.add_argument(
        "--include-size-sweeps",
        action="store_true",
        help="Include size-sweep figures. Existing size-sweep JSON is used unless --refresh-results is also set.",
    )
    parser.add_argument(
        "--clean",
        action="store_true",
        help="Delete the output directory before writing the gallery",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    if args.refresh_results:
        refresh_results(args.config, args.results, args.include_size_sweeps)

    results = load_json(args.results)
    size_sweep_results = None
    if args.include_size_sweeps and args.size_sweep_results.exists():
        size_sweep_results = load_json(args.size_sweep_results)

    output_dir = args.output_dir
    if args.clean and output_dir.exists():
        shutil.rmtree(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    entries = [write_figure(spec, output_dir) for spec in all_figure_specs(results, size_sweep_results)]
    write_manifest(output_dir, entries)
    write_readme(output_dir, entries)
    write_index_html(output_dir, entries)

    print(f"Wrote {len(entries)} figures to {output_dir}")
    print(f"Open {output_dir / 'index.html'}")


if __name__ == "__main__":
    main()
