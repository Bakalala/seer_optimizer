`default_nettype none

// benchmark: fir8
// variant: original
// analytical metrics: area=55 latency=17 power=31 dsp=8 lut=7
// rtl intended multiplier/MAC DSPs: 8
// expression: ((((((((1 * x0) + (2 * x1)) + (3 * x2)) + (4 * x3)) + (4 * x4)) + (3 * x5)) + (2 * x6)) + (1 * x7))
module fir8_original(
    input  logic signed [31:0] in_x0,
    input  logic signed [31:0] in_x1,
    input  logic signed [31:0] in_x2,
    input  logic signed [31:0] in_x3,
    input  logic signed [31:0] in_x4,
    input  logic signed [31:0] in_x5,
    input  logic signed [31:0] in_x6,
    input  logic signed [31:0] in_x7,
    output logic signed [31:0] out
);
    import rtl_validation_ops::*;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n0;
    assign n0 = in_x0;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n1;
    assign n1 = 32'sd1;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n2_full;
    logic signed [31:0] n2;
    assign n2_full = n1 * n0;
    assign n2 = n2_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n3;
    assign n3 = in_x1;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n4;
    assign n4 = 32'sd2;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n5_full;
    logic signed [31:0] n5;
    assign n5_full = n4 * n3;
    assign n5 = n5_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n6;
    assign n6 = in_x2;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n7;
    assign n7 = 32'sd3;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n8_full;
    logic signed [31:0] n8;
    assign n8_full = n7 * n6;
    assign n8 = n8_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n9;
    assign n9 = in_x3;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n10;
    assign n10 = 32'sd4;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n11_full;
    logic signed [31:0] n11;
    assign n11_full = n10 * n9;
    assign n11 = n11_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n12;
    assign n12 = in_x4;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n13;
    assign n13 = 32'sd4;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n14_full;
    logic signed [31:0] n14;
    assign n14_full = n13 * n12;
    assign n14 = n14_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n15;
    assign n15 = in_x5;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n16;
    assign n16 = 32'sd3;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n17_full;
    logic signed [31:0] n17;
    assign n17_full = n16 * n15;
    assign n17 = n17_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n18;
    assign n18 = in_x6;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n19;
    assign n19 = 32'sd2;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n20_full;
    logic signed [31:0] n20;
    assign n20_full = n19 * n18;
    assign n20 = n20_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n21;
    assign n21 = in_x7;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n22;
    assign n22 = 32'sd1;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n23_full;
    logic signed [31:0] n23;
    assign n23_full = n22 * n21;
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
