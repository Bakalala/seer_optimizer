// Example instance of the top level module for: 
//     fir8_latency_unconstrained
// To include this component in your design, include: 
//     fir8_latency_unconstrained.qsys
// in your Quartus project and follow the template 
// below to instantiate the IP.  Alternatively, the IP core 
// can be generated from a Qsys system.

fir8_latency_unconstrained fir8_latency_unconstrained_inst (
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
  // Interface: in_x0 (conduit sink)
  .in_x0     ( ), // 32-bit data input
  // Interface: in_x1 (conduit sink)
  .in_x1     ( ), // 32-bit data input
  // Interface: in_x2 (conduit sink)
  .in_x2     ( ), // 32-bit data input
  // Interface: in_x3 (conduit sink)
  .in_x3     ( ), // 32-bit data input
  // Interface: in_x4 (conduit sink)
  .in_x4     ( ), // 32-bit data input
  // Interface: in_x5 (conduit sink)
  .in_x5     ( ), // 32-bit data input
  // Interface: in_x6 (conduit sink)
  .in_x6     ( ), // 32-bit data input
  // Interface: in_x7 (conduit sink)
  .in_x7     ( )  // 32-bit data input
);
