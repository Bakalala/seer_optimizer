`default_nettype none

package rtl_validation_ops;
    function automatic logic signed [31:0] soft_mul32(
        input logic signed [31:0] a,
        input logic signed [31:0] b
    );
        logic [31:0] abs_a;
        logic [31:0] abs_b;
        logic [63:0] acc;
        logic neg;
        begin
            neg = a[31] ^ b[31];
            abs_a = a[31] ? $unsigned(-a) : $unsigned(a);
            abs_b = b[31] ? $unsigned(-b) : $unsigned(b);
            acc = 64'd0;
            for (int i = 0; i < 32; i++) begin
                if (abs_b[i]) begin
                    acc = acc + ({32'd0, abs_a} << i);
                end
            end
            soft_mul32 = neg ? -$signed(acc[31:0]) : $signed(acc[31:0]);
        end
    endfunction
endpackage

`default_nettype wire
