`default_nettype none

// benchmark: stencil5
// variant: weighted
// analytical metrics: area=24 latency=14 power=34 dsp=0 lut=44
// rtl intended multiplier/MAC DSPs: 0
// expression: ((-1 *lut west) +lut ((-1 *lut east) +lut ((-1 *lut south) +lut ((-1 *lut north) +lut (4 *lut center)))))
module stencil5_weighted(
    input  logic signed [31:0] in_center,
    input  logic signed [31:0] in_east,
    input  logic signed [31:0] in_north,
    input  logic signed [31:0] in_south,
    input  logic signed [31:0] in_west,
    output logic signed [31:0] out
);
    import rtl_validation_ops::*;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n0;
    assign n0 = 32'sd-1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n1;
    assign n1 = in_west;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n2;
    assign n2 = soft_mul32(n0, n1);

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n3;
    assign n3 = 32'sd-1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n4;
    assign n4 = in_east;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n5;
    assign n5 = soft_mul32(n3, n4);

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n6;
    assign n6 = 32'sd-1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n7;
    assign n7 = in_south;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n8;
    assign n8 = soft_mul32(n6, n7);

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n9;
    assign n9 = 32'sd-1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n10;
    assign n10 = in_north;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n11;
    assign n11 = soft_mul32(n9, n10);

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n12;
    assign n12 = 32'sd4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n13;
    assign n13 = in_center;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n14;
    assign n14 = soft_mul32(n12, n13);

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n15;
    assign n15 = n11 + n14;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n16;
    assign n16 = n8 + n15;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n17;
    assign n17 = n5 + n16;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    logic signed [31:0] n18;
    assign n18 = n2 + n17;

    assign out = n18;
endmodule

`default_nettype wire
