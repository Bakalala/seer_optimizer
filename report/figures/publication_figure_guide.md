# Publication Figure Guide

## Figure 1: Cross-Benchmark Objective Tradeoffs

- File: `suite_objective_tradeoffs.png`
- Visualization type: grouped bar chart (method comparison)
- X-axis: benchmark (`fir8`, `dot16`, `gemm-k8`, `blocked-k8`, `conv3x3`, `stencil5`)
- Y-axis: `metric / baseline` ratio (unitless, lower is better)
- Series: weighted, latency-optimal, power-optimal
- Title: `Cross-Benchmark Objective Tradeoffs`
- Suggested caption:
  `Normalized area, latency, and power of the weighted, latency-optimal, and power-optimal extractions relative to the original baseline. Values below 1.0 indicate improvement. The figure shows that weighted extraction consistently reduces area, but often increases latency and power, while latency-optimal and power-optimal extraction select different operating points.`
- Interpretation:
  `This is the strongest cross-benchmark figure for the main paper because it shows both success cases and failure cases in one view. In particular, `conv3x3` is the only benchmark where the weighted objective improves all three metrics simultaneously, while `dot16`, `gemm-k8`, `blocked-k8`, and `stencil5` show the cost of eliminating DSPs too aggressively.`

## Figure 2: Constraint Sensitivity Across Benchmarks

- File: `suite_constraint_sensitivity.png`
- Visualization type: ablation heatmap
- X-axis: constraint profile, written as objective | hard constraint (`min Lat | Area cap`, `min Area | Lat cap`, `min Lat | Power cap`, `min Power | Lat cap`, `min Lat | DSP=0`, `min Lat | LUT cap`)
- Y-axis: benchmark
- Cell text: improvement in the constrained query's target metric relative to weighted extraction (percent)
- Title: `Constraint Sensitivity Across Benchmarks`
- Suggested caption:
  `Constraint-ablation matrix for the six benchmark kernels. Each cell reports the improvement in the constrained query's target metric relative to weighted extraction; red cells denote infeasible queries. The figure shows that explicit budgets materially alter extraction in every benchmark and exposes infeasible combinations for `dot16` under LUT and power limits.`
- Interpretation:
  `This is the best figure for the claim that budgets matter. It is especially useful because it captures both positive results and negative results. The zero-DSP column stays at 0% because weighted extraction already removes DSPs, while the LUT-cap and power-budget columns show where constraints force the optimizer away from the weighted point.`

## Figure 3: Latency Scaling Under Increasing DSP Budgets

- File: `suite_dsp_scaling.png`
- Visualization type: line plot / performance-vs-parameter curve
- X-axis: `allowed DSP budget / baseline DSP count` (unitless)
- Y-axis: `best latency / baseline latency` (unitless, lower is better)
- Series: one line per benchmark
- Title: `Latency Scaling Under Increasing DSP Budgets`
- Suggested caption:
  `Normalized latency as a function of normalized DSP budget for all benchmarks. The curves show a monotone reduction in latency as more DSP resources are allowed, with different saturation points across kernels. This demonstrates that the optimizer's constrained latency objective responds predictably to resource availability rather than producing isolated one-off improvements.`
- Interpretation:
  `This is the strongest scalability/resource-sensitivity figure available from the current experiments. It generalizes the single-benchmark DSP sweep and shows that the overall trend is consistent across the suite.`

## Existing Representative Figures

- `fir8_tradeoff.png`: best representative tradeoff scatter for a concrete benchmark.
- `fir8_dsp_scaling.png`: best single-case DSP scaling figure when only one detailed example fits in the paper.

## Recommended Use In A 6-Page Paper

- Main text:
  - `suite_objective_tradeoffs.png`
  - `suite_constraint_sensitivity.png`
- Representative case study:
  - `fir8_tradeoff.png`
- Optional replacement if you want a stronger scalability story:
  - `suite_dsp_scaling.png` instead of `fir8_dsp_scaling.png`

## Additional Plots Worth Adding After More Experiments

- Frontier quality vs input size:
  - Extend the synthetic families beyond FIR-32 and dot-64, then plot retained frontier size and infeasibility rate versus operation count to characterize where the bounded extractor breaks down.
- Robustness across runs:
  - Not meaningful yet because the current evaluation is deterministic and single-run.
- Hardware-calibrated validation:
  - After adding FPGA synthesis, plot analytical latency/area/power versus post-synthesis results to validate the cost model.

## New Synthetic Sweep Figure

- File: `size_sweep_frontier.png`
- Visualization type: line plot with infeasibility markers
- X-axis: `Arithmetic op count (mul + add)`
- Y-axis: `Pareto frontier size (points)`
- Title: `Pareto Frontier Size Under Synthetic Size Sweeps`
- Suggested caption:
  `Synthetic FIR-4/8/16/32 and dot-product-8/16/32/64 size sweeps. Retained Pareto frontier size initially grows with arithmetic op count, then collapses for the largest cases under the current bounded extractor. Cross markers denote runs where the Pareto query returned no retained frontier, highlighting a scalability limitation in frontier retention rather than rewrite saturation.`
- Interpretation:
  `This figure is useful because it adds one missing scalability experiment while keeping the focus on the meaningful failure mode. The main result is not runtime on this machine; it is that the retained Pareto set stops scaling on FIR-32, dot-32, and dot-64, so future work should target frontier capacity and pruning quality.`
