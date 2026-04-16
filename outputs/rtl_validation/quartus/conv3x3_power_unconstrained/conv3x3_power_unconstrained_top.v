`default_nettype none

module conv3x3_power_unconstrained_top(
    clk,
    resetn,
    valid_in,
    in_p00,
    in_p01,
    in_p02,
    in_p10,
    in_p11,
    in_p12,
    in_p20,
    in_p21,
    in_p22,
    valid_out,
    out
);
    input  wire clk;
    input  wire resetn;
    input  wire valid_in;
    input  wire signed [31:0] in_p00;
    input  wire signed [31:0] in_p01;
    input  wire signed [31:0] in_p02;
    input  wire signed [31:0] in_p10;
    input  wire signed [31:0] in_p11;
    input  wire signed [31:0] in_p12;
    input  wire signed [31:0] in_p20;
    input  wire signed [31:0] in_p21;
    input  wire signed [31:0] in_p22;
    output reg valid_out;
    output reg signed [31:0] out;
    reg signed [31:0] in_p00_r;
    reg signed [31:0] in_p01_r;
    reg signed [31:0] in_p02_r;
    reg signed [31:0] in_p10_r;
    reg signed [31:0] in_p11_r;
    reg signed [31:0] in_p12_r;
    reg signed [31:0] in_p20_r;
    reg signed [31:0] in_p21_r;
    reg signed [31:0] in_p22_r;
    wire signed [31:0] datapath_out;

    conv3x3_power_unconstrained datapath_inst (
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

    always @(posedge clk or negedge resetn) begin
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
