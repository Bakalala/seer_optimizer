`default_nettype none

module fir8_latency_under_dsp_top(
    clk,
    resetn,
    valid_in,
    in_x0,
    in_x1,
    in_x2,
    in_x3,
    in_x4,
    in_x5,
    in_x6,
    in_x7,
    valid_out,
    out
);
    input  wire clk;
    input  wire resetn;
    input  wire valid_in;
    input  wire signed [31:0] in_x0;
    input  wire signed [31:0] in_x1;
    input  wire signed [31:0] in_x2;
    input  wire signed [31:0] in_x3;
    input  wire signed [31:0] in_x4;
    input  wire signed [31:0] in_x5;
    input  wire signed [31:0] in_x6;
    input  wire signed [31:0] in_x7;
    output logic valid_out;
    output logic signed [31:0] out;
    logic signed [31:0] in_x0_r;
    logic signed [31:0] in_x1_r;
    logic signed [31:0] in_x2_r;
    logic signed [31:0] in_x3_r;
    logic signed [31:0] in_x4_r;
    logic signed [31:0] in_x5_r;
    logic signed [31:0] in_x6_r;
    logic signed [31:0] in_x7_r;
    logic signed [31:0] datapath_out;

    fir8_latency_under_dsp datapath_inst (
        .in_x0(in_x0_r),
        .in_x1(in_x1_r),
        .in_x2(in_x2_r),
        .in_x3(in_x3_r),
        .in_x4(in_x4_r),
        .in_x5(in_x5_r),
        .in_x6(in_x6_r),
        .in_x7(in_x7_r),
        .out(datapath_out)
    );

    always_ff @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            valid_out <= 1'b0;
            out <= 32'sd0;
        end else begin
            valid_out <= valid_in;
            in_x0_r <= in_x0;
            in_x1_r <= in_x1;
            in_x2_r <= in_x2;
            in_x3_r <= in_x3;
            in_x4_r <= in_x4;
            in_x5_r <= in_x5;
            in_x6_r <= in_x6;
            in_x7_r <= in_x7;
            out <= datapath_out;
        end
    end
endmodule

`default_nettype wire
