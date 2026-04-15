`default_nettype none

module conv3x3_latency_under_lut_top(
    input  logic clk,
    input  logic resetn,
    input  logic valid_in,
    input  logic signed [31:0] in_p00,
    input  logic signed [31:0] in_p01,
    input  logic signed [31:0] in_p02,
    input  logic signed [31:0] in_p10,
    input  logic signed [31:0] in_p11,
    input  logic signed [31:0] in_p12,
    input  logic signed [31:0] in_p20,
    input  logic signed [31:0] in_p21,
    input  logic signed [31:0] in_p22,
    output logic valid_out,
    output logic signed [31:0] out
);
    logic signed [31:0] in_p00_r;
    logic signed [31:0] in_p01_r;
    logic signed [31:0] in_p02_r;
    logic signed [31:0] in_p10_r;
    logic signed [31:0] in_p11_r;
    logic signed [31:0] in_p12_r;
    logic signed [31:0] in_p20_r;
    logic signed [31:0] in_p21_r;
    logic signed [31:0] in_p22_r;
    logic signed [31:0] datapath_out;

    conv3x3_latency_under_lut datapath_inst (
        .in_p00(in_p00_r),
        .in_p01(in_p01_r),
        .in_p02(in_p02_r),
        .in_p10(in_p10_r),
        .in_p11(in_p11_r),
        .in_p12(in_p12_r),
        .in_p20(in_p20_r),
        .in_p21(in_p21_r),
        .in_p22(in_p22_r),
        .out(datapath_out)
    );

    always_ff @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            valid_out <= 1'b0;
            out <= 32'sd0;
        end else begin
            valid_out <= valid_in;
            in_p00_r <= in_p00;
            in_p01_r <= in_p01;
            in_p02_r <= in_p02;
            in_p10_r <= in_p10;
            in_p11_r <= in_p11;
            in_p12_r <= in_p12;
            in_p20_r <= in_p20;
            in_p21_r <= in_p21;
            in_p22_r <= in_p22;
            out <= datapath_out;
        end
    end
endmodule

`default_nettype wire
