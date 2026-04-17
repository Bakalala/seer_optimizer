| benchmark | original_variant | optimized_variant | functional_status | original_status | optimized_status | original_rtl_intended_dsp | optimized_rtl_intended_dsp | original_rtl_intended_logic_mul | optimized_rtl_intended_logic_mul | original_quartus_dsp | optimized_quartus_dsp | dsp_delta | original_quartus_alm_or_alut | optimized_quartus_alm_or_alut | alm_or_alut_delta | original_quartus_fmax_mhz | optimized_quartus_fmax_mhz | fmax_delta_mhz | improved_metric | claim_status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| conv3x3 | original | weighted | pass | compiled | compiled | 9 | 0 | 0 | 1 | 0 | 0 | 0 | 289 | 289 | 0 | 1447.18 | 1447.18 | 0 |  | no_fitted_improvement |
| conv3x3 | original | latency_unconstrained | pass | compiled | compiled | 9 | 1 | 0 | 0 | 0 | 0 | 0 | 289 | 289 | 0 | 1447.18 | 1447.18 | 0 |  | no_fitted_improvement |
| conv3x3 | original | power_unconstrained | pass | compiled | compiled | 9 | 1 | 0 | 0 | 0 | 0 | 0 | 289 | 289 | 0 | 1447.18 | 1447.18 | 0 |  | no_fitted_improvement |
| conv3x3 | original | latency_under_dsp | pass | compiled | compiled | 9 | 0 | 0 | 1 | 0 | 0 | 0 | 289 | 289 | 0 | 1447.18 | 1447.18 | 0 |  | no_fitted_improvement |
| conv3x3 | original | latency_under_lut | pass | compiled | compiled | 9 | 1 | 0 | 0 | 0 | 0 | 0 | 289 | 289 | 0 | 1447.18 | 1447.18 | 0 |  | no_fitted_improvement |
| dot16 | original | weighted | pass | compiled | compiled | 16 | 0 | 0 | 16 | 24 | 0 | -24 | 732 | 4328 | 3596 | 166.69 | 186.78 | 20.09 | DSP blocks -24; Fmax +20.09 MHz | pass |
| dot16 | original | latency_unconstrained | pass | compiled | compiled | 16 | 0 | 0 | 16 | 24 | 0 | -24 | 732 | 4328 | 3596 | 166.69 | 186.78 | 20.09 | DSP blocks -24; Fmax +20.09 MHz | pass |
| dot16 | original | power_unconstrained | pass | compiled | compiled | 16 | 7 | 0 | 9 | 24 | 11 | -13 | 732 | 2665 | 1933 | 166.69 | 147.43 | -19.26 | DSP blocks -13 | pass |
| dot16 | original | latency_under_dsp | pass | compiled | compiled | 16 | 0 | 0 | 16 | 24 | 0 | -24 | 732 | 4328 | 3596 | 166.69 | 186.78 | 20.09 | DSP blocks -24; Fmax +20.09 MHz | pass |
| fir8 | original | weighted | pass | compiled | compiled | 8 | 0 | 0 | 4 | 0 | 0 | 0 | 288 | 288 | 0 | 1293.66 | 1293.66 | 0 |  | no_fitted_improvement |
| fir8 | original | latency_unconstrained | pass | compiled | compiled | 8 | 3 | 0 | 1 | 0 | 0 | 0 | 288 | 288 | 0 | 1293.66 | 1293.66 | 0 |  | no_fitted_improvement |
| fir8 | original | power_unconstrained | pass | compiled | compiled | 8 | 4 | 0 | 0 | 0 | 0 | 0 | 288 | 288 | 0 | 1293.66 | 1293.66 | 0 |  | no_fitted_improvement |
| fir8 | original | latency_under_dsp | pass | compiled | compiled | 8 | 0 | 0 | 4 | 0 | 0 | 0 | 288 | 288 | 0 | 1293.66 | 1293.66 | 0 |  | no_fitted_improvement |
| fir8 | original | latency_under_lut | pass | compiled | compiled | 8 | 4 | 0 | 0 | 0 | 0 | 0 | 288 | 288 | 0 | 1293.66 | 1293.66 | 0 |  | no_fitted_improvement |
| gemm_blocked_k8 | original | weighted | pass | compiled | compiled | 8 | 0 | 0 | 8 | 12 | 0 | -12 | 366 | 2154 | 1788 | 190.95 | 245.16 | 54.21 | DSP blocks -12; Fmax +54.21 MHz | pass |
| gemm_blocked_k8 | original | latency_unconstrained | pass | compiled | compiled | 8 | 8 | 0 | 0 | 12 | 12 | 0 | 366 | 366 | 0 | 190.95 | 190.95 | 0 |  | no_fitted_improvement |
| gemm_blocked_k8 | original | power_unconstrained | pass | compiled | compiled | 8 | 8 | 0 | 0 | 12 | 12 | 0 | 366 | 366 | 0 | 190.95 | 190.95 | 0 |  | no_fitted_improvement |
| gemm_blocked_k8 | original | latency_under_dsp | pass | compiled | compiled | 8 | 0 | 0 | 8 | 12 | 0 | -12 | 366 | 2154 | 1788 | 190.95 | 245.16 | 54.21 | DSP blocks -12; Fmax +54.21 MHz | pass |
| gemm_blocked_k8 | original | latency_under_lut | pass | compiled | compiled | 8 | 8 | 0 | 0 | 12 | 12 | 0 | 366 | 366 | 0 | 190.95 | 190.95 | 0 |  | no_fitted_improvement |
| gemm_k8 | original | weighted | pass | compiled | compiled | 8 | 0 | 0 | 8 | 12 | 0 | -12 | 366 | 2154 | 1788 | 190.95 | 245.16 | 54.21 | DSP blocks -12; Fmax +54.21 MHz | pass |
| gemm_k8 | original | latency_unconstrained | pass | compiled | compiled | 8 | 4 | 0 | 4 | 12 | 6 | -6 | 366 | 1272 | 906 | 190.95 | 185.63 | -5.32 | DSP blocks -6 | pass |
| gemm_k8 | original | power_unconstrained | pass | compiled | compiled | 8 | 8 | 0 | 0 | 12 | 12 | 0 | 366 | 366 | 0 | 190.95 | 190.95 | 0 |  | no_fitted_improvement |
| gemm_k8 | original | latency_under_dsp | pass | compiled | compiled | 8 | 0 | 0 | 8 | 12 | 0 | -12 | 366 | 2154 | 1788 | 190.95 | 245.16 | 54.21 | DSP blocks -12; Fmax +54.21 MHz | pass |
| gemm_k8 | original | latency_under_lut | pass | compiled | compiled | 8 | 8 | 0 | 0 | 12 | 12 | 0 | 366 | 366 | 0 | 190.95 | 190.95 | 0 |  | no_fitted_improvement |
| stencil5 | original | weighted | pass | compiled | compiled | 5 | 0 | 0 | 5 | 0 | 0 | 0 | 240 | 240 | 0 | 1538.46 | 1538.46 | 0 |  | no_fitted_improvement |
| stencil5 | original | latency_unconstrained | pass | compiled | compiled | 5 | 4 | 0 | 1 | 0 | 0 | 0 | 240 | 240 | 0 | 1538.46 | 1538.46 | 0 |  | no_fitted_improvement |
| stencil5 | original | power_unconstrained | pass | compiled | compiled | 5 | 5 | 0 | 0 | 0 | 0 | 0 | 240 | 240 | 0 | 1538.46 | 1538.46 | 0 |  | no_fitted_improvement |
| stencil5 | original | latency_under_dsp | pass | compiled | compiled | 5 | 0 | 0 | 5 | 0 | 0 | 0 | 240 | 240 | 0 | 1538.46 | 1538.46 | 0 |  | no_fitted_improvement |
| stencil5 | original | latency_under_lut | pass | compiled | compiled | 5 | 5 | 0 | 0 | 0 | 0 | 0 | 240 | 240 | 0 | 1538.46 | 1538.46 | 0 |  | no_fitted_improvement |
