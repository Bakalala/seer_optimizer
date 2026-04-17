# Structural Validation Interpretation

The optimizer generates functionally equivalent RTL variants with different analytical and structural DSP/LUT intent. A real FPGA fitted-metric validation flow is implemented, but the available Quartus installation cannot produce fit/STA reports on this server, so no fitted FPGA improvement is claimed yet.

This server is valid for Rust optimizer tests, Python benchmark tests, RTL generation, ModelSim functional equivalence, structural analytical validation, and Quartus preflight failure diagnosis. It is not valid for fitted ALM/DSP claims, Fmax claims, Quartus power claims, or any real-FPGA improvement statement.

The tables and figures compare feasible optimizer-selected datapaths under the analytical cost model. They do not claim a globally best implementation; they show that constrained extraction selects different feasible implementations for different objectives and budgets.

## fir8
- `original`: area 55 (0), latency 17 (0), power 31 (0), DSP 8 (0), LUT 7 (0); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=8, LUT-mul-intent=0.
- `weighted`: area 25 (-30), latency 18 (+1), power 33 (+2), DSP 0 (-8), LUT 41 (+34); ops add/sub/mul/MAC=9/0/4/0, DSP-mul-intent=0, LUT-mul-intent=4.
- `latency_unconstrained`: area 38 (-17), latency 9 (-8), power 31 (0), DSP 10 (+2), LUT 10 (+3); ops add/sub/mul/MAC=9/0/4/0, DSP-mul-intent=3, LUT-mul-intent=1.
- `latency_under_dsp`: area 25 (-30), latency 18 (+1), power 33 (+2), DSP 0 (-8), LUT 41 (+34); ops add/sub/mul/MAC=9/0/4/0, DSP-mul-intent=0, LUT-mul-intent=4.
- `latency_under_lut`: area 40 (-15), latency 9 (-8), power 28 (-3), DSP 11 (+3), LUT 2 (-5); ops add/sub/mul/MAC=9/0/4/0, DSP-mul-intent=4, LUT-mul-intent=0.
- `power_unconstrained`: area 33 (-22), latency 16 (-1), power 21 (-10), DSP 4 (-4), LUT 9 (+2); ops add/sub/mul/MAC=9/0/4/0, DSP-mul-intent=4, LUT-mul-intent=0.

## dot16
- `original`: area 111 (0), latency 33 (0), power 63 (0), DSP 16 (0), LUT 15 (0); ops add/sub/mul/MAC=15/0/16/0, DSP-mul-intent=16, LUT-mul-intent=0.
- `weighted`: area 79 (-32), latency 36 (+3), power 111 (+48), DSP 0 (-16), LUT 143 (+128); ops add/sub/mul/MAC=15/0/16/0, DSP-mul-intent=0, LUT-mul-intent=16.
- `latency_unconstrained`: area 94 (-17), latency 21 (-12), power 126 (+63), DSP 15 (-1), LUT 128 (+113); ops add/sub/mul/MAC=15/0/16/0, DSP-mul-intent=0, LUT-mul-intent=16.
- `latency_under_dsp`: area 79 (-32), latency 36 (+3), power 111 (+48), DSP 0 (-16), LUT 143 (+128); ops add/sub/mul/MAC=15/0/16/0, DSP-mul-intent=0, LUT-mul-intent=16.
- `latency_under_lut` is infeasible or missing: no feasible solution satisfies the provided budgets.
- `power_unconstrained`: area 93 (-18), latency 33 (0), power 90 (+27), DSP 7 (-9), LUT 87 (+72); ops add/sub/mul/MAC=15/0/16/0, DSP-mul-intent=7, LUT-mul-intent=9.
- `dot16/latency_under_lut` is explicitly infeasible under the requested LUT constraint, which is expected for a dot product with many multiplier sites.

## gemm_k8
- `original`: area 55 (0), latency 17 (0), power 31 (0), DSP 8 (0), LUT 7 (0); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=8, LUT-mul-intent=0.
- `weighted`: area 39 (-16), latency 20 (+3), power 55 (+24), DSP 0 (-8), LUT 71 (+64); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=0, LUT-mul-intent=8.
- `latency_unconstrained`: area 54 (-1), latency 10 (-7), power 50 (+19), DSP 11 (+3), LUT 32 (+25); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=4, LUT-mul-intent=4.
- `latency_under_dsp`: area 39 (-16), latency 20 (+3), power 55 (+24), DSP 0 (-8), LUT 71 (+64); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=0, LUT-mul-intent=8.
- `latency_under_lut`: area 55 (0), latency 17 (0), power 31 (0), DSP 8 (0), LUT 7 (0); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=8, LUT-mul-intent=0.
- `power_unconstrained`: area 55 (0), latency 17 (0), power 31 (0), DSP 8 (0), LUT 7 (0); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=8, LUT-mul-intent=0.

