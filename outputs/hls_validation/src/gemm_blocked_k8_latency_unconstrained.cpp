#include "generated_datapaths.hpp"

// benchmark: gemm_blocked_k8
// variant: latency_unconstrained
// analytical metrics: area=62 latency=7 power=38 dsp=15 lut=0
// expression: (((BA3 *dsp BB3) +dsp ((BA2 *dsp BB2) +dsp ((BA0 *dsp BB0) +dsp (BA1 *dsp BB1)))) +dsp ((BA7 *dsp BB7) +dsp ((BA6 *dsp BB6) +dsp ((BA4 *dsp BB4) +dsp (BA5 *dsp BB5)))))

extern "C" HLS_COMPONENT hls_word_t gemm_blocked_k8_latency_unconstrained(hls_word_t in_BA0, hls_word_t in_BA1, hls_word_t in_BA2, hls_word_t in_BA3, hls_word_t in_BA4, hls_word_t in_BA5, hls_word_t in_BA6, hls_word_t in_BA7, hls_word_t in_BB0, hls_word_t in_BB1, hls_word_t in_BB2, hls_word_t in_BB3, hls_word_t in_BB4, hls_word_t in_BB5, hls_word_t in_BB6, hls_word_t in_BB7) {
    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = in_BA3;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = in_BB3;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n2 = dsp_mul(n0, n1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = in_BA2;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = in_BB2;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n5 = dsp_mul(n3, n4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = in_BA0;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = in_BB0;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n8 = dsp_mul(n6, n7);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = in_BA1;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = in_BB1;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n11 = dsp_mul(n9, n10);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n12 = dsp_add(n8, n11);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n13 = dsp_add(n5, n12);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n14 = dsp_add(n2, n13);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n15 = in_BA7;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n16 = in_BB7;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n17 = dsp_mul(n15, n16);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n18 = in_BA6;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n19 = in_BB6;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n20 = dsp_mul(n18, n19);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n21 = in_BA4;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n22 = in_BB4;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n23 = dsp_mul(n21, n22);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n24 = in_BA5;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n25 = in_BB5;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n26 = dsp_mul(n24, n25);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n27 = dsp_add(n23, n26);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n28 = dsp_add(n20, n27);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n29 = dsp_add(n17, n28);

    // op: add_dsp, analytical area=2 latency=1 power=2 dsp=1 lut=0
    hls_word_t n30 = dsp_add(n14, n29);

    return n30;
}
