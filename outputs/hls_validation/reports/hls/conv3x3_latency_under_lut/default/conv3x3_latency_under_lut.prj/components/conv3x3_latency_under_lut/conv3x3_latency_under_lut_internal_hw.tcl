package require -exact qsys 15.0
set_module_property NAME conv3x3_latency_under_lut_internal
set_module_property VERSION 1.0
set_module_property INTERNAL true
set_module_property GROUP HLS
set_module_property DISPLAY_NAME conv3x3_latency_under_lut_internal
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property SUPPORTED_DEVICE_FAMILIES {"Arria 10"}
set_module_assignment hls.cosim.name {conv3x3_latency_under_lut}
set_module_assignment hls.compressed.name {conv3x3_latency_under_lut}

#### Synthesis fileset
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL conv3x3_latency_under_lut_internal
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
add_fileset_file "conv3x3_latency_under_lut_function_wrapper.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_function_wrapper.sv"
add_fileset_file "conv3x3_latency_under_lut_function.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_function.sv"
add_fileset_file "conv3x3_latency_under_lut_bb_B0_runOnce.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_bb_B0_runOnce.sv"
add_fileset_file "conv3x3_latency_under_lut_bb_B0_runOnce_stall_region.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_bb_B0_runOnce_stall_region.sv"
add_fileset_file "conv3x3_latency_under_lut_B0_runOnce_merge_reg.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B0_runOnce_merge_reg.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_po0000n_i1_wt_limpop_0_reg.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_po0000n_i1_wt_limpop_0_reg.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_push_token_i1_wt_limpush_0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_push_token_i1_wt_limpush_0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_pu0000_i1_wt_limpush_1_reg.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_pu0000_i1_wt_limpush_1_reg.sv"
add_fileset_file "conv3x3_latency_under_lut_B0_runOnce_branch.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B0_runOnce_branch.sv"
add_fileset_file "conv3x3_latency_under_lut_B0_runOnce_merge.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B0_runOnce_merge.sv"
add_fileset_file "conv3x3_latency_under_lut_bb_B1_start.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_bb_B1_start.sv"
add_fileset_file "conv3x3_latency_under_lut_bb_B1_start_stall_region.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_bb_B1_start_stall_region.sv"
add_fileset_file "conv3x3_latency_under_lut_B1_start_merge_reg.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B1_start_merge_reg.sv"
add_fileset_file "conv3x3_latency_under_lut_i_iowr_bl_retu00003_latency_under_lut0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_iowr_bl_retu00003_latency_under_lut0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_iord_bl_call00003_latency_under_lut0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_iord_bl_call00003_latency_under_lut0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_sfc_s_c0_in_00003_latency_under_lut0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_sfc_s_c0_in_00003_latency_under_lut0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_sf00003_latency_under_lut0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_sf00003_latency_under_lut0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_sfc_logic_s_00003_latency_under_lut0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_sfc_logic_s_00003_latency_under_lut0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_pipeline_keep_going_0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_pipeline_keep_going_0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_push_i1_notexitcond_0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_push_i1_notexitcond_0.sv"
add_fileset_file "conv3x3_latency_under_lut_B1_start_branch.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B1_start_branch.sv"
add_fileset_file "conv3x3_latency_under_lut_B1_start_merge.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B1_start_merge.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_pipeline_keep_going_1_sr.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_pipeline_keep_going_1_sr.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_pi0000p_going_1_valid_fifo.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_pi0000p_going_1_valid_fifo.sv"
add_fileset_file "conv3x3_latency_under_lut_internal.v" SYSTEM_VERILOG PATH "conv3x3_latency_under_lut_internal.v"

