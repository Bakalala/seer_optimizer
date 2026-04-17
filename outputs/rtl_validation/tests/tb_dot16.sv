`timescale 1ns/1ps
`default_nettype none

module tb_dot16;
    logic signed [31:0] in_a0;
    logic signed [31:0] in_a1;
    logic signed [31:0] in_a10;
    logic signed [31:0] in_a11;
    logic signed [31:0] in_a12;
    logic signed [31:0] in_a13;
    logic signed [31:0] in_a14;
    logic signed [31:0] in_a15;
    logic signed [31:0] in_a2;
    logic signed [31:0] in_a3;
    logic signed [31:0] in_a4;
    logic signed [31:0] in_a5;
    logic signed [31:0] in_a6;
    logic signed [31:0] in_a7;
    logic signed [31:0] in_a8;
    logic signed [31:0] in_a9;
    logic signed [31:0] in_b0;
    logic signed [31:0] in_b1;
    logic signed [31:0] in_b10;
    logic signed [31:0] in_b11;
    logic signed [31:0] in_b12;
    logic signed [31:0] in_b13;
    logic signed [31:0] in_b14;
    logic signed [31:0] in_b15;
    logic signed [31:0] in_b2;
    logic signed [31:0] in_b3;
    logic signed [31:0] in_b4;
    logic signed [31:0] in_b5;
    logic signed [31:0] in_b6;
    logic signed [31:0] in_b7;
    logic signed [31:0] in_b8;
    logic signed [31:0] in_b9;
    logic signed [31:0] out_original;
    logic signed [31:0] out_weighted;
    logic signed [31:0] out_latency_unconstrained;
    logic signed [31:0] out_power_unconstrained;
    logic signed [31:0] out_latency_under_dsp;
    logic signed [31:0] expected;

    dot16_original u_original (
        .in_a0(in_a0),
        .in_a1(in_a1),
        .in_a10(in_a10),
        .in_a11(in_a11),
        .in_a12(in_a12),
        .in_a13(in_a13),
        .in_a14(in_a14),
        .in_a15(in_a15),
        .in_a2(in_a2),
        .in_a3(in_a3),
        .in_a4(in_a4),
        .in_a5(in_a5),
        .in_a6(in_a6),
        .in_a7(in_a7),
        .in_a8(in_a8),
        .in_a9(in_a9),
        .in_b0(in_b0),
        .in_b1(in_b1),
        .in_b10(in_b10),
        .in_b11(in_b11),
        .in_b12(in_b12),
        .in_b13(in_b13),
        .in_b14(in_b14),
        .in_b15(in_b15),
        .in_b2(in_b2),
        .in_b3(in_b3),
        .in_b4(in_b4),
        .in_b5(in_b5),
        .in_b6(in_b6),
        .in_b7(in_b7),
        .in_b8(in_b8),
        .in_b9(in_b9),
        .out(out_original)
    );
    dot16_weighted u_weighted (
        .in_a0(in_a0),
        .in_a1(in_a1),
        .in_a10(in_a10),
        .in_a11(in_a11),
        .in_a12(in_a12),
        .in_a13(in_a13),
        .in_a14(in_a14),
        .in_a15(in_a15),
        .in_a2(in_a2),
        .in_a3(in_a3),
        .in_a4(in_a4),
        .in_a5(in_a5),
        .in_a6(in_a6),
        .in_a7(in_a7),
        .in_a8(in_a8),
        .in_a9(in_a9),
        .in_b0(in_b0),
        .in_b1(in_b1),
        .in_b10(in_b10),
        .in_b11(in_b11),
        .in_b12(in_b12),
        .in_b13(in_b13),
        .in_b14(in_b14),
        .in_b15(in_b15),
        .in_b2(in_b2),
        .in_b3(in_b3),
        .in_b4(in_b4),
        .in_b5(in_b5),
        .in_b6(in_b6),
        .in_b7(in_b7),
        .in_b8(in_b8),
        .in_b9(in_b9),
        .out(out_weighted)
    );
    dot16_latency_unconstrained u_latency_unconstrained (
        .in_a0(in_a0),
        .in_a1(in_a1),
        .in_a10(in_a10),
        .in_a11(in_a11),
        .in_a12(in_a12),
        .in_a13(in_a13),
        .in_a14(in_a14),
        .in_a15(in_a15),
        .in_a2(in_a2),
        .in_a3(in_a3),
        .in_a4(in_a4),
        .in_a5(in_a5),
        .in_a6(in_a6),
        .in_a7(in_a7),
        .in_a8(in_a8),
        .in_a9(in_a9),
        .in_b0(in_b0),
        .in_b1(in_b1),
        .in_b10(in_b10),
        .in_b11(in_b11),
        .in_b12(in_b12),
        .in_b13(in_b13),
        .in_b14(in_b14),
        .in_b15(in_b15),
        .in_b2(in_b2),
        .in_b3(in_b3),
        .in_b4(in_b4),
        .in_b5(in_b5),
        .in_b6(in_b6),
        .in_b7(in_b7),
        .in_b8(in_b8),
        .in_b9(in_b9),
        .out(out_latency_unconstrained)
    );
    dot16_power_unconstrained u_power_unconstrained (
        .in_a0(in_a0),
        .in_a1(in_a1),
        .in_a10(in_a10),
        .in_a11(in_a11),
        .in_a12(in_a12),
        .in_a13(in_a13),
        .in_a14(in_a14),
        .in_a15(in_a15),
        .in_a2(in_a2),
        .in_a3(in_a3),
        .in_a4(in_a4),
        .in_a5(in_a5),
        .in_a6(in_a6),
        .in_a7(in_a7),
        .in_a8(in_a8),
        .in_a9(in_a9),
        .in_b0(in_b0),
        .in_b1(in_b1),
        .in_b10(in_b10),
        .in_b11(in_b11),
        .in_b12(in_b12),
        .in_b13(in_b13),
        .in_b14(in_b14),
        .in_b15(in_b15),
        .in_b2(in_b2),
        .in_b3(in_b3),
        .in_b4(in_b4),
        .in_b5(in_b5),
        .in_b6(in_b6),
        .in_b7(in_b7),
        .in_b8(in_b8),
        .in_b9(in_b9),
        .out(out_power_unconstrained)
    );
    dot16_latency_under_dsp u_latency_under_dsp (
        .in_a0(in_a0),
        .in_a1(in_a1),
        .in_a10(in_a10),
        .in_a11(in_a11),
        .in_a12(in_a12),
        .in_a13(in_a13),
        .in_a14(in_a14),
        .in_a15(in_a15),
        .in_a2(in_a2),
        .in_a3(in_a3),
        .in_a4(in_a4),
        .in_a5(in_a5),
        .in_a6(in_a6),
        .in_a7(in_a7),
        .in_a8(in_a8),
        .in_a9(in_a9),
        .in_b0(in_b0),
        .in_b1(in_b1),
        .in_b10(in_b10),
        .in_b11(in_b11),
        .in_b12(in_b12),
        .in_b13(in_b13),
        .in_b14(in_b14),
        .in_b15(in_b15),
        .in_b2(in_b2),
        .in_b3(in_b3),
        .in_b4(in_b4),
        .in_b5(in_b5),
        .in_b6(in_b6),
        .in_b7(in_b7),
        .in_b8(in_b8),
        .in_b9(in_b9),
        .out(out_latency_under_dsp)
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
            golden_expected = (in_a0 * in_b0) + (in_a1 * in_b1) + (in_a2 * in_b2) + (in_a3 * in_b3) + (in_a4 * in_b4) + (in_a5 * in_b5) + (in_a6 * in_b6) + (in_a7 * in_b7) + (in_a8 * in_b8) + (in_a9 * in_b9) + (in_a10 * in_b10) + (in_a11 * in_b11) + (in_a12 * in_b12) + (in_a13 * in_b13) + (in_a14 * in_b14) + (in_a15 * in_b15);
        end
    endfunction

    initial begin
        failures = 0;
        for (int vec = 0; vec < 200; vec++) begin
            in_a0 = signed_value(0, vec);
            in_a1 = signed_value(1, vec);
            in_a10 = signed_value(2, vec);
            in_a11 = signed_value(3, vec);
            in_a12 = signed_value(4, vec);
            in_a13 = signed_value(5, vec);
            in_a14 = signed_value(6, vec);
            in_a15 = signed_value(7, vec);
            in_a2 = signed_value(8, vec);
            in_a3 = signed_value(9, vec);
            in_a4 = signed_value(10, vec);
            in_a5 = signed_value(11, vec);
            in_a6 = signed_value(12, vec);
            in_a7 = signed_value(13, vec);
            in_a8 = signed_value(14, vec);
            in_a9 = signed_value(15, vec);
            in_b0 = signed_value(16, vec);
            in_b1 = signed_value(17, vec);
            in_b10 = signed_value(18, vec);
            in_b11 = signed_value(19, vec);
            in_b12 = signed_value(20, vec);
            in_b13 = signed_value(21, vec);
            in_b14 = signed_value(22, vec);
            in_b15 = signed_value(23, vec);
            in_b2 = signed_value(24, vec);
            in_b3 = signed_value(25, vec);
            in_b4 = signed_value(26, vec);
            in_b5 = signed_value(27, vec);
            in_b6 = signed_value(28, vec);
            in_b7 = signed_value(29, vec);
            in_b8 = signed_value(30, vec);
            in_b9 = signed_value(31, vec);
            #1;
            expected = golden_expected();
            if (out_original !== expected) begin
                $display("FAIL,dot16,original_golden,%0d,%0d,%0d", vec, expected, out_original);
                failures++;
            end
            if (out_weighted !== expected) begin
                $display("FAIL,dot16,weighted_golden,%0d,%0d,%0d", vec, expected, out_weighted);
                failures++;
            end
            if (out_latency_unconstrained !== expected) begin
                $display("FAIL,dot16,latency_unconstrained_golden,%0d,%0d,%0d", vec, expected, out_latency_unconstrained);
                failures++;
            end
            if (out_power_unconstrained !== expected) begin
                $display("FAIL,dot16,power_unconstrained_golden,%0d,%0d,%0d", vec, expected, out_power_unconstrained);
                failures++;
            end
            if (out_latency_under_dsp !== expected) begin
                $display("FAIL,dot16,latency_under_dsp_golden,%0d,%0d,%0d", vec, expected, out_latency_under_dsp);
                failures++;
            end
        end
        if (failures == 0) begin
            $display("PASS,dot16,4,200");
            $finish;
        end
        $display("FAIL_SUMMARY,dot16,%0d", failures);
        $fatal(1);
    end
endmodule

`default_nettype wire
