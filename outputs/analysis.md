# Benchmark Analysis

- Benchmarks evaluated: 6
- Average weighted area reduction: 40.9%
- Average weighted latency change (positive is better): -13.7%
- Average weighted power reduction: -44.6%
- Average latency improvement with no budgets: 41.7%
- Average power reduction with no budgets: 7.8%
- Average weighted DSP reduction: 100.0%
- Average weighted runtime: 526.0 ms
- Average Pareto points: 10.5
- Average distinct weight-sweep points: 3.0
- Average DSP-sweep points: 18.0
- Average latency gain across DSP scaling: 9.5
- Strongest area improvement: conv3x3
- Strongest Latency Improvement: conv3x3
- Strongest weighted power improvement: conv3x3

## Cross-Benchmark Observations

- At least one strict component budget forced a different implementation on: fir8, dot16, gemm_k8, gemm_blocked_k8, conv3x3, stencil5.
- Power-aware budgets changed the chosen implementation on: fir8, dot16, gemm_k8, gemm_blocked_k8, conv3x3, stencil5.
- The new latency-unconstrained run should be read as the fastest datapath reachable within the bounded search, while the DSP-budget sweep shows how quickly that latency can be recovered as FPGA resources increase.
- The new power-unconstrained run is a normalized analytical proxy objective, not a synthesis-calibrated FPGA power claim.
- Exact Pareto extraction now exposes multi-point frontiers on average, which confirms the cost model has a real area-latency conflict.
- Sweeping area/latency/power weights produces multiple distinct weighted-optimal points, which is a practical sampled tradeoff curve for the report.

## Per-Benchmark Notes

### fir8

- Weighted extraction changed area 55 -> 25 (54.5% reduction), latency 17 -> 18 (5.9% increase), power 31 -> 33 (6.5% increase).
- Latency-optimal extraction with no budgets reached latency 9 with area 38, power 31, DSP 10, and LUT 10.
- Power-optimal extraction with no budgets reached power 21 with area 33, latency 16, DSP 4, and LUT 9.
- DSP count changed 8 -> 0 (100.0% reduction) while LUT count changed 7 -> 41 (+485.7%).
- Across the DSP-budget sweep, latency moved from 18 at dsp_max=0 to 9 at dsp_max=15, which quantifies the benefit of a larger FPGA budget on this datapath.
- With the configured power budget (power_max=31), the optimizer returned area 38, latency 9, power 31, DSP 10, LUT 10.
- With the configured latency ceiling (latency_max=17), power-aware extraction returned area 33, latency 16, power 21, DSP 4, LUT 9.
- With the configured zero-DSP budget (dsp_max=0), the optimizer returned area 25, latency 18, power 33, DSP 0, LUT 41.
- With the configured LUT-cap budget (lut_max=7), the optimizer returned area 40, latency 9, power 28, DSP 11, LUT 2, which pushes the solution back toward DSP-heavy implementations.
- At least one constrained run diverged from the weighted solution, which means the explicit budgets are shaping extraction.
- Sweeping area/latency weights produced 3 distinct weighted-optimal points, which gives a readable sampled Pareto curve.
- The Pareto frontier exposed 10 nondominated solutions, indicating a visible area-latency tradeoff.

### dot16

- Weighted extraction changed area 111 -> 79 (28.8% reduction), latency 33 -> 36 (9.1% increase), power 63 -> 111 (76.2% increase).
- Latency-optimal extraction with no budgets reached latency 21 with area 94, power 126, DSP 15, and LUT 128.
- Power-optimal extraction with no budgets reached power 90 with area 93, latency 33, DSP 7, and LUT 87.
- DSP count changed 16 -> 0 (100.0% reduction) while LUT count changed 15 -> 143 (+853.3%).
- Across the DSP-budget sweep, latency moved from 36 at dsp_max=0 to 21 at dsp_max=31, which quantifies the benefit of a larger FPGA budget on this datapath.
- With the configured latency ceiling (latency_max=33), power-aware extraction returned area 93, latency 33, power 90, DSP 7, LUT 87.
- With the configured zero-DSP budget (dsp_max=0), the optimizer returned area 79, latency 36, power 111, DSP 0, LUT 143.
- With the configured LUT-cap budget (lut_max=15), no feasible solution was found inside the bounded extraction frontier, which shows the constraint is stricter than the retained tradeoff set for this benchmark.
- At least one constrained run diverged from the weighted solution, which means the explicit budgets are shaping extraction.
- Sweeping area/latency weights produced 3 distinct weighted-optimal points, which gives a readable sampled Pareto curve.
- The Pareto frontier exposed 16 nondominated solutions, indicating a visible area-latency tradeoff.

### gemm_k8

- Weighted extraction changed area 55 -> 39 (29.1% reduction), latency 17 -> 20 (17.6% increase), power 31 -> 55 (77.4% increase).
- Latency-optimal extraction with no budgets reached latency 10 with area 54, power 50, DSP 11, and LUT 32.
- Power-optimal extraction with no budgets reached power 31 with area 55, latency 17, DSP 8, and LUT 7.
- DSP count changed 8 -> 0 (100.0% reduction) while LUT count changed 7 -> 71 (+914.3%).
- Across the DSP-budget sweep, latency moved from 20 at dsp_max=0 to 10 at dsp_max=15, which quantifies the benefit of a larger FPGA budget on this datapath.
- With the configured power budget (power_max=31), the optimizer returned area 55, latency 17, power 31, DSP 8, LUT 7.
- With the configured latency ceiling (latency_max=17), power-aware extraction returned area 55, latency 17, power 31, DSP 8, LUT 7.
- With the configured zero-DSP budget (dsp_max=0), the optimizer returned area 39, latency 20, power 55, DSP 0, LUT 71.
- With the configured LUT-cap budget (lut_max=7), the optimizer returned area 55, latency 17, power 31, DSP 8, LUT 7, which pushes the solution back toward DSP-heavy implementations.
- At least one constrained run diverged from the weighted solution, which means the explicit budgets are shaping extraction.
- Sweeping area/latency weights produced 3 distinct weighted-optimal points, which gives a readable sampled Pareto curve.
- The Pareto frontier exposed 11 nondominated solutions, indicating a visible area-latency tradeoff.

