`default_nettype none

module dot16_original_top(
    clk,
    resetn,
    valid_in,
    in_a0,
    in_a1,
    in_a10,
    in_a11,
    in_a12,
    in_a13,
    in_a14,
    in_a15,
    in_a2,
    in_a3,
    in_a4,
    in_a5,
    in_a6,
    in_a7,
    in_a8,
    in_a9,
    in_b0,
    in_b1,
    in_b10,
    in_b11,
    in_b12,
    in_b13,
    in_b14,
    in_b15,
    in_b2,
    in_b3,
    in_b4,
    in_b5,
    in_b6,
    in_b7,
    in_b8,
    in_b9,
    valid_out,
    out
);
    input  wire clk;
    input  wire resetn;
    input  wire valid_in;
    input  wire signed [31:0] in_a0;
    input  wire signed [31:0] in_a1;
    input  wire signed [31:0] in_a10;
    input  wire signed [31:0] in_a11;
    input  wire signed [31:0] in_a12;
    input  wire signed [31:0] in_a13;
    input  wire signed [31:0] in_a14;
    input  wire signed [31:0] in_a15;
    input  wire signed [31:0] in_a2;
    input  wire signed [31:0] in_a3;
    input  wire signed [31:0] in_a4;
    input  wire signed [31:0] in_a5;
    input  wire signed [31:0] in_a6;
    input  wire signed [31:0] in_a7;
    input  wire signed [31:0] in_a8;
    input  wire signed [31:0] in_a9;
    input  wire signed [31:0] in_b0;
    input  wire signed [31:0] in_b1;
    input  wire signed [31:0] in_b10;
    input  wire signed [31:0] in_b11;
    input  wire signed [31:0] in_b12;
    input  wire signed [31:0] in_b13;
    input  wire signed [31:0] in_b14;
    input  wire signed [31:0] in_b15;
    input  wire signed [31:0] in_b2;
    input  wire signed [31:0] in_b3;
    input  wire signed [31:0] in_b4;
    input  wire signed [31:0] in_b5;
    input  wire signed [31:0] in_b6;
    input  wire signed [31:0] in_b7;
    input  wire signed [31:0] in_b8;
    input  wire signed [31:0] in_b9;
    output logic valid_out;
    output logic signed [31:0] out;
    logic signed [31:0] in_a0_r;
    logic signed [31:0] in_a1_r;
    logic signed [31:0] in_a10_r;
    logic signed [31:0] in_a11_r;
    logic signed [31:0] in_a12_r;
    logic signed [31:0] in_a13_r;
    logic signed [31:0] in_a14_r;
    logic signed [31:0] in_a15_r;
    logic signed [31:0] in_a2_r;
    logic signed [31:0] in_a3_r;
    logic signed [31:0] in_a4_r;
    logic signed [31:0] in_a5_r;
    logic signed [31:0] in_a6_r;
    logic signed [31:0] in_a7_r;
    logic signed [31:0] in_a8_r;
    logic signed [31:0] in_a9_r;
    logic signed [31:0] in_b0_r;
    logic signed [31:0] in_b1_r;
    logic signed [31:0] in_b10_r;
    logic signed [31:0] in_b11_r;
    logic signed [31:0] in_b12_r;
    logic signed [31:0] in_b13_r;
    logic signed [31:0] in_b14_r;
    logic signed [31:0] in_b15_r;
    logic signed [31:0] in_b2_r;
    logic signed [31:0] in_b3_r;
    logic signed [31:0] in_b4_r;
    logic signed [31:0] in_b5_r;
    logic signed [31:0] in_b6_r;
    logic signed [31:0] in_b7_r;
    logic signed [31:0] in_b8_r;
    logic signed [31:0] in_b9_r;
    logic signed [31:0] datapath_out;

    dot16_original datapath_inst (
        .in_a0(in_a0_r),
        .in_a1(in_a1_r),
        .in_a10(in_a10_r),
        .in_a11(in_a11_r),
        .in_a12(in_a12_r),
        .in_a13(in_a13_r),
        .in_a14(in_a14_r),
        .in_a15(in_a15_r),
        .in_a2(in_a2_r),
        .in_a3(in_a3_r),
        .in_a4(in_a4_r),
        .in_a5(in_a5_r),
        .in_a6(in_a6_r),
        .in_a7(in_a7_r),
        .in_a8(in_a8_r),
        .in_a9(in_a9_r),
        .in_b0(in_b0_r),
        .in_b1(in_b1_r),
        .in_b10(in_b10_r),
        .in_b11(in_b11_r),
        .in_b12(in_b12_r),
        .in_b13(in_b13_r),
        .in_b14(in_b14_r),
        .in_b15(in_b15_r),
        .in_b2(in_b2_r),
        .in_b3(in_b3_r),
        .in_b4(in_b4_r),
        .in_b5(in_b5_r),
        .in_b6(in_b6_r),
        .in_b7(in_b7_r),
        .in_b8(in_b8_r),
        .in_b9(in_b9_r),
        .out(datapath_out)
    );

    always_ff @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            valid_out <= 1'b0;
            out <= 32'sd0;
        end else begin
            valid_out <= valid_in;
            in_a0_r <= in_a0;
            in_a1_r <= in_a1;
            in_a10_r <= in_a10;
            in_a11_r <= in_a11;
            in_a12_r <= in_a12;
            in_a13_r <= in_a13;
            in_a14_r <= in_a14;
            in_a15_r <= in_a15;
            in_a2_r <= in_a2;
            in_a3_r <= in_a3;
            in_a4_r <= in_a4;
            in_a5_r <= in_a5;
            in_a6_r <= in_a6;
            in_a7_r <= in_a7;
            in_a8_r <= in_a8;
            in_a9_r <= in_a9;
            in_b0_r <= in_b0;
            in_b1_r <= in_b1;
            in_b10_r <= in_b10;
            in_b11_r <= in_b11;
            in_b12_r <= in_b12;
            in_b13_r <= in_b13;
            in_b14_r <= in_b14;
            in_b15_r <= in_b15;
            in_b2_r <= in_b2;
            in_b3_r <= in_b3;
            in_b4_r <= in_b4;
            in_b5_r <= in_b5;
            in_b6_r <= in_b6;
            in_b7_r <= in_b7;
            in_b8_r <= in_b8;
            in_b9_r <= in_b9;
            out <= datapath_out;
        end
    end
endmodule

`default_nettype wire
