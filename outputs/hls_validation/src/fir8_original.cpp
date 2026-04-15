#include "generated_datapaths.hpp"

// benchmark: fir8
// variant: original
// analytical metrics: area=55 latency=17 power=31 dsp=8 lut=7
// expression: ((((((((1 * x0) + (2 * x1)) + (3 * x2)) + (4 * x3)) + (4 * x4)) + (3 * x5)) + (2 * x6)) + (1 * x7))

extern "C" HLS_COMPONENT hls_word_t fir8_original(hls_word_t in_x0, hls_word_t in_x1, hls_word_t in_x2, hls_word_t in_x3, hls_word_t in_x4, hls_word_t in_x5, hls_word_t in_x6, hls_word_t in_x7) {
    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = in_x0;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = static_cast<hls_word_t>(1);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n2 = dsp_mul(n1, n0);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = in_x1;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = static_cast<hls_word_t>(2);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n5 = dsp_mul(n4, n3);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = in_x2;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = static_cast<hls_word_t>(3);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n8 = dsp_mul(n7, n6);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = in_x3;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = static_cast<hls_word_t>(4);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n11 = dsp_mul(n10, n9);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n12 = in_x4;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n13 = static_cast<hls_word_t>(4);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n14 = dsp_mul(n13, n12);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n15 = in_x5;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n16 = static_cast<hls_word_t>(3);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n17 = dsp_mul(n16, n15);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n18 = in_x6;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n19 = static_cast<hls_word_t>(2);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n20 = dsp_mul(n19, n18);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n21 = in_x7;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n22 = static_cast<hls_word_t>(1);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n23 = dsp_mul(n22, n21);

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