### gemm_blocked_k8

- Weighted extraction changed area 55 -> 39 (29.1% reduction), latency 11 -> 14 (27.3% increase), power 31 -> 55 (77.4% increase).
- Latency-optimal extraction with no budgets reached latency 7 with area 62, power 38, DSP 15, and LUT 0.
- Power-optimal extraction with no budgets reached power 31 with area 55, latency 11, DSP 8, and LUT 7.
- DSP count changed 8 -> 0 (100.0% reduction) while LUT count changed 7 -> 71 (+914.3%).
- Across the DSP-budget sweep, latency moved from 14 at dsp_max=0 to 7 at dsp_max=15, which quantifies the benefit of a larger FPGA budget on this datapath.
- With the configured power budget (power_max=31), the optimizer returned area 55, latency 11, power 31, DSP 8, LUT 7.
- With the configured latency ceiling (latency_max=11), power-aware extraction returned area 55, latency 11, power 31, DSP 8, LUT 7.
- With the configured zero-DSP budget (dsp_max=0), the optimizer returned area 39, latency 14, power 55, DSP 0, LUT 71.
- With the configured LUT-cap budget (lut_max=7), the optimizer returned area 62, latency 7, power 38, DSP 15, LUT 0, which pushes the solution back toward DSP-heavy implementations.
- At least one constrained run diverged from the weighted solution, which means the explicit budgets are shaping extraction.
- Sweeping area/latency weights produced 3 distinct weighted-optimal points, which gives a readable sampled Pareto curve.
- The Pareto frontier exposed 8 nondominated solutions, indicating a visible area-latency tradeoff.

### conv3x3

- Weighted extraction changed area 62 -> 16 (74.2% reduction), latency 19 -> 18 (5.3% reduction), power 35 -> 18 (48.6% reduction).
- Latency-optimal extraction with no budgets reached latency 9 with area 27, power 24, DSP 10, and LUT 3.
- Power-optimal extraction with no budgets reached power 15 with area 18, latency 18, DSP 1, and LUT 12.
- DSP count changed 9 -> 0 (100.0% reduction) while LUT count changed 8 -> 20 (+150.0%).
- Across the DSP-budget sweep, latency moved from 18 at dsp_max=0 to 9 at dsp_max=17, which quantifies the benefit of a larger FPGA budget on this datapath.
- With the configured power budget (power_max=35), the optimizer returned area 27, latency 9, power 24, DSP 10, LUT 3.
- With the configured latency ceiling (latency_max=19), power-aware extraction returned area 18, latency 18, power 15, DSP 1, LUT 12.
- With the configured zero-DSP budget (dsp_max=0), the optimizer returned area 16, latency 18, power 18, DSP 0, LUT 20.
- With the configured LUT-cap budget (lut_max=8), the optimizer returned area 27, latency 9, power 24, DSP 10, LUT 3, which pushes the solution back toward DSP-heavy implementations.
- At least one constrained run diverged from the weighted solution, which means the explicit budgets are shaping extraction.
- Sweeping area/latency weights produced 3 distinct weighted-optimal points, which gives a readable sampled Pareto curve.
- The Pareto frontier exposed 10 nondominated solutions, indicating a visible area-latency tradeoff.

### stencil5

- Weighted extraction changed area 34 -> 24 (29.4% reduction), latency 11 -> 14 (27.3% increase), power 19 -> 34 (78.9% increase).
- Latency-optimal extraction with no budgets reached latency 7 with area 36, power 26, DSP 8, and LUT 8.
- Power-optimal extraction with no budgets reached power 19 with area 34, latency 11, DSP 5, and LUT 4.
- DSP count changed 5 -> 0 (100.0% reduction) while LUT count changed 4 -> 44 (+1000.0%).
- Across the DSP-budget sweep, latency moved from 14 at dsp_max=0 to 7 at dsp_max=9, which quantifies the benefit of a larger FPGA budget on this datapath.
- With the configured power budget (power_max=19), the optimizer returned area 34, latency 11, power 19, DSP 5, LUT 4.
- With the configured latency ceiling (latency_max=11), power-aware extraction returned area 34, latency 11, power 19, DSP 5, LUT 4.
- With the configured zero-DSP budget (dsp_max=0), the optimizer returned area 24, latency 14, power 34, DSP 0, LUT 44.
- With the configured LUT-cap budget (lut_max=4), the optimizer returned area 38, latency 7, power 23, DSP 9, LUT 0, which pushes the solution back toward DSP-heavy implementations.
- At least one constrained run diverged from the weighted solution, which means the explicit budgets are shaping extraction.
- Sweeping area/latency weights produced 3 distinct weighted-optimal points, which gives a readable sampled Pareto curve.
- The Pareto frontier exposed 8 nondominated solutions, indicating a visible area-latency tradeoff.
