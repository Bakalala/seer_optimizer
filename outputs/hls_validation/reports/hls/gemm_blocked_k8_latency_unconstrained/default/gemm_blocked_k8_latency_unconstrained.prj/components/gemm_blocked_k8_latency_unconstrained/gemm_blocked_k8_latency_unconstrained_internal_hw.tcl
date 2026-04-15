package require -exact qsys 15.0
set_module_property NAME gemm_blocked_k8_latency_unconstrained_internal
set_module_property VERSION 1.0
set_module_property INTERNAL true
set_module_property GROUP HLS
set_module_property DISPLAY_NAME gemm_blocked_k8_latency_unconstrained_internal
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property SUPPORTED_DEVICE_FAMILIES {"Arria 10"}
set_module_assignment hls.cosim.name {gemm_blocked_k8_latency_unconstrained}
set_module_assignment hls.compressed.name {gemm_blocked_k8_latency_unconstrained}

#### Synthesis fileset
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL gemm_blocked_k8_latency_unconstrained_internal
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file "dspba_library_ver.sv" SYSTEM_VERILOG PATH "linux64/lib/dspba/Libraries/sv/base/dspba_library_ver.sv"
add_fileset_file "acl_ecc_pkg.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_pkg.sv"
add_fileset_file "acl_data_fifo.v" SYSTEM_VERILOG PATH "ip/acl_data_fifo.v"
add_fileset_file "acl_fifo.v" SYSTEM_VERILOG PATH "ip/acl_fifo.v"
add_fileset_file "acl_altera_syncram_wrapped.sv" SYSTEM_VERILOG PATH "ip/acl_altera_syncram_wrapped.sv"
add_fileset_file "acl_scfifo_wrapped.sv" SYSTEM_VERILOG PATH "ip/acl_scfifo_wrapped.sv"
add_fileset_file "acl_ecc_decoder.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_decoder.sv"
add_fileset_file "acl_ecc_encoder.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_encoder.sv"
add_fileset_file "acl_ll_fifo.v" SYSTEM_VERILOG PATH "ip/acl_ll_fifo.v"
add_fileset_file "acl_ll_ram_fifo.v" SYSTEM_VERILOG PATH "ip/acl_ll_ram_fifo.v"
add_fileset_file "acl_valid_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_valid_fifo_counter.v"
add_fileset_file "acl_dspba_valid_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_dspba_valid_fifo_counter.v"
add_fileset_file "acl_staging_reg.v" SYSTEM_VERILOG PATH "ip/acl_staging_reg.v"
add_fileset_file "hld_fifo.sv" SYSTEM_VERILOG PATH "ip/hld_fifo.sv"
add_fileset_file "acl_mid_speed_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_mid_speed_fifo.sv"
add_fileset_file "acl_latency_one_ram_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_latency_one_ram_fifo.sv"
add_fileset_file "acl_latency_zero_ram_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_latency_zero_ram_fifo.sv"
add_fileset_file "hld_fifo_zero_width.sv" SYSTEM_VERILOG PATH "ip/hld_fifo_zero_width.sv"
add_fileset_file "acl_high_speed_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_high_speed_fifo.sv"
add_fileset_file "acl_low_latency_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_low_latency_fifo.sv"
add_fileset_file "acl_zero_latency_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_zero_latency_fifo.sv"
add_fileset_file "acl_fanout_pipeline.sv" SYSTEM_VERILOG PATH "ip/acl_fanout_pipeline.sv"
add_fileset_file "acl_std_synchronizer_nocut.v" SYSTEM_VERILOG PATH "ip/acl_std_synchronizer_nocut.v"
add_fileset_file "acl_tessellated_incr_decr_threshold.sv" SYSTEM_VERILOG PATH "ip/acl_tessellated_incr_decr_threshold.sv"
add_fileset_file "acl_tessellated_incr_lookahead.sv" SYSTEM_VERILOG PATH "ip/acl_tessellated_incr_lookahead.sv"
add_fileset_file "acl_reset_handler.sv" SYSTEM_VERILOG PATH "ip/acl_reset_handler.sv"
add_fileset_file "acl_lfsr.sv" SYSTEM_VERILOG PATH "ip/acl_lfsr.sv"
add_fileset_file "acl_mlab_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_mlab_fifo.sv"
add_fileset_file "acl_parameter_assert.svh" SYSTEM_VERILOG PATH "ip/acl_parameter_assert.svh"
add_fileset_file "acl_pop.v" SYSTEM_VERILOG PATH "ip/acl_pop.v"
add_fileset_file "acl_push.v" SYSTEM_VERILOG PATH "ip/acl_push.v"
add_fileset_file "acl_token_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_token_fifo_counter.v"
add_fileset_file "acl_pipeline.v" SYSTEM_VERILOG PATH "ip/acl_pipeline.v"
add_fileset_file "acl_dspba_buffer.v" SYSTEM_VERILOG PATH "ip/acl_dspba_buffer.v"
add_fileset_file "acl_enable_sink.v" SYSTEM_VERILOG PATH "ip/acl_enable_sink.v"
add_fileset_file "hld_memory_depth_quantization_pkg.sv" SYSTEM_VERILOG PATH "ip/hld_memory_depth_quantization_pkg.sv"
add_fileset_file "hld_iord.sv" SYSTEM_VERILOG PATH "ip/hld_iord.sv"
add_fileset_file "hld_iord_stall_latency.sv" SYSTEM_VERILOG PATH "ip/hld_iord_stall_latency.sv"
add_fileset_file "hld_iord_stall_valid.sv" SYSTEM_VERILOG PATH "ip/hld_iord_stall_valid.sv"
add_fileset_file "acl_shift_register_no_reset.sv" SYSTEM_VERILOG PATH "ip/acl_shift_register_no_reset.sv"
add_fileset_file "hld_iowr.sv" SYSTEM_VERILOG PATH "ip/hld_iowr.sv"
add_fileset_file "hld_iowr_stall_latency.sv" SYSTEM_VERILOG PATH "ip/hld_iowr_stall_latency.sv"
add_fileset_file "hld_iowr_stall_valid.sv" SYSTEM_VERILOG PATH "ip/hld_iowr_stall_valid.sv"
add_fileset_file "hld_loop_profiler.sv" SYSTEM_VERILOG PATH "ip/hld_loop_profiler.sv"
add_fileset_file "hld_sim_latency_tracker.sv" SYSTEM_VERILOG PATH "ip/hld_sim_latency_tracker.sv"
add_fileset_file "acl_reset_wire.v" SYSTEM_VERILOG PATH "ip/acl_reset_wire.v"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_function_wrapper.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_function_wrapper.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_function.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_function.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_bb_B0_runOnce.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_bb_B0_runOnce.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_bb_B0_runOnce_stall_region.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_bb_B0_runOnce_stall_region.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B0_runOnce_merge_reg.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B0_runOnce_merge_reg.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000token_i1_wt_limpop_0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000token_i1_wt_limpop_0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000n_i1_wt_limpop_0_reg.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000n_i1_wt_limpop_0_reg.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000oken_i1_wt_limpush_0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000oken_i1_wt_limpush_0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000_i1_wt_limpush_1_reg.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000_i1_wt_limpush_1_reg.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B0_runOnce_branch.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B0_runOnce_branch.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B0_runOnce_merge.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B0_runOnce_merge.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_bb_B1_start.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_bb_B1_start.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_bb_B1_start_stall_region.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_bb_B1_start_stall_region.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B1_start_merge_reg.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B1_start_merge_reg.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0001tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0001tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0002tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0002tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0003tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0003tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0004tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0004tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000ipeline_keep_going_0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000ipeline_keep_going_0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000ush_i1_notexitcond_0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000ush_i1_notexitcond_0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000tency_unconstrained3.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000tency_unconstrained3.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0005tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0005tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0006tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0006tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B1_start_branch.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B1_start_branch.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B1_start_merge.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B1_start_merge.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000line_keep_going_1_sr.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000line_keep_going_1_sr.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000p_going_1_valid_fifo.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000p_going_1_valid_fifo.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_internal.v" SYSTEM_VERILOG PATH "gemm_blocked_k8_latency_unconstrained_internal.v"

