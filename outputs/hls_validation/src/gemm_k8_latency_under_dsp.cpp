#include "generated_datapaths.hpp"

// benchmark: gemm_k8
// variant: latency_under_dsp
// analytical metrics: area=39 latency=20 power=55 dsp=0 lut=71
// expression: ((A7 *lut B7) +lut ((A6 *lut B6) +lut ((A5 *lut B5) +lut ((A4 *lut B4) +lut ((A3 *lut B3) +lut ((A2 *lut B2) +lut ((A0 *lut B0) +lut (A1 *lut B1))))))))

extern "C" HLS_COMPONENT hls_word_t gemm_k8_latency_under_dsp(hls_word_t in_A0, hls_word_t in_A1, hls_word_t in_A2, hls_word_t in_A3, hls_word_t in_A4, hls_word_t in_A5, hls_word_t in_A6, hls_word_t in_A7, hls_word_t in_B0, hls_word_t in_B1, hls_word_t in_B2, hls_word_t in_B3, hls_word_t in_B4, hls_word_t in_B5, hls_word_t in_B6, hls_word_t in_B7) {
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

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n14 = soft_mul(n12, n13);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n15 = in_A2;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n16 = in_B2;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n17 = soft_mul(n15, n16);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n18 = in_A0;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n19 = in_B0;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n20 = soft_mul(n18, n19);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n21 = in_A1;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n22 = in_B1;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n23 = soft_mul(n21, n22);

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
