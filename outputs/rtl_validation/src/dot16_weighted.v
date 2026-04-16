`default_nettype none

// benchmark: dot16
// variant: weighted
// analytical metrics: area=79 latency=36 power=111 dsp=0 lut=143
// rtl intended multiplier/MAC DSPs: 0
// expression: ((a15 *lut b15) +lut ((a14 *lut b14) +lut ((a13 *lut b13) +lut ((a12 *lut b12) +lut ((a11 *lut b11) +lut ((a10 *lut b10) +lut ((a9 *lut b9) +lut ((a8 *lut b8) +lut ((a7 *lut b7) +lut ((a6 *lut b6) +lut ((a5 *lut b5) +lut ((a4 *lut b4) +lut ((a3 *lut b3) +lut ((a2 *lut b2) +lut ((a0 *lut b0) +lut (a1 *lut b1))))))))))))))))
module dot16_weighted(
    in_a0,
    in_a1,
    in_a10,
    in_a11,
    in_a12,
    in_a13,
    in_a14,
    in_a15,
    in_a2,
    in_a3,
    in_a4,
    in_a5,
    in_a6,
    in_a7,
    in_a8,
    in_a9,
    in_b0,
    in_b1,
    in_b10,
    in_b11,
    in_b12,
    in_b13,
    in_b14,
    in_b15,
    in_b2,
    in_b3,
    in_b4,
    in_b5,
    in_b6,
    in_b7,
    in_b8,
    in_b9,
    out
);
    input  wire signed [31:0] in_a0;
    input  wire signed [31:0] in_a1;
    input  wire signed [31:0] in_a10;
    input  wire signed [31:0] in_a11;
    input  wire signed [31:0] in_a12;
    input  wire signed [31:0] in_a13;
    input  wire signed [31:0] in_a14;
    input  wire signed [31:0] in_a15;
    input  wire signed [31:0] in_a2;
    input  wire signed [31:0] in_a3;
    input  wire signed [31:0] in_a4;
    input  wire signed [31:0] in_a5;
    input  wire signed [31:0] in_a6;
    input  wire signed [31:0] in_a7;
    input  wire signed [31:0] in_a8;
    input  wire signed [31:0] in_a9;
    input  wire signed [31:0] in_b0;
    input  wire signed [31:0] in_b1;
    input  wire signed [31:0] in_b10;
    input  wire signed [31:0] in_b11;
    input  wire signed [31:0] in_b12;
    input  wire signed [31:0] in_b13;
    input  wire signed [31:0] in_b14;
    input  wire signed [31:0] in_b15;
    input  wire signed [31:0] in_b2;
    input  wire signed [31:0] in_b3;
    input  wire signed [31:0] in_b4;
    input  wire signed [31:0] in_b5;
    input  wire signed [31:0] in_b6;
    input  wire signed [31:0] in_b7;
    input  wire signed [31:0] in_b8;
    input  wire signed [31:0] in_b9;
    output wire signed [31:0] out;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n0;
    assign n0 = in_a15;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n1;
    assign n1 = in_b15;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n2_full;
    wire signed [31:0] n2;
    assign n2_full = n0 * n1;
    assign n2 = n2_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n3;
    assign n3 = in_a14;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n4;
    assign n4 = in_b14;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n5_full;
    wire signed [31:0] n5;
    assign n5_full = n3 * n4;
    assign n5 = n5_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n6;
    assign n6 = in_a13;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n7;
    assign n7 = in_b13;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n8_full;
    wire signed [31:0] n8;
    assign n8_full = n6 * n7;
    assign n8 = n8_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n9;
    assign n9 = in_a12;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n10;
    assign n10 = in_b12;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n11_full;
    wire signed [31:0] n11;
    assign n11_full = n9 * n10;
    assign n11 = n11_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n12;
    assign n12 = in_a11;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n13;
    assign n13 = in_b11;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n14_full;
    wire signed [31:0] n14;
    assign n14_full = n12 * n13;
    assign n14 = n14_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n15;
    assign n15 = in_a10;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n16;
    assign n16 = in_b10;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n17_full;
    wire signed [31:0] n17;
    assign n17_full = n15 * n16;
    assign n17 = n17_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n18;
    assign n18 = in_a9;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n19;
    assign n19 = in_b9;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n20_full;
    wire signed [31:0] n20;
    assign n20_full = n18 * n19;
    assign n20 = n20_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n21;
    assign n21 = in_a8;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n22;
    assign n22 = in_b8;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n23_full;
    wire signed [31:0] n23;
    assign n23_full = n21 * n22;
    assign n23 = n23_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n24;
    assign n24 = in_a7;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n25;
    assign n25 = in_b7;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n26_full;
    wire signed [31:0] n26;
    assign n26_full = n24 * n25;
    assign n26 = n26_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n27;
    assign n27 = in_a6;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n28;
    assign n28 = in_b6;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n29_full;
    wire signed [31:0] n29;
    assign n29_full = n27 * n28;
    assign n29 = n29_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n30;
    assign n30 = in_a5;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n31;
    assign n31 = in_b5;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n32_full;
    wire signed [31:0] n32;
    assign n32_full = n30 * n31;
    assign n32 = n32_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n33;
    assign n33 = in_a4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n34;
    assign n34 = in_b4;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n35_full;
    wire signed [31:0] n35;
    assign n35_full = n33 * n34;
    assign n35 = n35_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n36;
    assign n36 = in_a3;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n37;
    assign n37 = in_b3;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n38_full;
    wire signed [31:0] n38;
    assign n38_full = n36 * n37;
    assign n38 = n38_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n39;
    assign n39 = in_a2;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n40;
    assign n40 = in_b2;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n41_full;
    wire signed [31:0] n41;
    assign n41_full = n39 * n40;
    assign n41 = n41_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n42;
    assign n42 = in_a0;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n43;
    assign n43 = in_b0;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n44_full;
    wire signed [31:0] n44;
    assign n44_full = n42 * n43;
    assign n44 = n44_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n45;
    assign n45 = in_a1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n46;
    assign n46 = in_b1;

    // op=mul_lut analytical area=4 latency=6 power=6 dsp=0 lut=8
    (* multstyle = "logic" *) wire signed [63:0] n47_full;
    wire signed [31:0] n47;
    assign n47_full = n45 * n46;
    assign n47 = n47_full[31:0];

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n48;
    assign n48 = n44 + n47;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n49;
    assign n49 = n41 + n48;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n50;
    assign n50 = n38 + n49;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n51;
    assign n51 = n35 + n50;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n52;
    assign n52 = n32 + n51;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n53;
    assign n53 = n29 + n52;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n54;
    assign n54 = n26 + n53;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n55;
    assign n55 = n23 + n54;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n56;
    assign n56 = n20 + n55;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n57;
    assign n57 = n17 + n56;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n58;
    assign n58 = n14 + n57;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n59;
    assign n59 = n11 + n58;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n60;
    assign n60 = n8 + n59;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n61;
    assign n61 = n5 + n60;

    // op=add_lut analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n62;
    assign n62 = n2 + n61;

    assign out = n62;
endmodule

`default_nettype wire