#### Simulation fileset
add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL gemm_blocked_k8_latency_unconstrained_internal
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file "dspba_library_ver.sv" SYSTEM_VERILOG PATH "linux64/lib/dspba/Libraries/sv/base/dspba_library_ver.sv"
add_fileset_file "acl_ecc_pkg.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_pkg.sv"
add_fileset_file "acl_data_fifo.v" SYSTEM_VERILOG PATH "ip/acl_data_fifo.v"
add_fileset_file "acl_fifo.v" SYSTEM_VERILOG PATH "ip/acl_fifo.v"
add_fileset_file "acl_altera_syncram_wrapped.sv" SYSTEM_VERILOG PATH "ip/acl_altera_syncram_wrapped.sv"
add_fileset_file "acl_scfifo_wrapped.sv" SYSTEM_VERILOG PATH "ip/acl_scfifo_wrapped.sv"
add_fileset_file "acl_ecc_decoder.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_decoder.sv"
add_fileset_file "acl_ecc_encoder.sv" SYSTEM_VERILOG PATH "ip/acl_ecc_encoder.sv"
add_fileset_file "acl_ll_fifo.v" SYSTEM_VERILOG PATH "ip/acl_ll_fifo.v"
add_fileset_file "acl_ll_ram_fifo.v" SYSTEM_VERILOG PATH "ip/acl_ll_ram_fifo.v"
add_fileset_file "acl_valid_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_valid_fifo_counter.v"
add_fileset_file "acl_dspba_valid_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_dspba_valid_fifo_counter.v"
add_fileset_file "acl_staging_reg.v" SYSTEM_VERILOG PATH "ip/acl_staging_reg.v"
add_fileset_file "hld_fifo.sv" SYSTEM_VERILOG PATH "ip/hld_fifo.sv"
add_fileset_file "acl_mid_speed_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_mid_speed_fifo.sv"
add_fileset_file "acl_latency_one_ram_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_latency_one_ram_fifo.sv"
add_fileset_file "acl_latency_zero_ram_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_latency_zero_ram_fifo.sv"
add_fileset_file "hld_fifo_zero_width.sv" SYSTEM_VERILOG PATH "ip/hld_fifo_zero_width.sv"
add_fileset_file "acl_high_speed_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_high_speed_fifo.sv"
add_fileset_file "acl_low_latency_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_low_latency_fifo.sv"
add_fileset_file "acl_zero_latency_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_zero_latency_fifo.sv"
add_fileset_file "acl_fanout_pipeline.sv" SYSTEM_VERILOG PATH "ip/acl_fanout_pipeline.sv"
add_fileset_file "acl_std_synchronizer_nocut.v" SYSTEM_VERILOG PATH "ip/acl_std_synchronizer_nocut.v"
add_fileset_file "acl_tessellated_incr_decr_threshold.sv" SYSTEM_VERILOG PATH "ip/acl_tessellated_incr_decr_threshold.sv"
add_fileset_file "acl_tessellated_incr_lookahead.sv" SYSTEM_VERILOG PATH "ip/acl_tessellated_incr_lookahead.sv"
add_fileset_file "acl_reset_handler.sv" SYSTEM_VERILOG PATH "ip/acl_reset_handler.sv"
add_fileset_file "acl_lfsr.sv" SYSTEM_VERILOG PATH "ip/acl_lfsr.sv"
add_fileset_file "acl_mlab_fifo.sv" SYSTEM_VERILOG PATH "ip/acl_mlab_fifo.sv"
add_fileset_file "acl_parameter_assert.svh" SYSTEM_VERILOG PATH "ip/acl_parameter_assert.svh"
add_fileset_file "acl_pop.v" SYSTEM_VERILOG PATH "ip/acl_pop.v"
add_fileset_file "acl_push.v" SYSTEM_VERILOG PATH "ip/acl_push.v"
add_fileset_file "acl_token_fifo_counter.v" SYSTEM_VERILOG PATH "ip/acl_token_fifo_counter.v"
add_fileset_file "acl_pipeline.v" SYSTEM_VERILOG PATH "ip/acl_pipeline.v"
add_fileset_file "acl_dspba_buffer.v" SYSTEM_VERILOG PATH "ip/acl_dspba_buffer.v"
add_fileset_file "acl_enable_sink.v" SYSTEM_VERILOG PATH "ip/acl_enable_sink.v"
add_fileset_file "hld_memory_depth_quantization_pkg.sv" SYSTEM_VERILOG PATH "ip/hld_memory_depth_quantization_pkg.sv"
add_fileset_file "hld_iord.sv" SYSTEM_VERILOG PATH "ip/hld_iord.sv"
add_fileset_file "hld_iord_stall_latency.sv" SYSTEM_VERILOG PATH "ip/hld_iord_stall_latency.sv"
add_fileset_file "hld_iord_stall_valid.sv" SYSTEM_VERILOG PATH "ip/hld_iord_stall_valid.sv"
add_fileset_file "acl_shift_register_no_reset.sv" SYSTEM_VERILOG PATH "ip/acl_shift_register_no_reset.sv"
add_fileset_file "hld_iowr.sv" SYSTEM_VERILOG PATH "ip/hld_iowr.sv"
add_fileset_file "hld_iowr_stall_latency.sv" SYSTEM_VERILOG PATH "ip/hld_iowr_stall_latency.sv"
add_fileset_file "hld_iowr_stall_valid.sv" SYSTEM_VERILOG PATH "ip/hld_iowr_stall_valid.sv"
add_fileset_file "hld_loop_profiler.sv" SYSTEM_VERILOG PATH "ip/hld_loop_profiler.sv"
add_fileset_file "hld_sim_latency_tracker.sv" SYSTEM_VERILOG PATH "ip/hld_sim_latency_tracker.sv"
add_fileset_file "acl_reset_wire.v" SYSTEM_VERILOG PATH "ip/acl_reset_wire.v"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_function_wrapper.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_function_wrapper.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_function.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_function.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_bb_B0_runOnce.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_bb_B0_runOnce.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_bb_B0_runOnce_stall_region.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_bb_B0_runOnce_stall_region.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B0_runOnce_merge_reg.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B0_runOnce_merge_reg.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000token_i1_wt_limpop_0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000token_i1_wt_limpop_0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000n_i1_wt_limpop_0_reg.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000n_i1_wt_limpop_0_reg.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000oken_i1_wt_limpush_0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000oken_i1_wt_limpush_0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000_i1_wt_limpush_1_reg.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000_i1_wt_limpush_1_reg.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B0_runOnce_branch.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B0_runOnce_branch.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B0_runOnce_merge.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B0_runOnce_merge.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_bb_B1_start.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_bb_B1_start.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_bb_B1_start_stall_region.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_bb_B1_start_stall_region.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B1_start_merge_reg.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B1_start_merge_reg.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0001tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0001tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0002tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0002tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0003tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0003tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0004tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0004tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000ipeline_keep_going_0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000ipeline_keep_going_0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000ush_i1_notexitcond_0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000ush_i1_notexitcond_0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000tency_unconstrained3.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000tency_unconstrained3.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0005tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0005tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0006tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0006tency_unconstrained0.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B1_start_branch.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B1_start_branch.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_B1_start_merge.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_B1_start_merge.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000line_keep_going_1_sr.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000line_keep_going_1_sr.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_i_0000p_going_1_valid_fifo.sv" SYSTEM_VERILOG PATH "ip/gemm_blocked_k8_latency_unconstrained_i_0000p_going_1_valid_fifo.sv"
add_fileset_file "gemm_blocked_k8_latency_unconstrained_internal.v" SYSTEM_VERILOG PATH "gemm_blocked_k8_latency_unconstrained_internal.v"

