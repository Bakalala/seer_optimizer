#include "generated_datapaths.hpp"

// benchmark: dot16
// variant: power_unconstrained
// analytical metrics: area=93 latency=33 power=90 dsp=7 lut=87
// expression: ((a15 *dsp b15) +lut ((a14 *dsp b14) +lut ((a13 *dsp b13) +lut ((a12 *dsp b12) +lut ((a11 *lut b11) +lut ((a10 *lut b10) +lut ((a9 *lut b9) +lut ((a8 *lut b8) +lut ((a7 *lut b7) +lut ((a6 *lut b6) +lut ((a5 *lut b5) +lut ((a4 *lut b4) +lut ((a3 *lut b3) +lut ((a2 *dsp b2) +lut ((a0 *dsp b0) +lut (a1 *dsp b1))))))))))))))))

extern "C" HLS_COMPONENT hls_word_t dot16_power_unconstrained(hls_word_t in_a0, hls_word_t in_a1, hls_word_t in_a10, hls_word_t in_a11, hls_word_t in_a12, hls_word_t in_a13, hls_word_t in_a14, hls_word_t in_a15, hls_word_t in_a2, hls_word_t in_a3, hls_word_t in_a4, hls_word_t in_a5, hls_word_t in_a6, hls_word_t in_a7, hls_word_t in_a8, hls_word_t in_a9, hls_word_t in_b0, hls_word_t in_b1, hls_word_t in_b10, hls_word_t in_b11, hls_word_t in_b12, hls_word_t in_b13, hls_word_t in_b14, hls_word_t in_b15, hls_word_t in_b2, hls_word_t in_b3, hls_word_t in_b4, hls_word_t in_b5, hls_word_t in_b6, hls_word_t in_b7, hls_word_t in_b8, hls_word_t in_b9) {
    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n0 = in_a15;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n1 = in_b15;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n2 = dsp_mul(n0, n1);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n3 = in_a14;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n4 = in_b14;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n5 = dsp_mul(n3, n4);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n6 = in_a13;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n7 = in_b13;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n8 = dsp_mul(n6, n7);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n9 = in_a12;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n10 = in_b12;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n11 = dsp_mul(n9, n10);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n12 = in_a11;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n13 = in_b11;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n14 = soft_mul(n12, n13);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n15 = in_a10;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n16 = in_b10;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n17 = soft_mul(n15, n16);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n18 = in_a9;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n19 = in_b9;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n20 = soft_mul(n18, n19);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n21 = in_a8;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n22 = in_b8;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n23 = soft_mul(n21, n22);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n24 = in_a7;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n25 = in_b7;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n26 = soft_mul(n24, n25);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n27 = in_a6;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n28 = in_b6;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n29 = soft_mul(n27, n28);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n30 = in_a5;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n31 = in_b5;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n32 = soft_mul(n30, n31);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n33 = in_a4;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n34 = in_b4;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n35 = soft_mul(n33, n34);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n36 = in_a3;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n37 = in_b3;

    // op: mul_lut, analytical area=4 latency=6 power=6 dsp=0 lut=8
    hls_word_t n38 = soft_mul(n36, n37);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n39 = in_a2;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n40 = in_b2;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n41 = dsp_mul(n39, n40);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n42 = in_a0;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n43 = in_b0;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n44 = dsp_mul(n42, n43);

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n45 = in_a1;

    // op: input, analytical area=0 latency=0 power=0 dsp=0 lut=0
    hls_word_t n46 = in_b1;

    // op: mul_dsp, analytical area=6 latency=3 power=3 dsp=1 lut=0
    hls_word_t n47 = dsp_mul(n45, n46);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n48 = soft_add(n44, n47);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n49 = soft_add(n41, n48);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n50 = soft_add(n38, n49);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n51 = soft_add(n35, n50);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n52 = soft_add(n32, n51);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n53 = soft_add(n29, n52);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n54 = soft_add(n26, n53);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n55 = soft_add(n23, n54);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n56 = soft_add(n20, n55);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n57 = soft_add(n17, n56);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n58 = soft_add(n14, n57);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n59 = soft_add(n11, n58);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n60 = soft_add(n8, n59);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n61 = soft_add(n5, n60);

    // op: add_lut, analytical area=1 latency=2 power=1 dsp=0 lut=1
    hls_word_t n62 = soft_add(n2, n61);

    return n62;
}
