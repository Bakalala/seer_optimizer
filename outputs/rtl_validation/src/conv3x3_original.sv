`default_nettype none

// benchmark: conv3x3
// variant: original
// analytical metrics: area=62 latency=19 power=35 dsp=9 lut=8
// rtl intended multiplier/MAC DSPs: 9
// expression: (((((((((1 * p00) + (2 * p01)) + (1 * p02)) + (2 * p10)) + (4 * p11)) + (2 * p12)) + (1 * p20)) + (2 * p21)) + (1 * p22))
module conv3x3_original(
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

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n0;
    assign n0 = in_p00;

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
    assign n3 = in_p01;

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
    assign n6 = in_p02;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n7;
    assign n7 = 32'sd1;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n8_full;
    logic signed [31:0] n8;
    assign n8_full = n7 * n6;
    assign n8 = n8_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n9;
    assign n9 = in_p10;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n10;
    assign n10 = 32'sd2;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n11_full;
    logic signed [31:0] n11;
    assign n11_full = n10 * n9;
    assign n11 = n11_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n12;
    assign n12 = in_p11;

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
    assign n15 = in_p12;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n16;
    assign n16 = 32'sd2;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n17_full;
    logic signed [31:0] n17;
    assign n17_full = n16 * n15;
    assign n17 = n17_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n18;
    assign n18 = in_p20;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n19;
    assign n19 = 32'sd1;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n20_full;
    logic signed [31:0] n20;
    assign n20_full = n19 * n18;
    assign n20 = n20_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n21;
    assign n21 = in_p21;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n22;
    assign n22 = 32'sd2;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n23_full;
    logic signed [31:0] n23;
    assign n23_full = n22 * n21;
    assign n23 = n23_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n24;
    assign n24 = in_p22;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n25;
    assign n25 = 32'sd1;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n26_full;
    logic signed [31:0] n26;
    assign n26_full = n25 * n24;
    assign n26 = n26_full[31:0];

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n27;
    assign n27 = n2 + n5;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n28;
    assign n28 = n27 + n8;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n29;
    assign n29 = n28 + n11;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n30;
    assign n30 = n29 + n14;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n31;
    assign n31 = n30 + n17;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n32;
    assign n32 = n31 + n20;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n33;
    assign n33 = n32 + n23;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n34;
    assign n34 = n33 + n26;

    assign out = n34;
endmodule

`default_nettype wire
