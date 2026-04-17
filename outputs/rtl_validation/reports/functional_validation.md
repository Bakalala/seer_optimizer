# RTL Functional Validation

The generated RTL variants are simulated with ModelSim using the generated testbenches in `outputs/rtl_validation/tests`.

Each benchmark testbench instantiates the original RTL module and every feasible optimized variant for that benchmark. For each deterministic input vector, the testbench drives the same signed 32-bit inputs into every module, computes an independent golden result from the benchmark definition, and compares both the original and optimized outputs against that golden result with exact four-state equality (`!==`). Any mismatch prints a `FAIL` line and terminates the simulation with `$fatal(1)`. A benchmark prints `PASS,<benchmark>,<variant_count>,<test_vector_count>` only when the original and every optimized variant match the golden result for every vector.

The golden checks are independent of the optimizer extraction:

- `fir8`: direct 8-tap FIR dot product with coefficients `[1,2,3,4,4,3,2,1]`.
- `dot16`: direct 16-term dot product.
- `gemm_k8`: direct 8-term multiply-accumulate.
- `gemm_blocked_k8`: direct 8-term blocked multiply-accumulate.
- `conv3x3`: direct 3x3 convolution window with kernel `[[1,2,1],[2,4,2],[1,2,1]]`.
- `stencil5`: direct five-point stencil `4*center - north - south - east - west`.

Simulation command used:

```bash
SKIP_RTL_QUARTUS=1 ./scripts/run_rtl_validation_server.sh
```

Last available server summary:

This table records the last ModelSim run committed in `functional_summary.csv`. If the testbenches were regenerated after this file, rerun the command above on the server to refresh the logs with the independent golden checks.

| Benchmark | Status | Optimized variants checked | Test vectors |
| --- | --- | ---: | ---: |
| conv3x3 | pass | 5 | 200 |
| dot16 | pass | 4 | 200 |
| fir8 | pass | 5 | 200 |
| gemm_blocked_k8 | pass | 5 | 200 |
| gemm_k8 | pass | 5 | 200 |
| stencil5 | pass | 5 | 200 |

ModelSim log evidence:

```text
outputs/rtl_validation/reports/sim/conv3x3.log: # PASS,conv3x3,5,200
outputs/rtl_validation/reports/sim/dot16.log: # PASS,dot16,4,200
outputs/rtl_validation/reports/sim/fir8.log: # PASS,fir8,5,200
outputs/rtl_validation/reports/sim/gemm_blocked_k8.log: # PASS,gemm_blocked_k8,5,200
outputs/rtl_validation/reports/sim/gemm_k8.log: # PASS,gemm_k8,5,200
outputs/rtl_validation/reports/sim/stencil5.log: # PASS,stencil5,5,200
```

After the golden-reference testbenches are rerun, a passing result validates that both the original RTL and the generated optimized RTL variants match the independent benchmark formulas over the generated deterministic test vectors. It does not claim exhaustive equivalence over all possible 32-bit inputs.
