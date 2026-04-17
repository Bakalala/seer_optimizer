`timescale 1ns/1ps
`default_nettype none

module tb_gemm_k8;
    logic signed [31:0] in_A0;
    logic signed [31:0] in_A1;
    logic signed [31:0] in_A2;
    logic signed [31:0] in_A3;
    logic signed [31:0] in_A4;
    logic signed [31:0] in_A5;
    logic signed [31:0] in_A6;
    logic signed [31:0] in_A7;
    logic signed [31:0] in_B0;
    logic signed [31:0] in_B1;
    logic signed [31:0] in_B2;
    logic signed [31:0] in_B3;
    logic signed [31:0] in_B4;
    logic signed [31:0] in_B5;
    logic signed [31:0] in_B6;
    logic signed [31:0] in_B7;
    logic signed [31:0] out_original;
    logic signed [31:0] out_weighted;
    logic signed [31:0] out_latency_unconstrained;
    logic signed [31:0] out_power_unconstrained;
    logic signed [31:0] out_latency_under_dsp;
    logic signed [31:0] out_latency_under_lut;
    logic signed [31:0] expected;

    gemm_k8_original u_original (
        .in_A0(in_A0),
        .in_A1(in_A1),
        .in_A2(in_A2),
        .in_A3(in_A3),
        .in_A4(in_A4),
        .in_A5(in_A5),
        .in_A6(in_A6),
        .in_A7(in_A7),
        .in_B0(in_B0),
        .in_B1(in_B1),
        .in_B2(in_B2),
        .in_B3(in_B3),
        .in_B4(in_B4),
        .in_B5(in_B5),
        .in_B6(in_B6),
        .in_B7(in_B7),
        .out(out_original)
    );
    gemm_k8_weighted u_weighted (
        .in_A0(in_A0),
        .in_A1(in_A1),
        .in_A2(in_A2),
        .in_A3(in_A3),
        .in_A4(in_A4),
        .in_A5(in_A5),
        .in_A6(in_A6),
        .in_A7(in_A7),
        .in_B0(in_B0),
        .in_B1(in_B1),
        .in_B2(in_B2),
        .in_B3(in_B3),
        .in_B4(in_B4),
        .in_B5(in_B5),
        .in_B6(in_B6),
        .in_B7(in_B7),
        .out(out_weighted)
    );
    gemm_k8_latency_unconstrained u_latency_unconstrained (
        .in_A0(in_A0),
        .in_A1(in_A1),
        .in_A2(in_A2),
        .in_A3(in_A3),
        .in_A4(in_A4),
        .in_A5(in_A5),
        .in_A6(in_A6),
        .in_A7(in_A7),
        .in_B0(in_B0),
        .in_B1(in_B1),
        .in_B2(in_B2),
        .in_B3(in_B3),
        .in_B4(in_B4),
        .in_B5(in_B5),
        .in_B6(in_B6),
        .in_B7(in_B7),
        .out(out_latency_unconstrained)
    );
    gemm_k8_power_unconstrained u_power_unconstrained (
        .in_A0(in_A0),
        .in_A1(in_A1),
        .in_A2(in_A2),
        .in_A3(in_A3),
        .in_A4(in_A4),
        .in_A5(in_A5),
        .in_A6(in_A6),
        .in_A7(in_A7),
        .in_B0(in_B0),
        .in_B1(in_B1),
        .in_B2(in_B2),
        .in_B3(in_B3),
        .in_B4(in_B4),
        .in_B5(in_B5),
        .in_B6(in_B6),
        .in_B7(in_B7),
        .out(out_power_unconstrained)
    );
    gemm_k8_latency_under_dsp u_latency_under_dsp (
        .in_A0(in_A0),
        .in_A1(in_A1),
        .in_A2(in_A2),
        .in_A3(in_A3),
        .in_A4(in_A4),
        .in_A5(in_A5),
        .in_A6(in_A6),
        .in_A7(in_A7),
        .in_B0(in_B0),
        .in_B1(in_B1),
        .in_B2(in_B2),
        .in_B3(in_B3),
        .in_B4(in_B4),
        .in_B5(in_B5),
        .in_B6(in_B6),
        .in_B7(in_B7),
        .out(out_latency_under_dsp)
    );
    gemm_k8_latency_under_lut u_latency_under_lut (
        .in_A0(in_A0),
        .in_A1(in_A1),
        .in_A2(in_A2),
        .in_A3(in_A3),
        .in_A4(in_A4),
        .in_A5(in_A5),
        .in_A6(in_A6),
        .in_A7(in_A7),
        .in_B0(in_B0),
        .in_B1(in_B1),
        .in_B2(in_B2),
        .in_B3(in_B3),
        .in_B4(in_B4),
        .in_B5(in_B5),
        .in_B6(in_B6),
        .in_B7(in_B7),
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
            golden_expected = (in_A0 * in_B0) + (in_A1 * in_B1) + (in_A2 * in_B2) + (in_A3 * in_B3) + (in_A4 * in_B4) + (in_A5 * in_B5) + (in_A6 * in_B6) + (in_A7 * in_B7);
        end
    endfunction

    initial begin
        failures = 0;
        for (int vec = 0; vec < 200; vec++) begin
            in_A0 = signed_value(0, vec);
            in_A1 = signed_value(1, vec);
            in_A2 = signed_value(2, vec);
            in_A3 = signed_value(3, vec);
            in_A4 = signed_value(4, vec);
            in_A5 = signed_value(5, vec);
            in_A6 = signed_value(6, vec);
            in_A7 = signed_value(7, vec);
            in_B0 = signed_value(8, vec);
            in_B1 = signed_value(9, vec);
            in_B2 = signed_value(10, vec);
            in_B3 = signed_value(11, vec);
            in_B4 = signed_value(12, vec);
            in_B5 = signed_value(13, vec);
            in_B6 = signed_value(14, vec);
            in_B7 = signed_value(15, vec);
            #1;
            expected = golden_expected();
            if (out_original !== expected) begin
                $display("FAIL,gemm_k8,original_golden,%0d,%0d,%0d", vec, expected, out_original);
                failures++;
            end
            if (out_weighted !== expected) begin
                $display("FAIL,gemm_k8,weighted_golden,%0d,%0d,%0d", vec, expected, out_weighted);
                failures++;
            end
            if (out_latency_unconstrained !== expected) begin
                $display("FAIL,gemm_k8,latency_unconstrained_golden,%0d,%0d,%0d", vec, expected, out_latency_unconstrained);
                failures++;
            end
            if (out_power_unconstrained !== expected) begin
                $display("FAIL,gemm_k8,power_unconstrained_golden,%0d,%0d,%0d", vec, expected, out_power_unconstrained);
                failures++;
            end
            if (out_latency_under_dsp !== expected) begin
                $display("FAIL,gemm_k8,latency_under_dsp_golden,%0d,%0d,%0d", vec, expected, out_latency_under_dsp);
                failures++;
            end
            if (out_latency_under_lut !== expected) begin
                $display("FAIL,gemm_k8,latency_under_lut_golden,%0d,%0d,%0d", vec, expected, out_latency_under_lut);
                failures++;
            end
        end
        if (failures == 0) begin
            $display("PASS,gemm_k8,5,200");
            $finish;
        end
        $display("FAIL_SUMMARY,gemm_k8,%0d", failures);
        $fatal(1);
    end
endmodule

`default_nettype wire
