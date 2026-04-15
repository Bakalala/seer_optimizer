`default_nettype none

// benchmark: gemm_k8
// variant: original
// analytical metrics: area=55 latency=17 power=31 dsp=8 lut=7
// rtl intended multiplier/MAC DSPs: 8
// expression: ((((((((A0 * B0) + (A1 * B1)) + (A2 * B2)) + (A3 * B3)) + (A4 * B4)) + (A5 * B5)) + (A6 * B6)) + (A7 * B7))
module gemm_k8_original(
    input  logic signed [31:0] in_A0,
    input  logic signed [31:0] in_A1,
    input  logic signed [31:0] in_A2,
    input  logic signed [31:0] in_A3,
    input  logic signed [31:0] in_A4,
    input  logic signed [31:0] in_A5,
    input  logic signed [31:0] in_A6,
    input  logic signed [31:0] in_A7,
    input  logic signed [31:0] in_B0,
    input  logic signed [31:0] in_B1,
    input  logic signed [31:0] in_B2,
    input  logic signed [31:0] in_B3,
    input  logic signed [31:0] in_B4,
    input  logic signed [31:0] in_B5,
    input  logic signed [31:0] in_B6,
    input  logic signed [31:0] in_B7,
    output logic signed [31:0] out
);
    import rtl_validation_ops::*;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n0;
    assign n0 = in_A0;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n1;
    assign n1 = in_B0;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n2_full;
    logic signed [31:0] n2;
    assign n2_full = n0 * n1;
    assign n2 = n2_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n3;
    assign n3 = in_A1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n4;
    assign n4 = in_B1;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n5_full;
    logic signed [31:0] n5;
    assign n5_full = n3 * n4;
    assign n5 = n5_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n6;
    assign n6 = in_A2;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n7;
    assign n7 = in_B2;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n8_full;
    logic signed [31:0] n8;
    assign n8_full = n6 * n7;
    assign n8 = n8_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n9;
    assign n9 = in_A3;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n10;
    assign n10 = in_B3;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n11_full;
    logic signed [31:0] n11;
    assign n11_full = n9 * n10;
    assign n11 = n11_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n12;
    assign n12 = in_A4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n13;
    assign n13 = in_B4;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n14_full;
    logic signed [31:0] n14;
    assign n14_full = n12 * n13;
    assign n14 = n14_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n15;
    assign n15 = in_A5;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n16;
    assign n16 = in_B5;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n17_full;
    logic signed [31:0] n17;
    assign n17_full = n15 * n16;
    assign n17 = n17_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n18;
    assign n18 = in_A6;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n19;
    assign n19 = in_B6;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n20_full;
    logic signed [31:0] n20;
    assign n20_full = n18 * n19;
    assign n20 = n20_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n21;
    assign n21 = in_A7;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n22;
    assign n22 = in_B7;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n23_full;
    logic signed [31:0] n23;
    assign n23_full = n21 * n22;
    assign n23 = n23_full[31:0];

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n24;
    assign n24 = n2 + n5;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n25;
    assign n25 = n24 + n8;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n26;
    assign n26 = n25 + n11;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n27;
    assign n27 = n26 + n14;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n28;
    assign n28 = n27 + n17;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n29;
    assign n29 = n28 + n20;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n30;
    assign n30 = n29 + n23;

    assign out = n30;
endmodule

`default_nettype wire
