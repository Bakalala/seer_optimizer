`timescale 1ns/1ps
`default_nettype none

module tb_stencil5;
    logic signed [31:0] in_center;
    logic signed [31:0] in_east;
    logic signed [31:0] in_north;
    logic signed [31:0] in_south;
    logic signed [31:0] in_west;
    logic signed [31:0] out_original;
    logic signed [31:0] out_weighted;
    logic signed [31:0] out_latency_unconstrained;
    logic signed [31:0] out_power_unconstrained;
    logic signed [31:0] out_latency_under_dsp;
    logic signed [31:0] out_latency_under_lut;
    logic signed [31:0] expected;

    stencil5_original u_original (
        .in_center(in_center),
        .in_east(in_east),
        .in_north(in_north),
        .in_south(in_south),
        .in_west(in_west),
        .out(out_original)
    );
    stencil5_weighted u_weighted (
        .in_center(in_center),
        .in_east(in_east),
        .in_north(in_north),
        .in_south(in_south),
        .in_west(in_west),
        .out(out_weighted)
    );
    stencil5_latency_unconstrained u_latency_unconstrained (
        .in_center(in_center),
        .in_east(in_east),
        .in_north(in_north),
        .in_south(in_south),
        .in_west(in_west),
        .out(out_latency_unconstrained)
    );
    stencil5_power_unconstrained u_power_unconstrained (
        .in_center(in_center),
        .in_east(in_east),
        .in_north(in_north),
        .in_south(in_south),
        .in_west(in_west),
        .out(out_power_unconstrained)
    );
    stencil5_latency_under_dsp u_latency_under_dsp (
        .in_center(in_center),
        .in_east(in_east),
        .in_north(in_north),
        .in_south(in_south),
        .in_west(in_west),
        .out(out_latency_under_dsp)
    );
    stencil5_latency_under_lut u_latency_under_lut (
        .in_center(in_center),
        .in_east(in_east),
        .in_north(in_north),
        .in_south(in_south),
        .in_west(in_west),
        .out(out_latency_under_lut)
    );

    int failures;

    function automatic logic signed [31:0] signed_value(input int input_idx, input int vec);
        int raw;
        begin
            raw = ((vec * 17) + (input_idx * 31) + 7) % 33;
            signed_value = -32'sd16 + raw;
        end
    endfunction

    function automatic logic signed [31:0] golden_expected;
        begin
            golden_expected = (32'sd4 * in_center) + (-32'sd1 * in_north) + (-32'sd1 * in_south) + (-32'sd1 * in_east) + (-32'sd1 * in_west);
        end
    endfunction

    initial begin
        failures = 0;
        for (int vec = 0; vec < 200; vec++) begin
            in_center = signed_value(0, vec);
            in_east = signed_value(1, vec);
            in_north = signed_value(2, vec);
            in_south = signed_value(3, vec);
            in_west = signed_value(4, vec);
            #1;
            expected = golden_expected();
            if (out_original !== expected) begin
                $display("FAIL,stencil5,original_golden,%0d,%0d,%0d", vec, expected, out_original);
                failures++;
            end
            if (out_weighted !== expected) begin
                $display("FAIL,stencil5,weighted_golden,%0d,%0d,%0d", vec, expected, out_weighted);
                failures++;
            end
            if (out_latency_unconstrained !== expected) begin
                $display("FAIL,stencil5,latency_unconstrained_golden,%0d,%0d,%0d", vec, expected, out_latency_unconstrained);
                failures++;
            end
            if (out_power_unconstrained !== expected) begin
                $display("FAIL,stencil5,power_unconstrained_golden,%0d,%0d,%0d", vec, expected, out_power_unconstrained);
                failures++;
            end
            if (out_latency_under_dsp !== expected) begin
                $display("FAIL,stencil5,latency_under_dsp_golden,%0d,%0d,%0d", vec, expected, out_latency_under_dsp);
                failures++;
            end
            if (out_latency_under_lut !== expected) begin
                $display("FAIL,stencil5,latency_under_lut_golden,%0d,%0d,%0d", vec, expected, out_latency_under_lut);
                failures++;
            end
        end
        if (failures == 0) begin
            $display("PASS,stencil5,5,200");
            $finish;
        end
        $display("FAIL_SUMMARY,stencil5,%0d", failures);
        $fatal(1);
    end
endmodule

`default_nettype wire
