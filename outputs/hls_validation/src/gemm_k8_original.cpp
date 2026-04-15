#include "generated_datapaths.hpp"

// benchmark: gemm_k8
// variant: original
// analytical metrics: area=55 latency=17 power=31 dsp=8 lut=7
// expression: ((((((((A0 * B0) + (A1 * B1)) + (A2 * B2)) + (A3 * B3)) + (A4 * B4)) + (A5 * B5)) + (A6 * B6)) + (A7 * B7))

extern "C" HLS_COMPONENT hls_word_t gemm_k8_original(hls_word_t in_A0, hls_word_t in_A1, hls_word_t in_A2, hls_word_t in_A3, hls_word_t in_A4, hls_word_t in_A5, hls_word_t in_A6, hls_word_t in_A7, hls_word_t in_B0, hls_word_t in_B1, hls_word_t in_B2, hls_word_t in_B3, hls_word_t in_B4, hls_word_t in_B5, hls_word_t in_B6, hls_word_t in_B7) {
    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = in_A0;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = in_B0;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n2 = dsp_mul(n0, n1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = in_A1;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = in_B1;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n5 = dsp_mul(n3, n4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = in_A2;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = in_B2;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n8 = dsp_mul(n6, n7);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = in_A3;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = in_B3;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n11 = dsp_mul(n9, n10);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n12 = in_A4;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n13 = in_B4;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n14 = dsp_mul(n12, n13);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n15 = in_A5;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n16 = in_B5;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n17 = dsp_mul(n15, n16);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n18 = in_A6;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n19 = in_B6;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n20 = dsp_mul(n18, n19);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n21 = in_A7;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n22 = in_B7;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n23 = dsp_mul(n21, n22);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n24 = soft_add(n2, n5);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n25 = soft_add(n24, n8);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n26 = soft_add(n25, n11);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n27 = soft_add(n26, n14);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n28 = soft_add(n27, n17);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n29 = soft_add(n28, n20);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n30 = soft_add(n29, n23);

    return n30;
}
