// Example instance of the top level module for: 
//     dot16_power_unconstrained
// To include this component in your design, include: 
//     dot16_power_unconstrained.qsys
// in your Quartus project and follow the template 
// below to instantiate the IP.  Alternatively, the IP core 
// can be generated from a Qsys system.

dot16_power_unconstrained dot16_power_unconstrained_inst (
  // Interface: clock (clock end)
  .clock     ( ), // 1-bit clk input
  // Interface: reset (reset end)
  .resetn    ( ), // 1-bit reset_n input
  // Interface: call (conduit sink)
  .start     ( ), // 1-bit valid input
  .busy      ( ), // 1-bit stall output
  // Interface: return (conduit source)
  .done      ( ), // 1-bit valid output
  .stall     ( ), // 1-bit stall input
  // Interface: returndata (conduit source)
  .returndata( ), // 32-bit data output
  // Interface: in_a0 (conduit sink)
  .in_a0     ( ), // 32-bit data input
  // Interface: in_a1 (conduit sink)
  .in_a1     ( ), // 32-bit data input
  // Interface: in_a10 (conduit sink)
  .in_a10    ( ), // 32-bit data input
  // Interface: in_a11 (conduit sink)
  .in_a11    ( ), // 32-bit data input
  // Interface: in_a12 (conduit sink)
  .in_a12    ( ), // 32-bit data input
  // Interface: in_a13 (conduit sink)
  .in_a13    ( ), // 32-bit data input
  // Interface: in_a14 (conduit sink)
  .in_a14    ( ), // 32-bit data input
  // Interface: in_a15 (conduit sink)
  .in_a15    ( ), // 32-bit data input
  // Interface: in_a2 (conduit sink)
  .in_a2     ( ), // 32-bit data input
  // Interface: in_a3 (conduit sink)
  .in_a3     ( ), // 32-bit data input
  // Interface: in_a4 (conduit sink)
  .in_a4     ( ), // 32-bit data input
  // Interface: in_a5 (conduit sink)
  .in_a5     ( ), // 32-bit data input
  // Interface: in_a6 (conduit sink)
  .in_a6     ( ), // 32-bit data input
  // Interface: in_a7 (conduit sink)
  .in_a7     ( ), // 32-bit data input
  // Interface: in_a8 (conduit sink)
  .in_a8     ( ), // 32-bit data input
  // Interface: in_a9 (conduit sink)
  .in_a9     ( ), // 32-bit data input
  // Interface: in_b0 (conduit sink)
  .in_b0     ( ), // 32-bit data input
  // Interface: in_b1 (conduit sink)
  .in_b1     ( ), // 32-bit data input
  // Interface: in_b10 (conduit sink)
  .in_b10    ( ), // 32-bit data input
  // Interface: in_b11 (conduit sink)
  .in_b11    ( ), // 32-bit data input
  // Interface: in_b12 (conduit sink)
  .in_b12    ( ), // 32-bit data input
  // Interface: in_b13 (conduit sink)
  .in_b13    ( ), // 32-bit data input
  // Interface: in_b14 (conduit sink)
  .in_b14    ( ), // 32-bit data input
  // Interface: in_b15 (conduit sink)
  .in_b15    ( ), // 32-bit data input
  // Interface: in_b2 (conduit sink)
  .in_b2     ( ), // 32-bit data input
  // Interface: in_b3 (conduit sink)
  .in_b3     ( ), // 32-bit data input
  // Interface: in_b4 (conduit sink)
  .in_b4     ( ), // 32-bit data input
  // Interface: in_b5 (conduit sink)
  .in_b5     ( ), // 32-bit data input
  // Interface: in_b6 (conduit sink)
  .in_b6     ( ), // 32-bit data input
  // Interface: in_b7 (conduit sink)
  .in_b7     ( ), // 32-bit data input
  // Interface: in_b8 (conduit sink)
  .in_b8     ( ), // 32-bit data input
  // Interface: in_b9 (conduit sink)
  .in_b9     ( )  // 32-bit data input
);