#### Primary clock for the component
add_interface clock clock end
set_interface_property clock ENABLED true
set_interface_assignment clock hls.cosim.name {$clock}
add_interface_port clock clock clk input 1

#### Primary reset for the component
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_assignment reset hls.cosim.name {$reset}
add_interface_port reset resetn reset_n input 1

#### The component invocation protocol interface (call)
add_interface call conduit sink
set_interface_property call associatedClock clock
set_interface_property call associatedReset reset
set_interface_assignment call hls.cosim.name {$call}
add_interface_port call start valid input 1
add_interface_port call busy stall output 1

#### The component return protocol interface (return)
add_interface return conduit source
set_interface_property return associatedClock clock
set_interface_property return associatedReset reset
set_interface_assignment return hls.cosim.name {$return}
add_interface_port return done valid output 1
add_interface_port return stall stall input 1

#### The component return data interface (returndata)
add_interface returndata conduit source
set_interface_property returndata associatedClock clock
set_interface_property returndata associatedReset reset
set_interface_assignment returndata hls.cosim.name {$returndata}
add_interface_port returndata returndata data output 32

#### Parameter in_BA0 interface
add_interface in_BA0 conduit sink
set_interface_property in_BA0 associatedClock clock
set_interface_property in_BA0 associatedReset reset
set_interface_assignment in_BA0 hls.cosim.name {in_BA0}
add_interface_port in_BA0 in_BA0 data input 32

