`default_nettype none

module gemm_k8_weighted_top(
    clk,
    resetn,
    valid_in,
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
    valid_out,
    out
);
    input  wire clk;
    input  wire resetn;
    input  wire valid_in;
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
    output reg valid_out;
    output reg signed [31:0] out;
    reg signed [31:0] in_A0_r;
    reg signed [31:0] in_A1_r;
    reg signed [31:0] in_A2_r;
    reg signed [31:0] in_A3_r;
    reg signed [31:0] in_A4_r;
    reg signed [31:0] in_A5_r;
    reg signed [31:0] in_A6_r;
    reg signed [31:0] in_A7_r;
    reg signed [31:0] in_B0_r;
    reg signed [31:0] in_B1_r;
    reg signed [31:0] in_B2_r;
    reg signed [31:0] in_B3_r;
    reg signed [31:0] in_B4_r;
    reg signed [31:0] in_B5_r;
    reg signed [31:0] in_B6_r;
    reg signed [31:0] in_B7_r;
    wire signed [31:0] datapath_out;

    gemm_k8_weighted datapath_inst (
        .in_A0(in_A0_r),
        .in_A1(in_A1_r),
        .in_A2(in_A2_r),
        .in_A3(in_A3_r),
        .in_A4(in_A4_r),
        .in_A5(in_A5_r),
        .in_A6(in_A6_r),
        .in_A7(in_A7_r),
        .in_B0(in_B0_r),
        .in_B1(in_B1_r),
        .in_B2(in_B2_r),
        .in_B3(in_B3_r),
        .in_B4(in_B4_r),
        .in_B5(in_B5_r),
        .in_B6(in_B6_r),
        .in_B7(in_B7_r),
        .out(datapath_out)
    );

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            valid_out <= 1'b0;
            out <= 32'sd0;
        end else begin
            valid_out <= valid_in;
            in_A0_r <= in_A0;
            in_A1_r <= in_A1;
            in_A2_r <= in_A2;
            in_A3_r <= in_A3;
            in_A4_r <= in_A4;
            in_A5_r <= in_A5;
            in_A6_r <= in_A6;
            in_A7_r <= in_A7;
            in_B0_r <= in_B0;
            in_B1_r <= in_B1;
            in_B2_r <= in_B2;
            in_B3_r <= in_B3;
            in_B4_r <= in_B4;
            in_B5_r <= in_B5;
            in_B6_r <= in_B6;
            in_B7_r <= in_B7;
            out <= datapath_out;
        end
    end
endmodule

`default_nettype wire