#### Simulation fileset
add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL conv3x3_latency_under_lut_internal
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
add_fileset_file "conv3x3_latency_under_lut_function_wrapper.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_function_wrapper.sv"
add_fileset_file "conv3x3_latency_under_lut_function.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_function.sv"
add_fileset_file "conv3x3_latency_under_lut_bb_B0_runOnce.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_bb_B0_runOnce.sv"
add_fileset_file "conv3x3_latency_under_lut_bb_B0_runOnce_stall_region.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_bb_B0_runOnce_stall_region.sv"
add_fileset_file "conv3x3_latency_under_lut_B0_runOnce_merge_reg.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B0_runOnce_merge_reg.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_pop_token_i1_wt_limpop_0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_po0000n_i1_wt_limpop_0_reg.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_po0000n_i1_wt_limpop_0_reg.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_push_token_i1_wt_limpush_0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_push_token_i1_wt_limpush_0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_pu0000_i1_wt_limpush_1_reg.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_pu0000_i1_wt_limpush_1_reg.sv"
add_fileset_file "conv3x3_latency_under_lut_B0_runOnce_branch.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B0_runOnce_branch.sv"
add_fileset_file "conv3x3_latency_under_lut_B0_runOnce_merge.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B0_runOnce_merge.sv"
add_fileset_file "conv3x3_latency_under_lut_bb_B1_start.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_bb_B1_start.sv"
add_fileset_file "conv3x3_latency_under_lut_bb_B1_start_stall_region.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_bb_B1_start_stall_region.sv"
add_fileset_file "conv3x3_latency_under_lut_B1_start_merge_reg.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B1_start_merge_reg.sv"
add_fileset_file "conv3x3_latency_under_lut_i_iowr_bl_retu00003_latency_under_lut0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_iowr_bl_retu00003_latency_under_lut0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_iord_bl_call00003_latency_under_lut0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_iord_bl_call00003_latency_under_lut0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_sfc_s_c0_in_00003_latency_under_lut0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_sfc_s_c0_in_00003_latency_under_lut0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_sf00003_latency_under_lut0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_sf00003_latency_under_lut0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_sfc_logic_s_00003_latency_under_lut0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_sfc_logic_s_00003_latency_under_lut0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_pipeline_keep_going_0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_pipeline_keep_going_0.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_push_i1_notexitcond_0.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_push_i1_notexitcond_0.sv"
add_fileset_file "conv3x3_latency_under_lut_B1_start_branch.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B1_start_branch.sv"
add_fileset_file "conv3x3_latency_under_lut_B1_start_merge.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_B1_start_merge.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_pipeline_keep_going_1_sr.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_pipeline_keep_going_1_sr.sv"
add_fileset_file "conv3x3_latency_under_lut_i_llvm_fpga_pi0000p_going_1_valid_fifo.sv" SYSTEM_VERILOG PATH "ip/conv3x3_latency_under_lut_i_llvm_fpga_pi0000p_going_1_valid_fifo.sv"
add_fileset_file "conv3x3_latency_under_lut_internal.v" SYSTEM_VERILOG PATH "conv3x3_latency_under_lut_internal.v"

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

#### Parameter in_p00 interface
add_interface in_p00 conduit sink
set_interface_property in_p00 associatedClock clock
set_interface_property in_p00 associatedReset reset
set_interface_assignment in_p00 hls.cosim.name {in_p00}
add_interface_port in_p00 in_p00 data input 32

#### Parameter in_p01 interface
add_interface in_p01 conduit sink
set_interface_property in_p01 associatedClock clock
set_interface_property in_p01 associatedReset reset
set_interface_assignment in_p01 hls.cosim.name {in_p01}
add_interface_port in_p01 in_p01 data input 32

#### Parameter in_p02 interface
add_interface in_p02 conduit sink
set_interface_property in_p02 associatedClock clock
set_interface_property in_p02 associatedReset reset
set_interface_assignment in_p02 hls.cosim.name {in_p02}
add_interface_port in_p02 in_p02 data input 32

#### Parameter in_p10 interface
add_interface in_p10 conduit sink
set_interface_property in_p10 associatedClock clock
set_interface_property in_p10 associatedReset reset
set_interface_assignment in_p10 hls.cosim.name {in_p10}
add_interface_port in_p10 in_p10 data input 32

#### Parameter in_p11 interface
add_interface in_p11 conduit sink
set_interface_property in_p11 associatedClock clock
set_interface_property in_p11 associatedReset reset
set_interface_assignment in_p11 hls.cosim.name {in_p11}
add_interface_port in_p11 in_p11 data input 32

#### Parameter in_p12 interface
add_interface in_p12 conduit sink
set_interface_property in_p12 associatedClock clock
set_interface_property in_p12 associatedReset reset
set_interface_assignment in_p12 hls.cosim.name {in_p12}
add_interface_port in_p12 in_p12 data input 32

#### Parameter in_p20 interface
add_interface in_p20 conduit sink
set_interface_property in_p20 associatedClock clock
set_interface_property in_p20 associatedReset reset
set_interface_assignment in_p20 hls.cosim.name {in_p20}
add_interface_port in_p20 in_p20 data input 32

#### Parameter in_p21 interface
add_interface in_p21 conduit sink
set_interface_property in_p21 associatedClock clock
set_interface_property in_p21 associatedReset reset
set_interface_assignment in_p21 hls.cosim.name {in_p21}
add_interface_port in_p21 in_p21 data input 32

#### Parameter in_p22 interface
add_interface in_p22 conduit sink
set_interface_property in_p22 associatedClock clock
set_interface_property in_p22 associatedReset reset
set_interface_assignment in_p22 hls.cosim.name {in_p22}
add_interface_port in_p22 in_p22 data input 32

#### Quartus settings (QIP strings)
set_qip_strings { "set_instance_assignment -entity \"%entityName%\" -library \"%libraryName%\" -name AUTO_SHIFT_REGISTER_RECOGNITION OFF -to *_NO_SHIFT_REG*"  }
