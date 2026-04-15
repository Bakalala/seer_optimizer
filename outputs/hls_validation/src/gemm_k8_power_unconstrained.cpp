#include "generated_datapaths.hpp"

// benchmark: gemm_k8
// variant: power_unconstrained
// analytical metrics: area=55 latency=17 power=31 dsp=8 lut=7
// expression: ((A7 *dsp B7) +lut ((A6 *dsp B6) +lut ((A5 *dsp B5) +lut ((A4 *dsp B4) +lut ((A3 *dsp B3) +lut ((A2 *dsp B2) +lut ((A0 *dsp B0) +lut (A1 *dsp B1))))))))

extern "C" HLS_COMPONENT hls_word_t gemm_k8_power_unconstrained(hls_word_t in_A0, hls_word_t in_A1, hls_word_t in_A2, hls_word_t in_A3, hls_word_t in_A4, hls_word_t in_A5, hls_word_t in_A6, hls_word_t in_A7, hls_word_t in_B0, hls_word_t in_B1, hls_word_t in_B2, hls_word_t in_B3, hls_word_t in_B4, hls_word_t in_B5, hls_word_t in_B6, hls_word_t in_B7) {
    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = in_A7;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = in_B7;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n2 = dsp_mul(n0, n1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = in_A6;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = in_B6;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n5 = dsp_mul(n3, n4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = in_A5;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = in_B5;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n8 = dsp_mul(n6, n7);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = in_A4;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = in_B4;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n11 = dsp_mul(n9, n10);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n12 = in_A3;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n13 = in_B3;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n14 = dsp_mul(n12, n13);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n15 = in_A2;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n16 = in_B2;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n17 = dsp_mul(n15, n16);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n18 = in_A0;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n19 = in_B0;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n20 = dsp_mul(n18, n19);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n21 = in_A1;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n22 = in_B1;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n23 = dsp_mul(n21, n22);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n24 = soft_add(n20, n23);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n25 = soft_add(n17, n24);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n26 = soft_add(n14, n25);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n27 = soft_add(n11, n26);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n28 = soft_add(n8, n27);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n29 = soft_add(n5, n28);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n30 = soft_add(n2, n29);

    return n30;
}
