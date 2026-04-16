`default_nettype none

module gemm_blocked_k8_latency_under_lut_top(
    clk,
    resetn,
    valid_in,
    in_BA0,
    in_BA1,
    in_BA2,
    in_BA3,
    in_BA4,
    in_BA5,
    in_BA6,
    in_BA7,
    in_BB0,
    in_BB1,
    in_BB2,
    in_BB3,
    in_BB4,
    in_BB5,
    in_BB6,
    in_BB7,
    valid_out,
    out
);
    input  wire clk;
    input  wire resetn;
    input  wire valid_in;
    input  wire signed [31:0] in_BA0;
    input  wire signed [31:0] in_BA1;
    input  wire signed [31:0] in_BA2;
    input  wire signed [31:0] in_BA3;
    input  wire signed [31:0] in_BA4;
    input  wire signed [31:0] in_BA5;
    input  wire signed [31:0] in_BA6;
    input  wire signed [31:0] in_BA7;
    input  wire signed [31:0] in_BB0;
    input  wire signed [31:0] in_BB1;
    input  wire signed [31:0] in_BB2;
    input  wire signed [31:0] in_BB3;
    input  wire signed [31:0] in_BB4;
    input  wire signed [31:0] in_BB5;
    input  wire signed [31:0] in_BB6;
    input  wire signed [31:0] in_BB7;
    output reg valid_out;
    output reg signed [31:0] out;
    reg signed [31:0] in_BA0_r;
    reg signed [31:0] in_BA1_r;
    reg signed [31:0] in_BA2_r;
    reg signed [31:0] in_BA3_r;
    reg signed [31:0] in_BA4_r;
    reg signed [31:0] in_BA5_r;
    reg signed [31:0] in_BA6_r;
    reg signed [31:0] in_BA7_r;
    reg signed [31:0] in_BB0_r;
    reg signed [31:0] in_BB1_r;
    reg signed [31:0] in_BB2_r;
    reg signed [31:0] in_BB3_r;
    reg signed [31:0] in_BB4_r;
    reg signed [31:0] in_BB5_r;
    reg signed [31:0] in_BB6_r;
    reg signed [31:0] in_BB7_r;
    wire signed [31:0] datapath_out;

    gemm_blocked_k8_latency_under_lut datapath_inst (
        .in_BA0(in_BA0_r),
        .in_BA1(in_BA1_r),
        .in_BA2(in_BA2_r),
        .in_BA3(in_BA3_r),
        .in_BA4(in_BA4_r),
        .in_BA5(in_BA5_r),
        .in_BA6(in_BA6_r),
        .in_BA7(in_BA7_r),
        .in_BB0(in_BB0_r),
        .in_BB1(in_BB1_r),
        .in_BB2(in_BB2_r),
        .in_BB3(in_BB3_r),
        .in_BB4(in_BB4_r),
        .in_BB5(in_BB5_r),
        .in_BB6(in_BB6_r),
        .in_BB7(in_BB7_r),
        .out(datapath_out)
    );

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            valid_out <= 1'b0;
            out <= 32'sd0;
        end else begin
            valid_out <= valid_in;
            in_BA0_r <= in_BA0;
            in_BA1_r <= in_BA1;
            in_BA2_r <= in_BA2;
            in_BA3_r <= in_BA3;
            in_BA4_r <= in_BA4;
            in_BA5_r <= in_BA5;
            in_BA6_r <= in_BA6;
            in_BA7_r <= in_BA7;
            in_BB0_r <= in_BB0;
            in_BB1_r <= in_BB1;
            in_BB2_r <= in_BB2;
            in_BB3_r <= in_BB3;
            in_BB4_r <= in_BB4;
            in_BB5_r <= in_BB5;
            in_BB6_r <= in_BB6;
            in_BB7_r <= in_BB7;
            out <= datapath_out;
        end
    end
endmodule

`default_nettype wire
