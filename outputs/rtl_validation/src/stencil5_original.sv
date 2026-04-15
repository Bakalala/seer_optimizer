`default_nettype none

// benchmark: stencil5
// variant: original
// analytical metrics: area=34 latency=11 power=19 dsp=5 lut=4
// rtl intended multiplier/MAC DSPs: 5
// expression: (((((4 * center) + (-1 * north)) + (-1 * south)) + (-1 * east)) + (-1 * west))
module stencil5_original(
    input  logic signed [31:0] in_center,
    input  logic signed [31:0] in_east,
    input  logic signed [31:0] in_north,
    input  logic signed [31:0] in_south,
    input  logic signed [31:0] in_west,
    output logic signed [31:0] out
);
    import rtl_validation_ops::*;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n0;
    assign n0 = in_center;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n1;
    assign n1 = in_north;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n2;
    assign n2 = in_south;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n3;
    assign n3 = in_east;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n4;
    assign n4 = in_west;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n5;
    assign n5 = 32'sd4;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n6;
    assign n6 = 32'sd-1;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n7_full;
    logic signed [31:0] n7;
    assign n7_full = n5 * n0;
    assign n7 = n7_full[31:0];

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n8_full;
    logic signed [31:0] n8;
    assign n8_full = n6 * n1;
    assign n8 = n8_full[31:0];

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n9_full;
    logic signed [31:0] n9;
    assign n9_full = n6 * n2;
    assign n9 = n9_full[31:0];

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n10_full;
    logic signed [31:0] n10;
    assign n10_full = n6 * n3;
    assign n10 = n10_full[31:0];

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n11_full;
    logic signed [31:0] n11;
    assign n11_full = n6 * n4;
    assign n11 = n11_full[31:0];

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n12;
    assign n12 = n7 + n8;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n13;
    assign n13 = n12 + n9;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n14;
    assign n14 = n13 + n10;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n15;
    assign n15 = n14 + n11;

    assign out = n15;
endmodule

`default_nettype wire
