#include "generated_datapaths.hpp"

// benchmark: conv3x3
// variant: original
// analytical metrics: area=62 latency=19 power=35 dsp=9 lut=8
// expression: (((((((((1 * p00) + (2 * p01)) + (1 * p02)) + (2 * p10)) + (4 * p11)) + (2 * p12)) + (1 * p20)) + (2 * p21)) + (1 * p22))

extern "C" HLS_COMPONENT hls_word_t conv3x3_original(hls_word_t in_p00, hls_word_t in_p01, hls_word_t in_p02, hls_word_t in_p10, hls_word_t in_p11, hls_word_t in_p12, hls_word_t in_p20, hls_word_t in_p21, hls_word_t in_p22) {
    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = in_p00;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = static_cast<hls_word_t>(1);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n2 = dsp_mul(n1, n0);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = in_p01;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = static_cast<hls_word_t>(2);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n5 = dsp_mul(n4, n3);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = in_p02;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = static_cast<hls_word_t>(1);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n8 = dsp_mul(n7, n6);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = in_p10;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = static_cast<hls_word_t>(2);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n11 = dsp_mul(n10, n9);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n12 = in_p11;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n13 = static_cast<hls_word_t>(4);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n14 = dsp_mul(n13, n12);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n15 = in_p12;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n16 = static_cast<hls_word_t>(2);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n17 = dsp_mul(n16, n15);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n18 = in_p20;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n19 = static_cast<hls_word_t>(1);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n20 = dsp_mul(n19, n18);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n21 = in_p21;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n22 = static_cast<hls_word_t>(2);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n23 = dsp_mul(n22, n21);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n24 = in_p22;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n25 = static_cast<hls_word_t>(1);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n26 = dsp_mul(n25, n24);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n27 = soft_add(n2, n5);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n28 = soft_add(n27, n8);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n29 = soft_add(n28, n11);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n30 = soft_add(n29, n14);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n31 = soft_add(n30, n17);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n32 = soft_add(n31, n20);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n33 = soft_add(n32, n23);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n34 = soft_add(n33, n26);

    return n34;
}
