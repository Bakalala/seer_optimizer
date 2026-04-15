package require -exact qsys 15.0
set_module_property NAME dot16_latency_unconstrained_internal
set_module_property VERSION 1.0
set_module_property INTERNAL true
set_module_property GROUP HLS
set_module_property DISPLAY_NAME dot16_latency_unconstrained_internal
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property SUPPORTED_DEVICE_FAMILIES {"Arria 10"}
set_module_assignment hls.cosim.name {dot16_latency_unconstrained}
set_module_assignment hls.compressed.name {dot16_latency_unconstrained}

#### Synthesis fileset
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL dot16_latency_unconstrained_internal
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
add_fileset_file "dot16_latency_unconstrained_function_wrapper.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_function_wrapper.sv"
add_fileset_file "dot16_latency_unconstrained_function.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_function.sv"
add_fileset_file "dot16_latency_unconstrained_bb_B0_runOnce.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_bb_B0_runOnce.sv"
add_fileset_file "dot16_latency_unconstrained_bb_B0_runOnce_stall_region.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_bb_B0_runOnce_stall_region.sv"
add_fileset_file "dot16_latency_unconstrained_B0_runOnce_merge_reg.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B0_runOnce_merge_reg.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0000n_i1_wt_limpop_0_reg.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0000n_i1_wt_limpop_0_reg.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0000oken_i1_wt_limpush_0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0000oken_i1_wt_limpush_0.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0000_i1_wt_limpush_1_reg.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0000_i1_wt_limpush_1_reg.sv"
add_fileset_file "dot16_latency_unconstrained_B0_runOnce_branch.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B0_runOnce_branch.sv"
add_fileset_file "dot16_latency_unconstrained_B0_runOnce_merge.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B0_runOnce_merge.sv"
add_fileset_file "dot16_latency_unconstrained_bb_B1_start.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_bb_B1_start.sv"
add_fileset_file "dot16_latency_unconstrained_bb_B1_start_stall_region.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_bb_B1_start_stall_region.sv"
add_fileset_file "dot16_latency_unconstrained_B1_start_merge_reg.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B1_start_merge_reg.sv"
add_fileset_file "dot16_latency_unconstrained_i_iowr_bl_re0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_iowr_bl_re0000tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_iord_bl_ca0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_iord_bl_ca0000tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_sfc_s_c0_i0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_sfc_s_c0_i0000tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0000tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_sfc_logic_0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_sfc_logic_0000tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_pipeline_keep_going_0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_pipeline_keep_going_0.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_push_i1_notexitcond_0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_push_i1_notexitcond_0.sv"
add_fileset_file "dot16_latency_unconstrained_i_sfc_s_c1_i0000tency_unconstrained3.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_sfc_s_c1_i0000tency_unconstrained3.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0001tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0001tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_sfc_logic_0001tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_sfc_logic_0001tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_B1_start_branch.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B1_start_branch.sv"
add_fileset_file "dot16_latency_unconstrained_B1_start_merge.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B1_start_merge.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_pipeline_keep_going_1_sr.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_pipeline_keep_going_1_sr.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0000p_going_1_valid_fifo.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0000p_going_1_valid_fifo.sv"
add_fileset_file "dot16_latency_unconstrained_internal.v" SYSTEM_VERILOG PATH "dot16_latency_unconstrained_internal.v"

