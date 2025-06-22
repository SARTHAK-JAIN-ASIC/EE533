# wave.do
# Set up the waveform window
#add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/*

#add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/PCMux/*
#add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/RegisterFile/*
#add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/imem32x512/*
#add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/IF_ID/*


# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/signExtend/*
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/MainControlUnit/*

#add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/*


#PC2IDEX ----------------------------------------------------------------------------------------
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/signExtend/instruction  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/signExtend/immediate  

# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/clock  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/reset  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/PC_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/ReadData1_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/ReadData2_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/signExtended_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/aluCtrl_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/Rm_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/Rn_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/writeReg_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/branch_en_i  

# add wave -divider {Controls}   

# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/flush  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/aluop_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/alusrc_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/memWrite_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/memRead_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/mem2Reg_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/regWrite_i  


#PC2EXMEM----------------------------------------------------------------------------------------
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/signExtend/instruction 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/signExtend/immediate  

# add wave -divider {RegFile} 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/RegisterFile/*

# add wave -divider {ALUControl}  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ALUControlLogic/* 
# add wave -divider {MuxforALU}  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ALU_inReg_MUX/* 



# add wave -divider {ALU} 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/alu_in1_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/alu_in2_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/aluctrl_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/alu_o  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/cout_o 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/sum_or_diff  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/add_op_i  




# add wave -divider {EX/MEM pipereg} 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/memRead_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/memWrite_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/regWrite_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/mem2Reg_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/writeReg_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/writeData_mem  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/aluResult_in  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/aluZero_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/branch_address_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/branch_en_i  

#PC2MEMWB----------------------------------------------------------------------------------------

# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/signExtend/instruction 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/signExtend/immediate  

# add wave -divider {RegFile} 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/RegisterFile/*
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/RegisterFile/register

# add wave -divider {ForwardingMuxA}
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/FU_ALU_MuxA/*  

# add wave -divider {ForwardingMuxB}
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/FU_ALU_MuxB/*  

# add wave -divider {ForwardingUnit}
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/FU/*



# add wave -divider {ALUControl}  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ALUControlLogic/* 
# add wave -divider {MuxforALU}  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ALU_inReg_MUX/* 

# add wave -divider {ALU} 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/alu_in1_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/alu_in2_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/aluctrl_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/alu_o  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/cout_o 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/sum_or_diff  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/add_op_i  


# add wave -divider {EX/MEM pipereg} 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/memRead_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/memWrite_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/regWrite_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/mem2Reg_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/writeReg_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/writeData_mem  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/aluResult_in  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/aluZero_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/branch_address_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/branch_en_i  

# add wave -divider {DATA_MEMORY} 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/DATA_MEMORY/* 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/DATA_MEMORY/Memory

# add wave -divider {MEM/WB pipereg} 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/MEM_WB/memRead_dataOut_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/MEM_WB/regData_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/MEM_WB/mem2Reg_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/MEM_WB/regWrite_i  
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/MEM_WB/writeReg_i  


# add wave -divider {WBStage_MUX} 
# add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/WBStage_MUX/*

add wave -divider {Program Counter} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/program_counter/*

add wave -divider {PCPlus4} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/PCPlus4/*

add wave -divider {PCPlus4} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/PCMux/*

add wave -divider {IMEM} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/imem32x512/*

add wave -divider {IFID} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/IF_ID/*

add wave -divider {HDU}  
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/HDU/*

add wave -divider {HDU_MUX} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/HDU_Mux/*

add wave -divider {Control_Unit} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/MainControlUnit/*

add wave -divider {regSelect} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/regSelect/*

add wave -divider {Regfile} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/RegisterFile/*
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/RegisterFile/register

add wave -divider {signExtended} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/signExtend/*

add wave -divider {IDEX} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/pipe_ID_EX/*

add wave -divider {FU_Mux_A} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/FU_ALU_MuxA/*

add wave -divider {FU_Mux_B} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/FU_ALU_MuxB/*

add wave -divider {ForwardingUnit} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/FU/*

add wave -divider {ALU_Mux} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ALU_inReg_MUX/*

add wave -divider {ALU_Control} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ALUControlLogic/*

add wave -divider {ALU} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/ArithUnit/*

add wave -divider {EXMEM} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/EX_MEM/*

add wave -divider {DMEM} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/DATA_MEMORY/*
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/DATA_MEMORY/Memory

add wave -divider {MEMWB} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/MEM_WB/*

add wave -divider {WBStage_Mux} 
add wave -position insertpoint sim:/ARM_datapath_tb/ARMv7/WBStage_MUX/*

# Start the simulation
run -all
