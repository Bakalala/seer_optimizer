#include "generated_datapaths.hpp"

// benchmark: gemm_k8
// variant: latency_unconstrained
// analytical metrics: area=54 latency=10 power=50 dsp=11 lut=32
// expression: ((A7 *lut B7) +dsp ((A6 *lut B6) +dsp ((A5 *lut B5) +dsp ((A4 *lut B4) +dsp ((A3 *dsp B3) +dsp ((A2 *dsp B2) +dsp ((A0 *dsp B0) +dsp (A1 *dsp B1))))))))

extern "C" HLS_COMPONENT hls_word_t gemm_k8_latency_unconstrained(hls_word_t in_A0, hls_word_t in_A1, hls_word_t in_A2, hls_word_t in_A3, hls_word_t in_A4, hls_word_t in_A5, hls_word_t in_A6, hls_word_t in_A7, hls_word_t in_B0, hls_word_t in_B1, hls_word_t in_B2, hls_word_t in_B3, hls_word_t in_B4, hls_word_t in_B5, hls_word_t in_B6, hls_word_t in_B7) {
    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = in_A7;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = in_B7;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n2 = soft_mul(n0, n1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = in_A6;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = in_B6;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n5 = soft_mul(n3, n4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = in_A5;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = in_B5;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n8 = soft_mul(n6, n7);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = in_A4;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = in_B4;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n11 = soft_mul(n9, n10);

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

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n24 = dsp_add(n20, n23);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n25 = dsp_add(n17, n24);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n26 = dsp_add(n14, n25);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n27 = dsp_add(n11, n26);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n28 = dsp_add(n8, n27);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n29 = dsp_add(n5, n28);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n30 = dsp_add(n2, n29);

    return n30;
}
