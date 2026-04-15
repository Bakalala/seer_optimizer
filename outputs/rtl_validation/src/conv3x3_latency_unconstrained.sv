`default_nettype none

// benchmark: conv3x3
// variant: latency_unconstrained
// analytical metrics: area=27 latency=9 power=24 dsp=10 lut=3
// rtl intended multiplier/MAC DSPs: 1
// expression: ((((((4 *dsp p11) +dsp ((((p01 +dsp p01) +dsp p00) +dsp p02) +dsp (p10 +lut p10))) +dsp (p12 +lut p12)) +dsp p20) +dsp (p21 +lut p21)) +dsp p22)
module conv3x3_latency_unconstrained(
    input  logic signed [31:0] in_p00,
    input  logic signed [31:0] in_p01,
    input  logic signed [31:0] in_p02,
    input  logic signed [31:0] in_p10,
    input  logic signed [31:0] in_p11,
    input  logic signed [31:0] in_p12,
    input  logic signed [31:0] in_p20,
    input  logic signed [31:0] in_p21,
    input  logic signed [31:0] in_p22,
    output logic signed [31:0] out
);
    import rtl_validation_ops::*;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n0;
    assign n0 = 32'sd4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n1;
    assign n1 = in_p11;

    // op=mul_dsp analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n2_full;
    logic signed [31:0] n2;
    assign n2_full = n0 * n1;
    assign n2 = n2_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n3;
    assign n3 = in_p01;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n4;
    assign n4 = in_p01;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n5;
    assign n5 = n3 + n4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n6;
    assign n6 = in_p00;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n7;
    assign n7 = n5 + n6;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n8;
    assign n8 = in_p02;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n9;
    assign n9 = n7 + n8;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n10;
    assign n10 = in_p10;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n11;
    assign n11 = in_p10;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n12;
    assign n12 = n10 + n11;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n13;
    assign n13 = n9 + n12;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n14;
    assign n14 = n2 + n13;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n15;
    assign n15 = in_p12;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n16;
    assign n16 = in_p12;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n17;
    assign n17 = n15 + n16;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n18;
    assign n18 = n14 + n17;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n19;
    assign n19 = in_p20;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n20;
    assign n20 = n18 + n19;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n21;
    assign n21 = in_p21;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n22;
    assign n22 = in_p21;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n23;
    assign n23 = n21 + n22;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n24;
    assign n24 = n20 + n23;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n25;
    assign n25 = in_p22;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n26;
    assign n26 = n24 + n25;

    assign out = n26;
endmodule

`default_nettype wire
