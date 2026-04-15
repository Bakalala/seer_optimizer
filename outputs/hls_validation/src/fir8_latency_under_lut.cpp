#include "generated_datapaths.hpp"

// benchmark: fir8
// variant: latency_under_lut
// analytical metrics: area=40 latency=9 power=28 dsp=11 lut=2
// expression: ((((3 *dsp x5) +dsp ((4 *dsp x4) +dsp ((4 *dsp x3) +dsp ((3 *dsp x2) +dsp ((x1 +lut x1) +dsp x0))))) +dsp (x6 +lut x6)) +dsp x7)

extern "C" HLS_COMPONENT hls_word_t fir8_latency_under_lut(hls_word_t in_x0, hls_word_t in_x1, hls_word_t in_x2, hls_word_t in_x3, hls_word_t in_x4, hls_word_t in_x5, hls_word_t in_x6, hls_word_t in_x7) {
    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = static_cast<hls_word_t>(3);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = in_x5;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n2 = dsp_mul(n0, n1);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = static_cast<hls_word_t>(4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = in_x4;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n5 = dsp_mul(n3, n4);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = static_cast<hls_word_t>(4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = in_x3;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n8 = dsp_mul(n6, n7);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = static_cast<hls_word_t>(3);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = in_x2;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n11 = dsp_mul(n9, n10);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n12 = in_x1;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n13 = in_x1;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n14 = soft_add(n12, n13);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n15 = in_x0;

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n16 = dsp_add(n14, n15);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n17 = dsp_add(n11, n16);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n18 = dsp_add(n8, n17);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n19 = dsp_add(n5, n18);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n20 = dsp_add(n2, n19);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n21 = in_x6;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n22 = in_x6;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n23 = soft_add(n21, n22);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n24 = dsp_add(n20, n23);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n25 = in_x7;

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n26 = dsp_add(n24, n25);

    return n26;
}