#### Parameter in_BA1 interface
add_interface in_BA1 conduit sink
set_interface_property in_BA1 associatedClock clock
set_interface_property in_BA1 associatedReset reset
set_interface_assignment in_BA1 hls.cosim.name {in_BA1}
add_interface_port in_BA1 in_BA1 data input 32

#### Parameter in_BA2 interface
add_interface in_BA2 conduit sink
set_interface_property in_BA2 associatedClock clock
set_interface_property in_BA2 associatedReset reset
set_interface_assignment in_BA2 hls.cosim.name {in_BA2}
add_interface_port in_BA2 in_BA2 data input 32

#### Parameter in_BA3 interface
add_interface in_BA3 conduit sink
set_interface_property in_BA3 associatedClock clock
set_interface_property in_BA3 associatedReset reset
set_interface_assignment in_BA3 hls.cosim.name {in_BA3}
add_interface_port in_BA3 in_BA3 data input 32

#### Parameter in_BA4 interface
add_interface in_BA4 conduit sink
set_interface_property in_BA4 associatedClock clock
set_interface_property in_BA4 associatedReset reset
set_interface_assignment in_BA4 hls.cosim.name {in_BA4}
add_interface_port in_BA4 in_BA4 data input 32

#### Parameter in_BA5 interface
add_interface in_BA5 conduit sink
set_interface_property in_BA5 associatedClock clock
set_interface_property in_BA5 associatedReset reset
set_interface_assignment in_BA5 hls.cosim.name {in_BA5}
add_interface_port in_BA5 in_BA5 data input 32

