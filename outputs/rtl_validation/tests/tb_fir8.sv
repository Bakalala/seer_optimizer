`timescale 1ns/1ps
`default_nettype none

module tb_fir8;
    logic signed [31:0] in_x0;
    logic signed [31:0] in_x1;
    logic signed [31:0] in_x2;
    logic signed [31:0] in_x3;
    logic signed [31:0] in_x4;
    logic signed [31:0] in_x5;
    logic signed [31:0] in_x6;
    logic signed [31:0] in_x7;
    logic signed [31:0] out_original;
    logic signed [31:0] out_weighted;
    logic signed [31:0] out_latency_unconstrained;
    logic signed [31:0] out_power_unconstrained;
    logic signed [31:0] out_latency_under_dsp;
    logic signed [31:0] out_latency_under_lut;
    logic signed [31:0] expected;

    fir8_original u_original (
        .in_x0(in_x0),
        .in_x1(in_x1),
        .in_x2(in_x2),
        .in_x3(in_x3),
        .in_x4(in_x4),
        .in_x5(in_x5),
        .in_x6(in_x6),
        .in_x7(in_x7),
        .out(out_original)
    );
    fir8_weighted u_weighted (
        .in_x0(in_x0),
        .in_x1(in_x1),
        .in_x2(in_x2),
        .in_x3(in_x3),
        .in_x4(in_x4),
        .in_x5(in_x5),
        .in_x6(in_x6),
        .in_x7(in_x7),
        .out(out_weighted)
    );
    fir8_latency_unconstrained u_latency_unconstrained (
        .in_x0(in_x0),
        .in_x1(in_x1),
        .in_x2(in_x2),
        .in_x3(in_x3),
        .in_x4(in_x4),
        .in_x5(in_x5),
        .in_x6(in_x6),
        .in_x7(in_x7),
        .out(out_latency_unconstrained)
    );
    fir8_power_unconstrained u_power_unconstrained (
        .in_x0(in_x0),
        .in_x1(in_x1),
        .in_x2(in_x2),
        .in_x3(in_x3),
        .in_x4(in_x4),
        .in_x5(in_x5),
        .in_x6(in_x6),
        .in_x7(in_x7),
        .out(out_power_unconstrained)
    );
    fir8_latency_under_dsp u_latency_under_dsp (
        .in_x0(in_x0),
        .in_x1(in_x1),
        .in_x2(in_x2),
        .in_x3(in_x3),
        .in_x4(in_x4),
        .in_x5(in_x5),
        .in_x6(in_x6),
        .in_x7(in_x7),
        .out(out_latency_under_dsp)
    );
    fir8_latency_under_lut u_latency_under_lut (
        .in_x0(in_x0),
        .in_x1(in_x1),
        .in_x2(in_x2),
        .in_x3(in_x3),
        .in_x4(in_x4),
        .in_x5(in_x5),
        .in_x6(in_x6),
        .in_x7(in_x7),
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
            golden_expected = (32'sd1 * in_x0) + (32'sd2 * in_x1) + (32'sd3 * in_x2) + (32'sd4 * in_x3) + (32'sd4 * in_x4) + (32'sd3 * in_x5) + (32'sd2 * in_x6) + (32'sd1 * in_x7);
        end
    endfunction

    initial begin
        failures = 0;
        for (int vec = 0; vec < 200; vec++) begin
            in_x0 = signed_value(0, vec);
            in_x1 = signed_value(1, vec);
            in_x2 = signed_value(2, vec);
            in_x3 = signed_value(3, vec);
            in_x4 = signed_value(4, vec);
            in_x5 = signed_value(5, vec);
            in_x6 = signed_value(6, vec);
            in_x7 = signed_value(7, vec);
            #1;
            expected = golden_expected();
            if (out_original !== expected) begin
                $display("FAIL,fir8,original_golden,%0d,%0d,%0d", vec, expected, out_original);
                failures++;
            end
            if (out_weighted !== expected) begin
                $display("FAIL,fir8,weighted_golden,%0d,%0d,%0d", vec, expected, out_weighted);
                failures++;
            end
            if (out_latency_unconstrained !== expected) begin
                $display("FAIL,fir8,latency_unconstrained_golden,%0d,%0d,%0d", vec, expected, out_latency_unconstrained);
                failures++;
            end
            if (out_power_unconstrained !== expected) begin
                $display("FAIL,fir8,power_unconstrained_golden,%0d,%0d,%0d", vec, expected, out_power_unconstrained);
                failures++;
            end
            if (out_latency_under_dsp !== expected) begin
                $display("FAIL,fir8,latency_under_dsp_golden,%0d,%0d,%0d", vec, expected, out_latency_under_dsp);
                failures++;
            end
            if (out_latency_under_lut !== expected) begin
                $display("FAIL,fir8,latency_under_lut_golden,%0d,%0d,%0d", vec, expected, out_latency_under_lut);
                failures++;
            end
        end
        if (failures == 0) begin
            $display("PASS,fir8,5,200");
            $finish;
        end
        $display("FAIL_SUMMARY,fir8,%0d", failures);
        $fatal(1);
    end
endmodule

`default_nettype wire
