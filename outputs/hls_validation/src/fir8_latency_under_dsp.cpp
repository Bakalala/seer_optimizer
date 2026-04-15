#include "generated_datapaths.hpp"

// benchmark: fir8
// variant: latency_under_dsp
// analytical metrics: area=25 latency=18 power=33 dsp=0 lut=41
// expression: ((((3 *lut x5) +lut ((4 *lut x4) +lut ((4 *lut x3) +lut ((3 *lut x2) +lut ((x1 +lut x1) +lut x0))))) +lut (x6 +lut x6)) +lut x7)

extern "C" HLS_COMPONENT hls_word_t fir8_latency_under_dsp(hls_word_t in_x0, hls_word_t in_x1, hls_word_t in_x2, hls_word_t in_x3, hls_word_t in_x4, hls_word_t in_x5, hls_word_t in_x6, hls_word_t in_x7) {
    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = static_cast<hls_word_t>(3);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = in_x5;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n2 = soft_mul(n0, n1);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = static_cast<hls_word_t>(4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = in_x4;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n5 = soft_mul(n3, n4);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = static_cast<hls_word_t>(4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = in_x3;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n8 = soft_mul(n6, n7);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = static_cast<hls_word_t>(3);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = in_x2;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n11 = soft_mul(n9, n10);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n12 = in_x1;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n13 = in_x1;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n14 = soft_add(n12, n13);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n15 = in_x0;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n16 = soft_add(n14, n15);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n17 = soft_add(n11, n16);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n18 = soft_add(n8, n17);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n19 = soft_add(n5, n18);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n20 = soft_add(n2, n19);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n21 = in_x6;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n22 = in_x6;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n23 = soft_add(n21, n22);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n24 = soft_add(n20, n23);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n25 = in_x7;

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n26 = soft_add(n24, n25);

    return n26;
}
