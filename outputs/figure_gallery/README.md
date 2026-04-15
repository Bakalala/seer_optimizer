# Figure Gallery

This folder contains every standalone plot generated from the benchmark results: report figures, HTML cross-benchmark charts, HTML per-benchmark plots, and synthetic size-sweep figures when available.

Total figures: 27

Open `index.html` for a visual gallery, or inspect `manifest.json` for a machine-readable list.

## Rebuild Commands

Regenerate the gallery from existing benchmark JSON:

```bash
./scripts/export_figure_gallery.py --include-size-sweeps --clean
```

Rerun benchmarks first, then regenerate the gallery:

```bash
./scripts/export_figure_gallery.py --refresh-results --include-size-sweeps --clean
```

## Paper Figures

- **Cross-Benchmark Objective Tradeoffs**
  - PNG: `paper/paper_suite_objective_tradeoffs.png`
  - SVG: `paper/paper_suite_objective_tradeoffs.svg`
  - Paper figure comparing optimized/baseline ratios for area, latency, and power across weighted, latency-optimal, and power-optimal extraction.
- **Constraint Sensitivity Across Benchmarks**
  - PNG: `paper/paper_suite_constraint_sensitivity.png`
  - SVG: `paper/paper_suite_constraint_sensitivity.svg`
  - Paper figure showing target-metric improvement from constrained queries relative to weighted extraction, with infeasible cells highlighted.
- **Latency Scaling Under Increasing DSP Budgets**
  - PNG: `paper/paper_suite_dsp_scaling.png`
  - SVG: `paper/paper_suite_dsp_scaling.svg`
  - Suite-level DSP budget curve showing best latency normalized to baseline latency as DSP budget increases.
- **fir8 Area-Latency Tradeoff**
  - PNG: `paper/paper_fir8_tradeoff.png`
  - SVG: `paper/paper_fir8_tradeoff.svg`
  - Representative paper figure showing weighted, latency-optimal, power-optimal, sampled weight-sweep, and Pareto points for fir8.
- **fir8 DSP Budget Scaling**
  - PNG: `paper/paper_fir8_dsp_scaling.png`
  - SVG: `paper/paper_fir8_dsp_scaling.svg`
  - Representative paper figure showing how the best fir8 latency changes as the allowed DSP budget increases.

## HTML Cross-Benchmark Charts

- **Area Comparison**
  - PNG: `html_cross_benchmark/html_area_comparison.png`
  - SVG: `html_cross_benchmark/html_area_comparison.svg`
  - HTML report chart comparing baseline area against weighted extraction area across benchmarks.
- **Latency Comparison**
  - PNG: `html_cross_benchmark/html_latency_comparison.png`
  - SVG: `html_cross_benchmark/html_latency_comparison.svg`
  - HTML report chart comparing baseline, weighted, and latency-optimal critical-path latency.
- **Power Comparison**
  - PNG: `html_cross_benchmark/html_power_comparison.png`
  - SVG: `html_cross_benchmark/html_power_comparison.svg`
  - HTML report chart comparing baseline, weighted, and power-optimal normalized power proxy.
- **DSP Comparison**
  - PNG: `html_cross_benchmark/html_dsp_comparison.png`
  - SVG: `html_cross_benchmark/html_dsp_comparison.svg`
  - HTML report chart showing how weighted extraction changes DSP use relative to baseline.
- **Latency Under Component Budgets**
  - PNG: `html_cross_benchmark/html_latency_under_component_budgets.png`
  - SVG: `html_cross_benchmark/html_latency_under_component_budgets.svg`
  - HTML report chart comparing weighted latency with latency under power, zero-DSP, and LUT-cap constraints.
- **Tradeoff Point Counts**
  - PNG: `html_cross_benchmark/html_tradeoff_point_counts.png`
  - SVG: `html_cross_benchmark/html_tradeoff_point_counts.svg`
  - HTML report chart comparing exact area-latency Pareto point counts with sampled weight-sweep point counts.
- **Weighted Metric Change vs Original (%)**
  - PNG: `html_cross_benchmark/html_weighted_metric_change.png`
  - SVG: `html_cross_benchmark/html_weighted_metric_change.svg`
  - HTML report diverging bar chart summarizing area, latency, DSP, and power changes from weighted extraction.
- **Weighted Runtime (ms)**
  - PNG: `html_cross_benchmark/html_weighted_runtime_ms.png`
  - SVG: `html_cross_benchmark/html_weighted_runtime_ms.svg`
  - HTML report chart showing weighted extraction runtime in milliseconds for each benchmark.

## HTML Per-Benchmark Plots

- **fir8: DSP Budget Scaling**
  - PNG: `html_per_benchmark/benchmark_fir8_dsp_scaling.png`
  - SVG: `html_per_benchmark/benchmark_fir8_dsp_scaling.svg`
  - HTML benchmark-detail plot showing best fir8 latency as the allowed DSP budget increases.
