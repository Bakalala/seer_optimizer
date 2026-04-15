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
            signed_value = 32'sd-16 + raw;
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
            if (out_weighted !== out_original) begin
                $display("FAIL,fir8,weighted,%0d,%0d,%0d", vec, out_original, out_weighted);
                failures++;
            end
            if (out_latency_unconstrained !== out_original) begin
                $display("FAIL,fir8,latency_unconstrained,%0d,%0d,%0d", vec, out_original, out_latency_unconstrained);
                failures++;
            end
            if (out_power_unconstrained !== out_original) begin
                $display("FAIL,fir8,power_unconstrained,%0d,%0d,%0d", vec, out_original, out_power_unconstrained);
                failures++;
            end
            if (out_latency_under_dsp !== out_original) begin
                $display("FAIL,fir8,latency_under_dsp,%0d,%0d,%0d", vec, out_original, out_latency_under_dsp);
                failures++;
            end
            if (out_latency_under_lut !== out_original) begin
                $display("FAIL,fir8,latency_under_lut,%0d,%0d,%0d", vec, out_original, out_latency_under_lut);
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
