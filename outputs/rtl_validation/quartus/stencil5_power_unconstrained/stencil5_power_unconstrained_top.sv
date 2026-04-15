`default_nettype none

module stencil5_power_unconstrained_top(
    input  logic clk,
    input  logic resetn,
    input  logic valid_in,
    input  logic signed [31:0] in_center,
    input  logic signed [31:0] in_east,
    input  logic signed [31:0] in_north,
    input  logic signed [31:0] in_south,
    input  logic signed [31:0] in_west,
    output logic valid_out,
    output logic signed [31:0] out
);
    logic signed [31:0] in_center_r;
    logic signed [31:0] in_east_r;
    logic signed [31:0] in_north_r;
    logic signed [31:0] in_south_r;
    logic signed [31:0] in_west_r;
    logic signed [31:0] datapath_out;

    stencil5_power_unconstrained datapath_inst (
        .in_center(in_center_r),
        .in_east(in_east_r),
        .in_north(in_north_r),
        .in_south(in_south_r),
        .in_west(in_west_r),
        .out(datapath_out)
    );

    always_ff @(posedge clk or negedge resetn) begin
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
