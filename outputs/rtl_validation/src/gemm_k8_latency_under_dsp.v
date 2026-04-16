`default_nettype none

// benchmark: gemm_k8
// variant: latency_under_dsp
// analytical metrics: area=39 latency=20 power=55 dsp=0 lut=71
// rtl intended multiplier/MAC DSPs: 0
// expression: ((A7 *lut B7) +lut ((A6 *lut B6) +lut ((A5 *lut B5) +lut ((A4 *lut B4) +lut ((A3 *lut B3) +lut ((A2 *lut B2) +lut ((A0 *lut B0) +lut (A1 *lut B1))))))))
module gemm_k8_latency_under_dsp(
    in_A0,
    in_A1,
    in_A2,
    in_A3,
    in_A4,
    in_A5,
    in_A6,
    in_A7,
    in_B0,
    in_B1,
    in_B2,
    in_B3,
    in_B4,
    in_B5,
    in_B6,
    in_B7,
    out
);
    input  wire signed [31:0] in_A0;
    input  wire signed [31:0] in_A1;
    input  wire signed [31:0] in_A2;
    input  wire signed [31:0] in_A3;
    input  wire signed [31:0] in_A4;
    input  wire signed [31:0] in_A5;
    input  wire signed [31:0] in_A6;
    input  wire signed [31:0] in_A7;
    input  wire signed [31:0] in_B0;
    input  wire signed [31:0] in_B1;
    input  wire signed [31:0] in_B2;
    input  wire signed [31:0] in_B3;
    input  wire signed [31:0] in_B4;
    input  wire signed [31:0] in_B5;
    input  wire signed [31:0] in_B6;
    input  wire signed [31:0] in_B7;
    output wire signed [31:0] out;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n0;
    assign n0 = in_A7;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n1;
    assign n1 = in_B7;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n2_full;
    wire signed [31:0] n2;
    assign n2_full = n0 * n1;
    assign n2 = n2_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n3;
    assign n3 = in_A6;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n4;
    assign n4 = in_B6;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n5_full;
    wire signed [31:0] n5;
    assign n5_full = n3 * n4;
    assign n5 = n5_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n6;
    assign n6 = in_A5;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n7;
    assign n7 = in_B5;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n8_full;
    wire signed [31:0] n8;
    assign n8_full = n6 * n7;
    assign n8 = n8_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n9;
    assign n9 = in_A4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n10;
    assign n10 = in_B4;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n11_full;
    wire signed [31:0] n11;
    assign n11_full = n9 * n10;
    assign n11 = n11_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n12;
    assign n12 = in_A3;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n13;
    assign n13 = in_B3;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n14_full;
    wire signed [31:0] n14;
    assign n14_full = n12 * n13;
    assign n14 = n14_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n15;
    assign n15 = in_A2;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n16;
    assign n16 = in_B2;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n17_full;
    wire signed [31:0] n17;
    assign n17_full = n15 * n16;
    assign n17 = n17_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n18;
    assign n18 = in_A0;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n19;
    assign n19 = in_B0;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n20_full;
    wire signed [31:0] n20;
    assign n20_full = n18 * n19;
    assign n20 = n20_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n21;
    assign n21 = in_A1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n22;
    assign n22 = in_B1;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n23_full;
    wire signed [31:0] n23;
    assign n23_full = n21 * n22;
    assign n23 = n23_full[31:0];

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n24;
    assign n24 = n20 + n23;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n25;
    assign n25 = n17 + n24;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n26;
    assign n26 = n14 + n25;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n27;
    assign n27 = n11 + n26;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n28;
    assign n28 = n8 + n27;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n29;
    assign n29 = n5 + n28;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n30;
    assign n30 = n2 + n29;

    assign out = n30;
endmodule

`default_nettype wire
