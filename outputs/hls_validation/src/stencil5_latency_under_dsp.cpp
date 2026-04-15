#include "generated_datapaths.hpp"

// benchmark: stencil5
// variant: latency_under_dsp
// analytical metrics: area=24 latency=14 power=34 dsp=0 lut=44
// expression: ((-1 *lut west) +lut ((-1 *lut east) +lut ((-1 *lut south) +lut ((-1 *lut north) +lut (4 *lut center)))))

extern "C" HLS_COMPONENT hls_word_t stencil5_latency_under_dsp(hls_word_t in_center, hls_word_t in_east, hls_word_t in_north, hls_word_t in_south, hls_word_t in_west) {
    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = static_cast<hls_word_t>(-1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = in_west;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n2 = soft_mul(n0, n1);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = static_cast<hls_word_t>(-1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = in_east;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n5 = soft_mul(n3, n4);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = static_cast<hls_word_t>(-1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = in_south;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n8 = soft_mul(n6, n7);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = static_cast<hls_word_t>(-1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = in_north;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n11 = soft_mul(n9, n10);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n12 = static_cast<hls_word_t>(4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n13 = in_center;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n14 = soft_mul(n12, n13);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n15 = soft_add(n11, n14);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n16 = soft_add(n8, n15);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n17 = soft_add(n5, n16);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n18 = soft_add(n2, n17);

    return n18;
}
