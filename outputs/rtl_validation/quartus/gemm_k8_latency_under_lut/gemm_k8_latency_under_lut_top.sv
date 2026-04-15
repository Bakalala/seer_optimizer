`default_nettype none

module gemm_k8_latency_under_lut_top(
    input  logic clk,
    input  logic resetn,
    input  logic valid_in,
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
    output logic valid_out,
    output logic signed [31:0] out
);
    logic signed [31:0] in_A0_r;
    logic signed [31:0] in_A1_r;
    logic signed [31:0] in_A2_r;
    logic signed [31:0] in_A3_r;
    logic signed [31:0] in_A4_r;
    logic signed [31:0] in_A5_r;
    logic signed [31:0] in_A6_r;
    logic signed [31:0] in_A7_r;
    logic signed [31:0] in_B0_r;
    logic signed [31:0] in_B1_r;
    logic signed [31:0] in_B2_r;
    logic signed [31:0] in_B3_r;
    logic signed [31:0] in_B4_r;
    logic signed [31:0] in_B5_r;
    logic signed [31:0] in_B6_r;
    logic signed [31:0] in_B7_r;
    logic signed [31:0] datapath_out;

    gemm_k8_latency_under_lut datapath_inst (
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

    always_ff @(posedge clk or negedge resetn) begin
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
