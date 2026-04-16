`default_nettype none

module stencil5_weighted_top(
    clk,
    resetn,
    valid_in,
    in_center,
    in_east,
    in_north,
    in_south,
    in_west,
    valid_out,
    out
);
    input  wire clk;
    input  wire resetn;
    input  wire valid_in;
    input  wire signed [31:0] in_center;
    input  wire signed [31:0] in_east;
    input  wire signed [31:0] in_north;
    input  wire signed [31:0] in_south;
    input  wire signed [31:0] in_west;
    output reg valid_out;
    output reg signed [31:0] out;
    reg signed [31:0] in_center_r;
    reg signed [31:0] in_east_r;
    reg signed [31:0] in_north_r;
    reg signed [31:0] in_south_r;
    reg signed [31:0] in_west_r;
    wire signed [31:0] datapath_out;

    stencil5_weighted datapath_inst (
        .in_center(in_center_r),
        .in_east(in_east_r),
        .in_north(in_north_r),
        .in_south(in_south_r),
        .in_west(in_west_r),
        .out(datapath_out)
    );

    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            valid_out <= 1'b0;
            out <= 32'sd0;
        end else begin
            valid_out <= valid_in;
            in_center_r <= in_center;
            in_east_r <= in_east;
            in_north_r <= in_north;
            in_south_r <= in_south;
            in_west_r <= in_west;
            out <= datapath_out;
        end
    end
endmodule

`default_nettype wire
