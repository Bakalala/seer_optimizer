#include "generated_datapaths.hpp"

// benchmark: stencil5
// variant: original
// analytical metrics: area=34 latency=11 power=19 dsp=5 lut=4
// expression: (((((4 * center) + (-1 * north)) + (-1 * south)) + (-1 * east)) + (-1 * west))

extern "C" HLS_COMPONENT hls_word_t stencil5_original(hls_word_t in_center, hls_word_t in_east, hls_word_t in_north, hls_word_t in_south, hls_word_t in_west) {
    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = in_center;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = in_north;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n2 = in_south;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = in_east;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = in_west;

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n5 = static_cast<hls_word_t>(4);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = static_cast<hls_word_t>(-1);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n7 = dsp_mul(n5, n0);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n8 = dsp_mul(n6, n1);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n9 = dsp_mul(n6, n2);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n10 = dsp_mul(n6, n3);

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n11 = dsp_mul(n6, n4);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n12 = soft_add(n7, n8);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n13 = soft_add(n12, n9);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n14 = soft_add(n13, n10);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n15 = soft_add(n14, n11);

    return n15;
}
