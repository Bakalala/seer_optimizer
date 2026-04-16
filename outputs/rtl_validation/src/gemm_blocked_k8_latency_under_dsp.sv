`default_nettype none

// benchmark: gemm_blocked_k8
// variant: latency_under_dsp
// analytical metrics: area=39 latency=14 power=55 dsp=0 lut=71
// rtl intended multiplier/MAC DSPs: 0
// expression: (((BA3 *lut BB3) +lut ((BA2 *lut BB2) +lut ((BA0 *lut BB0) +lut (BA1 *lut BB1)))) +lut ((BA7 *lut BB7) +lut ((BA6 *lut BB6) +lut ((BA4 *lut BB4) +lut (BA5 *lut BB5)))))
module gemm_blocked_k8_latency_under_dsp(
    in_BA0,
    in_BA1,
    in_BA2,
    in_BA3,
    in_BA4,
    in_BA5,
    in_BA6,
    in_BA7,
    in_BB0,
    in_BB1,
    in_BB2,
    in_BB3,
    in_BB4,
    in_BB5,
    in_BB6,
    in_BB7,
    out
);
    input  wire signed [31:0] in_BA0;
    input  wire signed [31:0] in_BA1;
    input  wire signed [31:0] in_BA2;
    input  wire signed [31:0] in_BA3;
    input  wire signed [31:0] in_BA4;
    input  wire signed [31:0] in_BA5;
    input  wire signed [31:0] in_BA6;
    input  wire signed [31:0] in_BA7;
    input  wire signed [31:0] in_BB0;
    input  wire signed [31:0] in_BB1;
    input  wire signed [31:0] in_BB2;
    input  wire signed [31:0] in_BB3;
    input  wire signed [31:0] in_BB4;
    input  wire signed [31:0] in_BB5;
    input  wire signed [31:0] in_BB6;
    input  wire signed [31:0] in_BB7;
    output wire signed [31:0] out;
    import rtl_validation_ops::*;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n0;
    assign n0 = in_BA3;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n1;
    assign n1 = in_BB3;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n2;
    assign n2 = soft_mul32(n0, n1);

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n3;
    assign n3 = in_BA2;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n4;
    assign n4 = in_BB2;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n5;
    assign n5 = soft_mul32(n3, n4);

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n6;
    assign n6 = in_BA0;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n7;
    assign n7 = in_BB0;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n8;
    assign n8 = soft_mul32(n6, n7);

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n9;
    assign n9 = in_BA1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n10;
    assign n10 = in_BB1;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n11;
    assign n11 = soft_mul32(n9, n10);

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n12;
    assign n12 = n8 + n11;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n13;
    assign n13 = n5 + n12;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n14;
    assign n14 = n2 + n13;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n15;
    assign n15 = in_BA7;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n16;
    assign n16 = in_BB7;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n17;
    assign n17 = soft_mul32(n15, n16);

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n18;
    assign n18 = in_BA6;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n19;
    assign n19 = in_BB6;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n20;
    assign n20 = soft_mul32(n18, n19);

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n21;
    assign n21 = in_BA4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n22;
    assign n22 = in_BB4;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n23;
    assign n23 = soft_mul32(n21, n22);

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n24;
    assign n24 = in_BA5;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n25;
    assign n25 = in_BB5;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n26;
    assign n26 = soft_mul32(n24, n25);

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n27;
    assign n27 = n23 + n26;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n28;
    assign n28 = n20 + n27;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n29;
    assign n29 = n17 + n28;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n30;
    assign n30 = n14 + n29;

    assign out = n30;
endmodule

`default_nettype wire