#### Simulation fileset
add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL dot16_latency_unconstrained_internal
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
add_fileset_file "dot16_latency_unconstrained_function_wrapper.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_function_wrapper.sv"
add_fileset_file "dot16_latency_unconstrained_function.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_function.sv"
add_fileset_file "dot16_latency_unconstrained_bb_B0_runOnce.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_bb_B0_runOnce.sv"
add_fileset_file "dot16_latency_unconstrained_bb_B0_runOnce_stall_region.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_bb_B0_runOnce_stall_region.sv"
add_fileset_file "dot16_latency_unconstrained_B0_runOnce_merge_reg.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B0_runOnce_merge_reg.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0000n_i1_wt_limpop_0_reg.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0000n_i1_wt_limpop_0_reg.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0000oken_i1_wt_limpush_0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0000oken_i1_wt_limpush_0.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0000_i1_wt_limpush_1_reg.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0000_i1_wt_limpush_1_reg.sv"
add_fileset_file "dot16_latency_unconstrained_B0_runOnce_branch.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B0_runOnce_branch.sv"
add_fileset_file "dot16_latency_unconstrained_B0_runOnce_merge.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B0_runOnce_merge.sv"
add_fileset_file "dot16_latency_unconstrained_bb_B1_start.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_bb_B1_start.sv"
add_fileset_file "dot16_latency_unconstrained_bb_B1_start_stall_region.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_bb_B1_start_stall_region.sv"
add_fileset_file "dot16_latency_unconstrained_B1_start_merge_reg.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B1_start_merge_reg.sv"
add_fileset_file "dot16_latency_unconstrained_i_iowr_bl_re0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_iowr_bl_re0000tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_iord_bl_ca0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_iord_bl_ca0000tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_sfc_s_c0_i0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_sfc_s_c0_i0000tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0000tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_sfc_logic_0000tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_sfc_logic_0000tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_pipeline_keep_going_0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_pipeline_keep_going_0.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_push_i1_notexitcond_0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_push_i1_notexitcond_0.sv"
add_fileset_file "dot16_latency_unconstrained_i_sfc_s_c1_i0000tency_unconstrained3.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_sfc_s_c1_i0000tency_unconstrained3.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0001tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0001tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_i_sfc_logic_0001tency_unconstrained0.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_sfc_logic_0001tency_unconstrained0.sv"
add_fileset_file "dot16_latency_unconstrained_B1_start_branch.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B1_start_branch.sv"
add_fileset_file "dot16_latency_unconstrained_B1_start_merge.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_B1_start_merge.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_pipeline_keep_going_1_sr.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_pipeline_keep_going_1_sr.sv"
add_fileset_file "dot16_latency_unconstrained_i_llvm_fpga_0000p_going_1_valid_fifo.sv" SYSTEM_VERILOG PATH "ip/dot16_latency_unconstrained_i_llvm_fpga_0000p_going_1_valid_fifo.sv"
add_fileset_file "dot16_latency_unconstrained_internal.v" SYSTEM_VERILOG PATH "dot16_latency_unconstrained_internal.v"

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

#### Parameter in_a0 interface
add_interface in_a0 conduit sink
set_interface_property in_a0 associatedClock clock
set_interface_property in_a0 associatedReset reset
set_interface_assignment in_a0 hls.cosim.name {in_a0}
add_interface_port in_a0 in_a0 data input 32

#### Parameter in_a1 interface
add_interface in_a1 conduit sink
set_interface_property in_a1 associatedClock clock
set_interface_property in_a1 associatedReset reset
set_interface_assignment in_a1 hls.cosim.name {in_a1}
add_interface_port in_a1 in_a1 data input 32

#### Parameter in_a10 interface
add_interface in_a10 conduit sink
set_interface_property in_a10 associatedClock clock
set_interface_property in_a10 associatedReset reset
set_interface_assignment in_a10 hls.cosim.name {in_a10}
add_interface_port in_a10 in_a10 data input 32

#### Parameter in_a11 interface
add_interface in_a11 conduit sink
set_interface_property in_a11 associatedClock clock
set_interface_property in_a11 associatedReset reset
set_interface_assignment in_a11 hls.cosim.name {in_a11}
add_interface_port in_a11 in_a11 data input 32

#### Parameter in_a12 interface
add_interface in_a12 conduit sink
set_interface_property in_a12 associatedClock clock
set_interface_property in_a12 associatedReset reset
set_interface_assignment in_a12 hls.cosim.name {in_a12}
add_interface_port in_a12 in_a12 data input 32

#### Parameter in_a13 interface
add_interface in_a13 conduit sink
set_interface_property in_a13 associatedClock clock
set_interface_property in_a13 associatedReset reset
set_interface_assignment in_a13 hls.cosim.name {in_a13}
add_interface_port in_a13 in_a13 data input 32

