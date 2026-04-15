# Baseline Constraints

`A/L/P/D/U` means area, latency, power, DSP count, LUT count.

| Benchmark | Baseline A/L/P/D/U | Area cap | Latency cap | Power cap | DSP cap | LUT cap |
|---|---:|---:|---:|---:|---:|---:|
| `fir8` | 55/17/31/8/7 | 55 | 17 | 31 | 0 | 7 |
| `dot16` | 111/33/63/16/15 | 111 | 33 | 63 | 0 | 15 |
| `gemm_k8` | 55/17/31/8/7 | 55 | 17 | 31 | 0 | 7 |
| `gemm_blocked_k8` | 55/11/31/8/7 | 55 | 11 | 31 | 0 | 7 |
| `conv3x3` | 62/19/35/9/8 | 62 | 19 | 35 | 0 | 8 |
| `stencil5` | 34/11/19/5/4 | 34 | 11 | 19 | 0 | 4 |
