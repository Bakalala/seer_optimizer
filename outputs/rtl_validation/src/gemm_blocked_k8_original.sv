`default_nettype none

// benchmark: gemm_blocked_k8
// variant: original
// analytical metrics: area=55 latency=11 power=31 dsp=8 lut=7
// rtl intended multiplier/MAC DSPs: 8
// expression: (((((BA0 * BB0) + (BA1 * BB1)) + (BA2 * BB2)) + (BA3 * BB3)) + ((((BA4 * BB4) + (BA5 * BB5)) + (BA6 * BB6)) + (BA7 * BB7)))
module gemm_blocked_k8_original(
    input  logic signed [31:0] in_BA0,
    input  logic signed [31:0] in_BA1,
    input  logic signed [31:0] in_BA2,
    input  logic signed [31:0] in_BA3,
    input  logic signed [31:0] in_BA4,
    input  logic signed [31:0] in_BA5,
    input  logic signed [31:0] in_BA6,
    input  logic signed [31:0] in_BA7,
    input  logic signed [31:0] in_BB0,
    input  logic signed [31:0] in_BB1,
    input  logic signed [31:0] in_BB2,
    input  logic signed [31:0] in_BB3,
    input  logic signed [31:0] in_BB4,
    input  logic signed [31:0] in_BB5,
    input  logic signed [31:0] in_BB6,
    input  logic signed [31:0] in_BB7,
    output logic signed [31:0] out
);
    import rtl_validation_ops::*;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n0;
    assign n0 = in_BA0;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n1;
    assign n1 = in_BB0;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n2_full;
    logic signed [31:0] n2;
    assign n2_full = n0 * n1;
    assign n2 = n2_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n3;
    assign n3 = in_BA1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n4;
    assign n4 = in_BB1;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n5_full;
    logic signed [31:0] n5;
    assign n5_full = n3 * n4;
    assign n5 = n5_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n6;
    assign n6 = in_BA2;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n7;
    assign n7 = in_BB2;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n8_full;
    logic signed [31:0] n8;
    assign n8_full = n6 * n7;
    assign n8 = n8_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n9;
    assign n9 = in_BA3;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n10;
    assign n10 = in_BB3;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n11_full;
    logic signed [31:0] n11;
    assign n11_full = n9 * n10;
    assign n11 = n11_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n12;
    assign n12 = in_BA4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n13;
    assign n13 = in_BB4;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n14_full;
    logic signed [31:0] n14;
    assign n14_full = n12 * n13;
    assign n14 = n14_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n15;
    assign n15 = in_BA5;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n16;
    assign n16 = in_BB5;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n17_full;
    logic signed [31:0] n17;
    assign n17_full = n15 * n16;
    assign n17 = n17_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n18;
    assign n18 = in_BA6;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n19;
    assign n19 = in_BB6;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n20_full;
    logic signed [31:0] n20;
    assign n20_full = n18 * n19;
    assign n20 = n20_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n21;
    assign n21 = in_BA7;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n22;
    assign n22 = in_BB7;

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
    assign n27 = n14 + n17;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n28;
    assign n28 = n27 + n20;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n29;
    assign n29 = n28 + n23;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n30;
    assign n30 = n26 + n29;

    assign out = n30;
endmodule

`default_nettype wire
