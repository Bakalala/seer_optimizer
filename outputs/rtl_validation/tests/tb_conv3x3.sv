`timescale 1ns/1ps
`default_nettype none

module tb_conv3x3;
    logic signed [31:0] in_p00;
    logic signed [31:0] in_p01;
    logic signed [31:0] in_p02;
    logic signed [31:0] in_p10;
    logic signed [31:0] in_p11;
    logic signed [31:0] in_p12;
    logic signed [31:0] in_p20;
    logic signed [31:0] in_p21;
    logic signed [31:0] in_p22;
    logic signed [31:0] out_original;
    logic signed [31:0] out_weighted;
    logic signed [31:0] out_latency_unconstrained;
    logic signed [31:0] out_power_unconstrained;
    logic signed [31:0] out_latency_under_dsp;
    logic signed [31:0] out_latency_under_lut;

    conv3x3_original u_original (
        .in_p00(in_p00),
        .in_p01(in_p01),
        .in_p02(in_p02),
        .in_p10(in_p10),
        .in_p11(in_p11),
        .in_p12(in_p12),
        .in_p20(in_p20),
        .in_p21(in_p21),
        .in_p22(in_p22),
        .out(out_original)
    );
    conv3x3_weighted u_weighted (
        .in_p00(in_p00),
        .in_p01(in_p01),
        .in_p02(in_p02),
        .in_p10(in_p10),
        .in_p11(in_p11),
        .in_p12(in_p12),
        .in_p20(in_p20),
        .in_p21(in_p21),
        .in_p22(in_p22),
        .out(out_weighted)
    );
    conv3x3_latency_unconstrained u_latency_unconstrained (
        .in_p00(in_p00),
        .in_p01(in_p01),
        .in_p02(in_p02),
        .in_p10(in_p10),
        .in_p11(in_p11),
        .in_p12(in_p12),
        .in_p20(in_p20),
        .in_p21(in_p21),
        .in_p22(in_p22),
        .out(out_latency_unconstrained)
    );
    conv3x3_power_unconstrained u_power_unconstrained (
        .in_p00(in_p00),
        .in_p01(in_p01),
        .in_p02(in_p02),
        .in_p10(in_p10),
        .in_p11(in_p11),
        .in_p12(in_p12),
        .in_p20(in_p20),
        .in_p21(in_p21),
        .in_p22(in_p22),
        .out(out_power_unconstrained)
    );
    conv3x3_latency_under_dsp u_latency_under_dsp (
        .in_p00(in_p00),
        .in_p01(in_p01),
        .in_p02(in_p02),
        .in_p10(in_p10),
        .in_p11(in_p11),
        .in_p12(in_p12),
        .in_p20(in_p20),
        .in_p21(in_p21),
        .in_p22(in_p22),
        .out(out_latency_under_dsp)
    );
    conv3x3_latency_under_lut u_latency_under_lut (
        .in_p00(in_p00),
        .in_p01(in_p01),
        .in_p02(in_p02),
        .in_p10(in_p10),
        .in_p11(in_p11),
        .in_p12(in_p12),
        .in_p20(in_p20),
        .in_p21(in_p21),
        .in_p22(in_p22),
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

    initial begin
        failures = 0;
        for (int vec = 0; vec < 200; vec++) begin
            in_p00 = signed_value(0, vec);
            in_p01 = signed_value(1, vec);
            in_p02 = signed_value(2, vec);
            in_p10 = signed_value(3, vec);
            in_p11 = signed_value(4, vec);
            in_p12 = signed_value(5, vec);
            in_p20 = signed_value(6, vec);
            in_p21 = signed_value(7, vec);
            in_p22 = signed_value(8, vec);
            #1;
            if (out_weighted !== out_original) begin
                $display("FAIL,conv3x3,weighted,%0d,%0d,%0d", vec, out_original, out_weighted);
                failures++;
            end
            if (out_latency_unconstrained !== out_original) begin
                $display("FAIL,conv3x3,latency_unconstrained,%0d,%0d,%0d", vec, out_original, out_latency_unconstrained);
                failures++;
            end
            if (out_power_unconstrained !== out_original) begin
                $display("FAIL,conv3x3,power_unconstrained,%0d,%0d,%0d", vec, out_original, out_power_unconstrained);
                failures++;
            end
            if (out_latency_under_dsp !== out_original) begin
                $display("FAIL,conv3x3,latency_under_dsp,%0d,%0d,%0d", vec, out_original, out_latency_under_dsp);
                failures++;
            end
            if (out_latency_under_lut !== out_original) begin
                $display("FAIL,conv3x3,latency_under_lut,%0d,%0d,%0d", vec, out_original, out_latency_under_lut);
                failures++;
            end
        end
        if (failures == 0) begin
            $display("PASS,conv3x3,5,200");
            $finish;
        end
        $display("FAIL_SUMMARY,conv3x3,%0d", failures);
        $fatal(1);
    end
endmodule

`default_nettype wire
