`default_nettype none

// benchmark: dot16
// variant: original
// analytical metrics: area=111 latency=33 power=63 dsp=16 lut=15
// rtl intended multiplier/MAC DSPs: 16
// expression: ((((((((((((((((a0 * b0) + (a1 * b1)) + (a2 * b2)) + (a3 * b3)) + (a4 * b4)) + (a5 * b5)) + (a6 * b6)) + (a7 * b7)) + (a8 * b8)) + (a9 * b9)) + (a10 * b10)) + (a11 * b11)) + (a12 * b12)) + (a13 * b13)) + (a14 * b14)) + (a15 * b15))
module dot16_original(
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
    assign n0 = in_a0;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n1;
    assign n1 = in_b0;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n2_full;
    wire signed [31:0] n2;
    assign n2_full = n0 * n1;
    assign n2 = n2_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n3;
    assign n3 = in_a1;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n4;
    assign n4 = in_b1;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n5_full;
    wire signed [31:0] n5;
    assign n5_full = n3 * n4;
    assign n5 = n5_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n6;
    assign n6 = in_a2;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n7;
    assign n7 = in_b2;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n8_full;
    wire signed [31:0] n8;
    assign n8_full = n6 * n7;
    assign n8 = n8_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n9;
    assign n9 = in_a3;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n10;
    assign n10 = in_b3;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n11_full;
    wire signed [31:0] n11;
    assign n11_full = n9 * n10;
    assign n11 = n11_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n12;
    assign n12 = in_a4;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n13;
    assign n13 = in_b4;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n14_full;
    wire signed [31:0] n14;
    assign n14_full = n12 * n13;
    assign n14 = n14_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n15;
    assign n15 = in_a5;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n16;
    assign n16 = in_b5;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n17_full;
    wire signed [31:0] n17;
    assign n17_full = n15 * n16;
    assign n17 = n17_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n18;
    assign n18 = in_a6;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n19;
    assign n19 = in_b6;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n20_full;
    wire signed [31:0] n20;
    assign n20_full = n18 * n19;
    assign n20 = n20_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n21;
    assign n21 = in_a7;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n22;
    assign n22 = in_b7;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n23_full;
    wire signed [31:0] n23;
    assign n23_full = n21 * n22;
    assign n23 = n23_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n24;
    assign n24 = in_a8;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n25;
    assign n25 = in_b8;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n26_full;
    wire signed [31:0] n26;
    assign n26_full = n24 * n25;
    assign n26 = n26_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n27;
    assign n27 = in_a9;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n28;
    assign n28 = in_b9;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n29_full;
    wire signed [31:0] n29;
    assign n29_full = n27 * n28;
    assign n29 = n29_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n30;
    assign n30 = in_a10;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n31;
    assign n31 = in_b10;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n32_full;
    wire signed [31:0] n32;
    assign n32_full = n30 * n31;
    assign n32 = n32_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n33;
    assign n33 = in_a11;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n34;
    assign n34 = in_b11;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n35_full;
    wire signed [31:0] n35;
    assign n35_full = n33 * n34;
    assign n35 = n35_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n36;
    assign n36 = in_a12;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n37;
    assign n37 = in_b12;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n38_full;
    wire signed [31:0] n38;
    assign n38_full = n36 * n37;
    assign n38 = n38_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n39;
    assign n39 = in_a13;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n40;
    assign n40 = in_b13;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n41_full;
    wire signed [31:0] n41;
    assign n41_full = n39 * n40;
    assign n41 = n41_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n42;
    assign n42 = in_a14;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n43;
    assign n43 = in_b14;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n44_full;
    wire signed [31:0] n44;
    assign n44_full = n42 * n43;
    assign n44 = n44_full[31:0];

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n45;
    assign n45 = in_a15;

    // op=input analytical area=0 latency=0 power=0 dsp=0 lut=0
    wire signed [31:0] n46;
    assign n46 = in_b15;

    // op=mul analytical area=6 latency=3 power=3 dsp=1 lut=0
    (* multstyle = "dsp" *) wire signed [63:0] n47_full;
    wire signed [31:0] n47;
    assign n47_full = n45 * n46;
    assign n47 = n47_full[31:0];

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n48;
    assign n48 = n2 + n5;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n49;
    assign n49 = n48 + n8;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n50;
    assign n50 = n49 + n11;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n51;
    assign n51 = n50 + n14;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n52;
    assign n52 = n51 + n17;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n53;
    assign n53 = n52 + n20;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n54;
    assign n54 = n53 + n23;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n55;
    assign n55 = n54 + n26;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n56;
    assign n56 = n55 + n29;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n57;
    assign n57 = n56 + n32;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n58;
    assign n58 = n57 + n35;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n59;
    assign n59 = n58 + n38;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n60;
    assign n60 = n59 + n41;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n61;
    assign n61 = n60 + n44;

    // op=add analytical area=1 latency=2 power=1 dsp=0 lut=1
    wire signed [31:0] n62;
    assign n62 = n61 + n47;

    assign out = n62;
endmodule

`default_nettype wire
