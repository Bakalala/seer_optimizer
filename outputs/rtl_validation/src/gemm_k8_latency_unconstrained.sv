`default_nettype none

// benchmark: gemm_k8
// variant: latency_unconstrained
// analytical metrics: area=54 latency=10 power=50 dsp=11 lut=32
// rtl intended multiplier/MAC DSPs: 4
// expression: ((A7 *lut B7) +dsp ((A6 *lut B6) +dsp ((A5 *lut B5) +dsp ((A4 *lut B4) +dsp ((A3 *dsp B3) +dsp ((A2 *dsp B2) +dsp ((A0 *dsp B0) +dsp (A1 *dsp B1))))))))
module gemm_k8_latency_unconstrained(
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
    assign n0 = in_A7;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n1;
    assign n1 = in_B7;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n2;
    assign n2 = soft_mul32(n0, n1);

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n3;
    assign n3 = in_A6;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n4;
    assign n4 = in_B6;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n5;
    assign n5 = soft_mul32(n3, n4);

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n6;
    assign n6 = in_A5;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n7;
    assign n7 = in_B5;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n8;
    assign n8 = soft_mul32(n6, n7);

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n9;
    assign n9 = in_A4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n10;
    assign n10 = in_B4;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n11;
    assign n11 = soft_mul32(n9, n10);

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n12;
    assign n12 = in_A3;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n13;
    assign n13 = in_B3;

    // op=mul_dsp analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n14_full;
    logic signed [31:0] n14;
    assign n14_full = n12 * n13;
    assign n14 = n14_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n15;
    assign n15 = in_A2;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n16;
    assign n16 = in_B2;

    // op=mul_dsp analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n17_full;
    logic signed [31:0] n17;
    assign n17_full = n15 * n16;
    assign n17 = n17_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n18;
    assign n18 = in_A0;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n19;
    assign n19 = in_B0;

    // op=mul_dsp analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n20_full;
    logic signed [31:0] n20;
    assign n20_full = n18 * n19;
    assign n20 = n20_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n21;
    assign n21 = in_A1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n22;
    assign n22 = in_B1;

    // op=mul_dsp analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n23_full;
    logic signed [31:0] n23;
    assign n23_full = n21 * n22;
    assign n23 = n23_full[31:0];

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n24;
    assign n24 = n20 + n23;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n25;
    assign n25 = n17 + n24;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n26;
    assign n26 = n14 + n25;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n27;
    assign n27 = n11 + n26;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n28;
    assign n28 = n8 + n27;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n29;
    assign n29 = n5 + n28;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n30;
    assign n30 = n2 + n29;

    assign out = n30;
endmodule

`default_nettype wire
