#include "generated_datapaths.hpp"

// benchmark: stencil5
// variant: latency_unconstrained
// analytical metrics: area=36 latency=7 power=26 dsp=8 lut=8
// expression: ((-1 *lut west) +dsp ((-1 *dsp east) +dsp ((-1 *dsp south) +dsp ((-1 *dsp north) +dsp (4 *dsp center)))))

extern "C" HLS_COMPONENT hls_word_t stencil5_latency_unconstrained(hls_word_t in_center, hls_word_t in_east, hls_word_t in_north, hls_word_t in_south, hls_word_t in_west) {
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

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n5 = dsp_mul(n3, n4);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = static_cast<hls_word_t>(-1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = in_south;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n8 = dsp_mul(n6, n7);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = static_cast<hls_word_t>(-1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = in_north;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n11 = dsp_mul(n9, n10);

    // op: const, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n12 = static_cast<hls_word_t>(4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n13 = in_center;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n14 = dsp_mul(n12, n13);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n15 = dsp_add(n11, n14);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n16 = dsp_add(n8, n15);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n17 = dsp_add(n5, n16);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n18 = dsp_add(n2, n17);

    return n18;
}
