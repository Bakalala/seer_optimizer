# RTL Functional Validation

The generated RTL variants were simulated with ModelSim using the generated testbenches in `outputs/rtl_validation/tests`.

Each benchmark testbench instantiates the original RTL module and every feasible optimized variant for that benchmark. For each deterministic input vector, the testbench drives the same signed 32-bit inputs into every module and compares each optimized output against the original output with exact four-state equality (`!==`). Any mismatch prints a `FAIL` line and terminates the simulation with `$fatal(1)`. A benchmark prints `PASS,<benchmark>,<variant_count>,<test_vector_count>` only when all variant outputs match the original for every vector.

Simulation command used:

```bash
SKIP_RTL_QUARTUS=1 ./scripts/run_rtl_validation_server.sh
```

Summary:

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

This validates functional equivalence of the generated RTL variants to the original RTL over the generated deterministic test vectors. It does not claim exhaustive equivalence over all possible 32-bit inputs.
