// Example instance of the top level module for: 
//     conv3x3_original
// To include this component in your design, include: 
//     conv3x3_original.qsys
// in your Quartus project and follow the template 
// below to instantiate the IP.  Alternatively, the IP core 
// can be generated from a Qsys system.

conv3x3_original conv3x3_original_inst (
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
  // Interface: in_p00 (conduit sink)
  .in_p00    ( ), // 32-bit data input
  // Interface: in_p01 (conduit sink)
  .in_p01    ( ), // 32-bit data input
  // Interface: in_p02 (conduit sink)
  .in_p02    ( ), // 32-bit data input
  // Interface: in_p10 (conduit sink)
  .in_p10    ( ), // 32-bit data input
  // Interface: in_p11 (conduit sink)
  .in_p11    ( ), // 32-bit data input
  // Interface: in_p12 (conduit sink)
  .in_p12    ( ), // 32-bit data input
  // Interface: in_p20 (conduit sink)
  .in_p20    ( ), // 32-bit data input
  // Interface: in_p21 (conduit sink)
  .in_p21    ( ), // 32-bit data input
  // Interface: in_p22 (conduit sink)
  .in_p22    ( )  // 32-bit data input
);
