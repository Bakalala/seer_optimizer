`default_nettype none

// benchmark: fir8
// variant: latency_under_dsp
// analytical metrics: area=25 latency=18 power=33 dsp=0 lut=41
// rtl intended multiplier/MAC DSPs: 0
// expression: ((((3 *lut x5) +lut ((4 *lut x4) +lut ((4 *lut x3) +lut ((3 *lut x2) +lut ((x1 +lut x1) +lut x0))))) +lut (x6 +lut x6)) +lut x7)
module fir8_latency_under_dsp(
    in_x0,
    in_x1,
    in_x2,
    in_x3,
    in_x4,
    in_x5,
    in_x6,
    in_x7,
    out
);
    input  wire signed [31:0] in_x0;
    input  wire signed [31:0] in_x1;
    input  wire signed [31:0] in_x2;
    input  wire signed [31:0] in_x3;
    input  wire signed [31:0] in_x4;
    input  wire signed [31:0] in_x5;
    input  wire signed [31:0] in_x6;
    input  wire signed [31:0] in_x7;
    output wire signed [31:0] out;
    import rtl_validation_ops::*;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n0;
    assign n0 = 32'sd3;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n1;
    assign n1 = in_x5;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n2;
    assign n2 = soft_mul32(n0, n1);

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n3;
    assign n3 = 32'sd4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n4;
    assign n4 = in_x4;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n5;
    assign n5 = soft_mul32(n3, n4);

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n6;
    assign n6 = 32'sd4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n7;
    assign n7 = in_x3;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n8;
    assign n8 = soft_mul32(n6, n7);

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n9;
    assign n9 = 32'sd3;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n10;
    assign n10 = in_x2;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n11;
    assign n11 = soft_mul32(n9, n10);

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n12;
    assign n12 = in_x1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n13;
    assign n13 = in_x1;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n14;
    assign n14 = n12 + n13;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n15;
    assign n15 = in_x0;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n16;
    assign n16 = n14 + n15;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n17;
    assign n17 = n11 + n16;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n18;
    assign n18 = n8 + n17;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n19;
    assign n19 = n5 + n18;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n20;
    assign n20 = n2 + n19;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n21;
    assign n21 = in_x6;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n22;
    assign n22 = in_x6;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n23;
    assign n23 = n21 + n22;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n24;
    assign n24 = n20 + n23;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n25;
    assign n25 = in_x7;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n26;
    assign n26 = n24 + n25;

    assign out = n26;
endmodule

`default_nettype wire
