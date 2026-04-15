#include "generated_datapaths.hpp"

// benchmark: conv3x3
// variant: power_unconstrained
// analytical metrics: area=18 latency=18 power=15 dsp=1 lut=12
// expression: ((((((4 *dsp p11) +lut ((((p01 +lut p01) +lut p00) +lut p02) +lut (p10 +lut p10))) +lut (p12 +lut p12)) +lut p20) +lut (p21 +lut p21)) +lut p22)

extern "C" HLS_COMPONENT hls_word_t conv3x3_power_unconstrained(hls_word_t in_p00, hls_word_t in_p01, hls_word_t in_p02, hls_word_t in_p10, hls_word_t in_p11, hls_word_t in_p12, hls_word_t in_p20, hls_word_t in_p21, hls_word_t in_p22) {
    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = static_cast<hls_word_t>(4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = in_p11;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n2 = dsp_mul(n0, n1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = in_p01;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = in_p01;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n5 = soft_add(n3, n4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = in_p00;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n7 = soft_add(n5, n6);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n8 = in_p02;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n9 = soft_add(n7, n8);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = in_p10;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n11 = in_p10;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n12 = soft_add(n10, n11);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n13 = soft_add(n9, n12);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n14 = soft_add(n2, n13);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n15 = in_p12;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n16 = in_p12;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n17 = soft_add(n15, n16);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n18 = soft_add(n14, n17);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n19 = in_p20;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n20 = soft_add(n18, n19);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n21 = in_p21;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n22 = in_p21;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n23 = soft_add(n21, n22);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n24 = soft_add(n20, n23);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n25 = in_p22;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n26 = soft_add(n24, n25);

    return n26;
}
