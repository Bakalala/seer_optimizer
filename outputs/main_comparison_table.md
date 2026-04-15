# Main Comparison Table

`A/L/P/D/U` means area, latency, power, DSP count, LUT count.

| Benchmark | Weighted A/L/P/D/U | Latency-opt A/L/P/D/U | Power-opt A/L/P/D/U | Pareto points | Infeasible queries |
|---|---:|---:|---:|---:|---|
| `fir8` | 25/18/33/0/41 | 38/9/31/10/10 | 33/16/21/4/9 | 10 | -- |
| `dot16` | 79/36/111/0/143 | 94/21/126/15/128 | 93/33/90/7/87 | 16 | min latency \| power cap; min latency \| LUT cap |
| `gemm_k8` | 39/20/55/0/71 | 54/10/50/11/32 | 55/17/31/8/7 | 11 | -- |
| `gemm_blocked_k8` | 39/14/55/0/71 | 62/7/38/15/0 | 55/11/31/8/7 | 8 | -- |
| `conv3x3` | 16/18/18/0/20 | 27/9/24/10/3 | 18/18/15/1/12 | 10 | -- |
| `stencil5` | 24/14/34/0/44 | 36/7/26/8/8 | 34/11/19/5/4 | 8 | -- |
