# wave.do
# Set up the waveform window
add wave -position insertpoint sim:/stage_MEMtoWB_tb/mem_to_wb_stage/*
# add wave -position insertpoint sim:/stage_MEMtoWB_tb/mem_to_wb_stage/wb_data_out
# add wave -position insertpoint sim:/stage_MEMtoWB_tb/mem_to_wb_stage/wb_rd_out
# add wave -position insertpoint sim:/stage_MEMtoWB_tb/mem_to_wb_stage/enable
# add wave -position insertpoint sim:/stage_MEMtoWB_tb/mem_to_wb_stage/clk
# add wave -position insertpoint sim:/stage_MEMtoWB_tb/mem_to_wb_stage/reset




# add wave -position insertpoint sim:/stage_MEMtoWB_tb/mem_to_wb_stage/pipe_EXMEM/*
# add wave -position insertpoint sim:/stage_MEMtoWB_tb/mem_to_wb_stage/Data_Mem/*
# add wave -position insertpoint sim:/stage_MEMtoWB_tb/mem_to_wb_stage/pipe_MEMWB/*
# add wave -position insertpoint sim:/stage_MEMtoWB_tb/mem_to_wb_stage/write_back_mux/*
# Start the simulation
run -all