- **fir8: Area-Latency Tradeoff**
  - PNG: `html_per_benchmark/benchmark_fir8_area_latency_tradeoff.png`
  - SVG: `html_per_benchmark/benchmark_fir8_area_latency_tradeoff.svg`
  - HTML benchmark-detail plot showing exact Pareto points and sampled weight-sweep points for fir8.
- **dot16: DSP Budget Scaling**
  - PNG: `html_per_benchmark/benchmark_dot16_dsp_scaling.png`
  - SVG: `html_per_benchmark/benchmark_dot16_dsp_scaling.svg`
  - HTML benchmark-detail plot showing best dot16 latency as the allowed DSP budget increases.
- **dot16: Area-Latency Tradeoff**
  - PNG: `html_per_benchmark/benchmark_dot16_area_latency_tradeoff.png`
  - SVG: `html_per_benchmark/benchmark_dot16_area_latency_tradeoff.svg`
  - HTML benchmark-detail plot showing exact Pareto points and sampled weight-sweep points for dot16.
- **gemm_k8: DSP Budget Scaling**
  - PNG: `html_per_benchmark/benchmark_gemm_k8_dsp_scaling.png`
  - SVG: `html_per_benchmark/benchmark_gemm_k8_dsp_scaling.svg`
  - HTML benchmark-detail plot showing best gemm_k8 latency as the allowed DSP budget increases.
- **gemm_k8: Area-Latency Tradeoff**
  - PNG: `html_per_benchmark/benchmark_gemm_k8_area_latency_tradeoff.png`
  - SVG: `html_per_benchmark/benchmark_gemm_k8_area_latency_tradeoff.svg`
  - HTML benchmark-detail plot showing exact Pareto points and sampled weight-sweep points for gemm_k8.
- **gemm_blocked_k8: DSP Budget Scaling**
  - PNG: `html_per_benchmark/benchmark_gemm_blocked_k8_dsp_scaling.png`
  - SVG: `html_per_benchmark/benchmark_gemm_blocked_k8_dsp_scaling.svg`
  - HTML benchmark-detail plot showing best gemm_blocked_k8 latency as the allowed DSP budget increases.
- **gemm_blocked_k8: Area-Latency Tradeoff**
  - PNG: `html_per_benchmark/benchmark_gemm_blocked_k8_area_latency_tradeoff.png`
  - SVG: `html_per_benchmark/benchmark_gemm_blocked_k8_area_latency_tradeoff.svg`
  - HTML benchmark-detail plot showing exact Pareto points and sampled weight-sweep points for gemm_blocked_k8.
- **conv3x3: DSP Budget Scaling**
  - PNG: `html_per_benchmark/benchmark_conv3x3_dsp_scaling.png`
  - SVG: `html_per_benchmark/benchmark_conv3x3_dsp_scaling.svg`
  - HTML benchmark-detail plot showing best conv3x3 latency as the allowed DSP budget increases.
- **conv3x3: Area-Latency Tradeoff**
  - PNG: `html_per_benchmark/benchmark_conv3x3_area_latency_tradeoff.png`
  - SVG: `html_per_benchmark/benchmark_conv3x3_area_latency_tradeoff.svg`
  - HTML benchmark-detail plot showing exact Pareto points and sampled weight-sweep points for conv3x3.
- **stencil5: DSP Budget Scaling**
  - PNG: `html_per_benchmark/benchmark_stencil5_dsp_scaling.png`
  - SVG: `html_per_benchmark/benchmark_stencil5_dsp_scaling.svg`
  - HTML benchmark-detail plot showing best stencil5 latency as the allowed DSP budget increases.
- **stencil5: Area-Latency Tradeoff**
  - PNG: `html_per_benchmark/benchmark_stencil5_area_latency_tradeoff.png`
  - SVG: `html_per_benchmark/benchmark_stencil5_area_latency_tradeoff.svg`
  - HTML benchmark-detail plot showing exact Pareto points and sampled weight-sweep points for stencil5.

## Synthetic Size-Sweep Figures

- **Synthetic Size Sweep Frontier Growth**
  - PNG: `synthetic_size_sweep/synthetic_size_sweep_frontier.png`
  - SVG: `synthetic_size_sweep/synthetic_size_sweep_frontier.svg`
  - Synthetic sweep plot showing retained Pareto frontier size against arithmetic operation count for FIR and dot-product families.
- **Synthetic Size Sweep Scaling**
  - PNG: `synthetic_size_sweep/synthetic_size_sweep_scaling.png`
  - SVG: `synthetic_size_sweep/synthetic_size_sweep_scaling.svg`
  - Synthetic sweep plot showing optimizer runtime and retained frontier behavior as benchmark size increases.
