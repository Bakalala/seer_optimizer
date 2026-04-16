`default_nettype none

// benchmark: stencil5
// variant: latency_unconstrained
// analytical metrics: area=36 latency=7 power=26 dsp=8 lut=8
// rtl intended multiplier/MAC DSPs: 4
// expression: ((-1 *lut west) +dsp ((-1 *dsp east) +dsp ((-1 *dsp south) +dsp ((-1 *dsp north) +dsp (4 *dsp center)))))
module stencil5_latency_unconstrained(
    in_center,
    in_east,
    in_north,
    in_south,
    in_west,
    out
);
    input  wire signed [31:0] in_center;
    input  wire signed [31:0] in_east;
    input  wire signed [31:0] in_north;
    input  wire signed [31:0] in_south;
    input  wire signed [31:0] in_west;
    output wire signed [31:0] out;
    import rtl_validation_ops::*;

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n0;
    assign n0 = -32'sd1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n1;
    assign n1 = in_west;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    logic signed [31:0] n2;
    assign n2 = soft_mul32(n0, n1);

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n3;
    assign n3 = -32'sd1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n4;
    assign n4 = in_east;

    // op=mul_dsp analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n5_full;
    logic signed [31:0] n5;
    assign n5_full = n3 * n4;
    assign n5 = n5_full[31:0];

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n6;
    assign n6 = -32'sd1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n7;
    assign n7 = in_south;

    // op=mul_dsp analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n8_full;
    logic signed [31:0] n8;
    assign n8_full = n6 * n7;
    assign n8 = n8_full[31:0];

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n9;
    assign n9 = -32'sd1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n10;
    assign n10 = in_north;

    // op=mul_dsp analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n11_full;
    logic signed [31:0] n11;
    assign n11_full = n9 * n10;
    assign n11 = n11_full[31:0];

    // op=const analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n12;
    assign n12 = 32'sd4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    logic signed [31:0] n13;
    assign n13 = in_center;

    // op=mul_dsp analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) logic signed [63:0] n14_full;
    logic signed [31:0] n14;
    assign n14_full = n12 * n13;
    assign n14 = n14_full[31:0];

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n15;
    assign n15 = n11 + n14;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n16;
    assign n16 = n8 + n15;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n17;
    assign n17 = n5 + n16;

    // op=add_dsp analytical area=2 latency=1 power=2 dsp=1 lut=0
    logic signed [31:0] n18;
    assign n18 = n2 + n17;

    assign out = n18;
endmodule

`default_nettype wire
