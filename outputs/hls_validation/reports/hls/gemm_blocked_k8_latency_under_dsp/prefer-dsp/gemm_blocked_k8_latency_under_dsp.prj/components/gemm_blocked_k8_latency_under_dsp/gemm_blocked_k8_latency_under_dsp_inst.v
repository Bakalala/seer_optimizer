// Example instance of the top level module for: 
//     gemm_blocked_k8_latency_under_dsp
// To include this component in your design, include: 
//     gemm_blocked_k8_latency_under_dsp.qsys
// in your Quartus project and follow the template 
// below to instantiate the IP.  Alternatively, the IP core 
// can be generated from a Qsys system.

gemm_blocked_k8_latency_under_dsp gemm_blocked_k8_latency_under_dsp_inst (
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
  // Interface: in_BA0 (conduit sink)
  .in_BA0    ( ), // 32-bit data input
  // Interface: in_BA1 (conduit sink)
  .in_BA1    ( ), // 32-bit data input
  // Interface: in_BA2 (conduit sink)
  .in_BA2    ( ), // 32-bit data input
  // Interface: in_BA3 (conduit sink)
  .in_BA3    ( ), // 32-bit data input
  // Interface: in_BA4 (conduit sink)
  .in_BA4    ( ), // 32-bit data input
  // Interface: in_BA5 (conduit sink)
  .in_BA5    ( ), // 32-bit data input
  // Interface: in_BA6 (conduit sink)
  .in_BA6    ( ), // 32-bit data input
  // Interface: in_BA7 (conduit sink)
  .in_BA7    ( ), // 32-bit data input
  // Interface: in_BB0 (conduit sink)
  .in_BB0    ( ), // 32-bit data input
  // Interface: in_BB1 (conduit sink)
  .in_BB1    ( ), // 32-bit data input
  // Interface: in_BB2 (conduit sink)
  .in_BB2    ( ), // 32-bit data input
  // Interface: in_BB3 (conduit sink)
  .in_BB3    ( ), // 32-bit data input
  // Interface: in_BB4 (conduit sink)
  .in_BB4    ( ), // 32-bit data input
  // Interface: in_BB5 (conduit sink)
  .in_BB5    ( ), // 32-bit data input
  // Interface: in_BB6 (conduit sink)
  .in_BB6    ( ), // 32-bit data input
  // Interface: in_BB7 (conduit sink)
  .in_BB7    ( )  // 32-bit data input
);