#### Parameter in_a14 interface
add_interface in_a14 conduit sink
set_interface_property in_a14 associatedClock clock
set_interface_property in_a14 associatedReset reset
set_interface_assignment in_a14 hls.cosim.name {in_a14}
add_interface_port in_a14 in_a14 data input 32

#### Parameter in_a15 interface
add_interface in_a15 conduit sink
set_interface_property in_a15 associatedClock clock
set_interface_property in_a15 associatedReset reset
set_interface_assignment in_a15 hls.cosim.name {in_a15}
add_interface_port in_a15 in_a15 data input 32

#### Parameter in_a2 interface
add_interface in_a2 conduit sink
set_interface_property in_a2 associatedClock clock
set_interface_property in_a2 associatedReset reset
set_interface_assignment in_a2 hls.cosim.name {in_a2}
add_interface_port in_a2 in_a2 data input 32

#### Parameter in_a3 interface
add_interface in_a3 conduit sink
set_interface_property in_a3 associatedClock clock
set_interface_property in_a3 associatedReset reset
set_interface_assignment in_a3 hls.cosim.name {in_a3}
add_interface_port in_a3 in_a3 data input 32

#### Parameter in_a4 interface
add_interface in_a4 conduit sink
set_interface_property in_a4 associatedClock clock
set_interface_property in_a4 associatedReset reset
set_interface_assignment in_a4 hls.cosim.name {in_a4}
add_interface_port in_a4 in_a4 data input 32

#### Parameter in_a5 interface
add_interface in_a5 conduit sink
set_interface_property in_a5 associatedClock clock
set_interface_property in_a5 associatedReset reset
set_interface_assignment in_a5 hls.cosim.name {in_a5}
add_interface_port in_a5 in_a5 data input 32

#### Parameter in_a6 interface
add_interface in_a6 conduit sink
set_interface_property in_a6 associatedClock clock
set_interface_property in_a6 associatedReset reset
set_interface_assignment in_a6 hls.cosim.name {in_a6}
add_interface_port in_a6 in_a6 data input 32

#### Parameter in_a7 interface
add_interface in_a7 conduit sink
set_interface_property in_a7 associatedClock clock
set_interface_property in_a7 associatedReset reset
set_interface_assignment in_a7 hls.cosim.name {in_a7}
add_interface_port in_a7 in_a7 data input 32

#### Parameter in_a8 interface
add_interface in_a8 conduit sink
set_interface_property in_a8 associatedClock clock
set_interface_property in_a8 associatedReset reset
set_interface_assignment in_a8 hls.cosim.name {in_a8}
add_interface_port in_a8 in_a8 data input 32

#### Parameter in_a9 interface
add_interface in_a9 conduit sink
set_interface_property in_a9 associatedClock clock
set_interface_property in_a9 associatedReset reset
set_interface_assignment in_a9 hls.cosim.name {in_a9}
add_interface_port in_a9 in_a9 data input 32

#### Parameter in_b0 interface
add_interface in_b0 conduit sink
set_interface_property in_b0 associatedClock clock
set_interface_property in_b0 associatedReset reset
set_interface_assignment in_b0 hls.cosim.name {in_b0}
add_interface_port in_b0 in_b0 data input 32

#### Parameter in_b1 interface
add_interface in_b1 conduit sink
set_interface_property in_b1 associatedClock clock
set_interface_property in_b1 associatedReset reset
set_interface_assignment in_b1 hls.cosim.name {in_b1}
add_interface_port in_b1 in_b1 data input 32

#### Parameter in_b10 interface
add_interface in_b10 conduit sink
set_interface_property in_b10 associatedClock clock
set_interface_property in_b10 associatedReset reset
set_interface_assignment in_b10 hls.cosim.name {in_b10}
add_interface_port in_b10 in_b10 data input 32