## gemm_blocked_k8
- `original`: area 55 (0), latency 11 (0), power 31 (0), DSP 8 (0), LUT 7 (0); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=8, LUT-mul-intent=0.
- `weighted`: area 39 (-16), latency 14 (+3), power 55 (+24), DSP 0 (-8), LUT 71 (+64); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=0, LUT-mul-intent=8.
- `latency_unconstrained`: area 62 (+7), latency 7 (-4), power 38 (+7), DSP 15 (+7), LUT 0 (-7); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=8, LUT-mul-intent=0.
- `latency_under_dsp`: area 39 (-16), latency 14 (+3), power 55 (+24), DSP 0 (-8), LUT 71 (+64); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=0, LUT-mul-intent=8.
- `latency_under_lut`: area 62 (+7), latency 7 (-4), power 38 (+7), DSP 15 (+7), LUT 0 (-7); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=8, LUT-mul-intent=0.
- `power_unconstrained`: area 55 (0), latency 11 (0), power 31 (0), DSP 8 (0), LUT 7 (0); ops add/sub/mul/MAC=7/0/8/0, DSP-mul-intent=8, LUT-mul-intent=0.

## conv3x3
- `original`: area 62 (0), latency 19 (0), power 35 (0), DSP 9 (0), LUT 8 (0); ops add/sub/mul/MAC=8/0/9/0, DSP-mul-intent=9, LUT-mul-intent=0.
- `weighted`: area 16 (-46), latency 18 (-1), power 18 (-17), DSP 0 (-9), LUT 20 (+12); ops add/sub/mul/MAC=12/0/1/0, DSP-mul-intent=0, LUT-mul-intent=1.
- `latency_unconstrained`: area 27 (-35), latency 9 (-10), power 24 (-11), DSP 10 (+1), LUT 3 (-5); ops add/sub/mul/MAC=12/0/1/0, DSP-mul-intent=1, LUT-mul-intent=0.
- `latency_under_dsp`: area 16 (-46), latency 18 (-1), power 18 (-17), DSP 0 (-9), LUT 20 (+12); ops add/sub/mul/MAC=12/0/1/0, DSP-mul-intent=0, LUT-mul-intent=1.
- `latency_under_lut`: area 27 (-35), latency 9 (-10), power 24 (-11), DSP 10 (+1), LUT 3 (-5); ops add/sub/mul/MAC=12/0/1/0, DSP-mul-intent=1, LUT-mul-intent=0.
- `power_unconstrained`: area 18 (-44), latency 18 (-1), power 15 (-20), DSP 1 (-8), LUT 12 (+4); ops add/sub/mul/MAC=12/0/1/0, DSP-mul-intent=1, LUT-mul-intent=0.

## stencil5
- `original`: area 34 (0), latency 11 (0), power 19 (0), DSP 5 (0), LUT 4 (0); ops add/sub/mul/MAC=4/0/5/0, DSP-mul-intent=5, LUT-mul-intent=0.
- `weighted`: area 24 (-10), latency 14 (+3), power 34 (+15), DSP 0 (-5), LUT 44 (+40); ops add/sub/mul/MAC=4/0/5/0, DSP-mul-intent=0, LUT-mul-intent=5.
- `latency_unconstrained`: area 36 (+2), latency 7 (-4), power 26 (+7), DSP 8 (+3), LUT 8 (+4); ops add/sub/mul/MAC=4/0/5/0, DSP-mul-intent=4, LUT-mul-intent=1.
- `latency_under_dsp`: area 24 (-10), latency 14 (+3), power 34 (+15), DSP 0 (-5), LUT 44 (+40); ops add/sub/mul/MAC=4/0/5/0, DSP-mul-intent=0, LUT-mul-intent=5.
- `latency_under_lut`: area 38 (+4), latency 7 (-4), power 23 (+4), DSP 9 (+4), LUT 0 (-4); ops add/sub/mul/MAC=4/0/5/0, DSP-mul-intent=5, LUT-mul-intent=0.
- `power_unconstrained`: area 34 (0), latency 11 (0), power 19 (0), DSP 5 (0), LUT 4 (0); ops add/sub/mul/MAC=4/0/5/0, DSP-mul-intent=5, LUT-mul-intent=0.