#### Parameter in_BA6 interface
add_interface in_BA6 conduit sink
set_interface_property in_BA6 associatedClock clock
set_interface_property in_BA6 associatedReset reset
set_interface_assignment in_BA6 hls.cosim.name {in_BA6}
add_interface_port in_BA6 in_BA6 data input 32

#### Parameter in_BA7 interface
add_interface in_BA7 conduit sink
set_interface_property in_BA7 associatedClock clock
set_interface_property in_BA7 associatedReset reset
set_interface_assignment in_BA7 hls.cosim.name {in_BA7}
add_interface_port in_BA7 in_BA7 data input 32

#### Parameter in_BB0 interface
add_interface in_BB0 conduit sink
set_interface_property in_BB0 associatedClock clock
set_interface_property in_BB0 associatedReset reset
set_interface_assignment in_BB0 hls.cosim.name {in_BB0}
add_interface_port in_BB0 in_BB0 data input 32

#### Parameter in_BB1 interface
add_interface in_BB1 conduit sink
set_interface_property in_BB1 associatedClock clock
set_interface_property in_BB1 associatedReset reset
set_interface_assignment in_BB1 hls.cosim.name {in_BB1}
add_interface_port in_BB1 in_BB1 data input 32

#### Parameter in_BB2 interface
add_interface in_BB2 conduit sink
set_interface_property in_BB2 associatedClock clock
set_interface_property in_BB2 associatedReset reset
set_interface_assignment in_BB2 hls.cosim.name {in_BB2}
add_interface_port in_BB2 in_BB2 data input 32

#### Parameter in_BB3 interface
add_interface in_BB3 conduit sink
set_interface_property in_BB3 associatedClock clock
set_interface_property in_BB3 associatedReset reset
set_interface_assignment in_BB3 hls.cosim.name {in_BB3}
add_interface_port in_BB3 in_BB3 data input 32

#### Parameter in_BB4 interface
add_interface in_BB4 conduit sink
set_interface_property in_BB4 associatedClock clock
set_interface_property in_BB4 associatedReset reset
set_interface_assignment in_BB4 hls.cosim.name {in_BB4}
add_interface_port in_BB4 in_BB4 data input 32

#### Parameter in_BB5 interface
add_interface in_BB5 conduit sink
set_interface_property in_BB5 associatedClock clock
set_interface_property in_BB5 associatedReset reset
set_interface_assignment in_BB5 hls.cosim.name {in_BB5}
add_interface_port in_BB5 in_BB5 data input 32

#### Parameter in_BB6 interface
add_interface in_BB6 conduit sink
set_interface_property in_BB6 associatedClock clock
set_interface_property in_BB6 associatedReset reset
set_interface_assignment in_BB6 hls.cosim.name {in_BB6}
add_interface_port in_BB6 in_BB6 data input 32

#### Parameter in_BB7 interface
add_interface in_BB7 conduit sink
set_interface_property in_BB7 associatedClock clock
set_interface_property in_BB7 associatedReset reset
set_interface_assignment in_BB7 hls.cosim.name {in_BB7}
add_interface_port in_BB7 in_BB7 data input 32

#### Quartus settings (QIP strings)
set_qip_strings { "set_instance_assignment -entity \"%entityName%\" -library \"%libraryName%\" -name AUTO_SHIFT_REGISTER_RECOGNITION OFF -to *_NO_SHIFT_REG*"  }
