#include "generated_datapaths.hpp"

// benchmark: gemm_blocked_k8
// variant: original
// analytical metrics: area=55 latency=11 power=31 dsp=8 lut=7
// expression: (((((BA0 * BB0) + (BA1 * BB1)) + (BA2 * BB2)) + (BA3 * BB3)) + ((((BA4 * BB4) + (BA5 * BB5)) + (BA6 * BB6)) + (BA7 * BB7)))

extern "C" HLS_COMPONENT hls_word_t gemm_blocked_k8_original(hls_word_t in_BA0, hls_word_t in_BA1, hls_word_t in_BA2, hls_word_t in_BA3, hls_word_t in_BA4, hls_word_t in_BA5, hls_word_t in_BA6, hls_word_t in_BA7, hls_word_t in_BB0, hls_word_t in_BB1, hls_word_t in_BB2, hls_word_t in_BB3, hls_word_t in_BB4, hls_word_t in_BB5, hls_word_t in_BB6, hls_word_t in_BB7) {
    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = in_BA0;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = in_BB0;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n2 = dsp_mul(n0, n1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = in_BA1;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = in_BB1;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n5 = dsp_mul(n3, n4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = in_BA2;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = in_BB2;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n8 = dsp_mul(n6, n7);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = in_BA3;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = in_BB3;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n11 = dsp_mul(n9, n10);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n12 = in_BA4;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n13 = in_BB4;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n14 = dsp_mul(n12, n13);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n15 = in_BA5;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n16 = in_BB5;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n17 = dsp_mul(n15, n16);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n18 = in_BA6;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n19 = in_BB6;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n20 = dsp_mul(n18, n19);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n21 = in_BA7;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n22 = in_BB7;

    // op: mul, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n23 = dsp_mul(n21, n22);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n24 = soft_add(n2, n5);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n25 = soft_add(n24, n8);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n26 = soft_add(n25, n11);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n27 = soft_add(n14, n17);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n28 = soft_add(n27, n20);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n29 = soft_add(n28, n23);

    // op: add, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n30 = soft_add(n26, n29);

    return n30;
}