#### Parameter in_b11 interface
add_interface in_b11 conduit sink
set_interface_property in_b11 associatedClock clock
set_interface_property in_b11 associatedReset reset
set_interface_assignment in_b11 hls.cosim.name {in_b11}
add_interface_port in_b11 in_b11 data input 32

#### Parameter in_b12 interface
add_interface in_b12 conduit sink
set_interface_property in_b12 associatedClock clock
set_interface_property in_b12 associatedReset reset
set_interface_assignment in_b12 hls.cosim.name {in_b12}
add_interface_port in_b12 in_b12 data input 32

#### Parameter in_b13 interface
add_interface in_b13 conduit sink
set_interface_property in_b13 associatedClock clock
set_interface_property in_b13 associatedReset reset
set_interface_assignment in_b13 hls.cosim.name {in_b13}
add_interface_port in_b13 in_b13 data input 32

#### Parameter in_b14 interface
add_interface in_b14 conduit sink
set_interface_property in_b14 associatedClock clock
set_interface_property in_b14 associatedReset reset
set_interface_assignment in_b14 hls.cosim.name {in_b14}
add_interface_port in_b14 in_b14 data input 32

#### Parameter in_b15 interface
add_interface in_b15 conduit sink
set_interface_property in_b15 associatedClock clock
set_interface_property in_b15 associatedReset reset
set_interface_assignment in_b15 hls.cosim.name {in_b15}
add_interface_port in_b15 in_b15 data input 32

#### Parameter in_b2 interface
add_interface in_b2 conduit sink
set_interface_property in_b2 associatedClock clock
set_interface_property in_b2 associatedReset reset
set_interface_assignment in_b2 hls.cosim.name {in_b2}
add_interface_port in_b2 in_b2 data input 32

#### Parameter in_b3 interface
add_interface in_b3 conduit sink
set_interface_property in_b3 associatedClock clock
set_interface_property in_b3 associatedReset reset
set_interface_assignment in_b3 hls.cosim.name {in_b3}
add_interface_port in_b3 in_b3 data input 32

#### Parameter in_b4 interface
add_interface in_b4 conduit sink
set_interface_property in_b4 associatedClock clock
set_interface_property in_b4 associatedReset reset
set_interface_assignment in_b4 hls.cosim.name {in_b4}
add_interface_port in_b4 in_b4 data input 32

#### Parameter in_b5 interface
add_interface in_b5 conduit sink
set_interface_property in_b5 associatedClock clock
set_interface_property in_b5 associatedReset reset
set_interface_assignment in_b5 hls.cosim.name {in_b5}
add_interface_port in_b5 in_b5 data input 32

#### Parameter in_b6 interface
add_interface in_b6 conduit sink
set_interface_property in_b6 associatedClock clock
set_interface_property in_b6 associatedReset reset
set_interface_assignment in_b6 hls.cosim.name {in_b6}
add_interface_port in_b6 in_b6 data input 32

#### Parameter in_b7 interface
add_interface in_b7 conduit sink
set_interface_property in_b7 associatedClock clock
set_interface_property in_b7 associatedReset reset
set_interface_assignment in_b7 hls.cosim.name {in_b7}
add_interface_port in_b7 in_b7 data input 32

#### Parameter in_b8 interface
add_interface in_b8 conduit sink
set_interface_property in_b8 associatedClock clock
set_interface_property in_b8 associatedReset reset
set_interface_assignment in_b8 hls.cosim.name {in_b8}
add_interface_port in_b8 in_b8 data input 32

#### Parameter in_b9 interface
add_interface in_b9 conduit sink
set_interface_property in_b9 associatedClock clock
set_interface_property in_b9 associatedReset reset
set_interface_assignment in_b9 hls.cosim.name {in_b9}
add_interface_port in_b9 in_b9 data input 32

#### Quartus settings (QIP strings)
set_qip_strings { "set_instance_assignment -entity \"%entityName%\" -library \"%libraryName%\" -name AUTO_SHIFT_REGISTER_RECOGNITION OFF -to *_NO_SHIFT_REG*"  }
