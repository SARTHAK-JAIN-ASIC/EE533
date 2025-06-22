`include "regfile.v"
`include "instruction_memory.v"
`include "Data_Mem.v"
`include "ID_EX.v"
`include "IF_ID.v"
`include "pipe_EXMEM.v"
`include "pipe_MEMWB.v"
`include "Mux2x1.v"
`include "ControlUnit.v"
`include "signExtended.v"
`include "ALU_EX_Mux.v"
`include "ALUControl.v"
`include "ALU.v"
`include "RegisterSelect_Mux.v"
`include "PC.v"
`include "PC_Mux.v"
`include "PC_Adder.v"


module ARM_datapath
#(
   parameter DATA_WIDTH  = 64,
   parameter INSTR_WIDTH = 32
)
(
   input clock, reset
);

   wire [DATA_WIDTH-1   : 0]  PC_P_4               ;
   wire [DATA_WIDTH-1   : 0]  PC_i                 ;
   wire [DATA_WIDTH-1   : 0]  PC_o                 ;
   wire [INSTR_WIDTH-1  : 0]  CPU_instr            ;
   wire [DATA_WIDTH-1   : 0]  IFID_PC_o            ;
   wire [INSTR_WIDTH-1  : 0]  IFID_CPU_instr       ;
   wire [4:0]                 IFID_REGMux_out      ;
   wire [DATA_WIDTH-1   : 0]  DataMemory_WBMuxOut  ;
   wire                       WBStage_RegWrite     ;
   wire [DATA_WIDTH-1   : 0]  regFile_DataOut1     ;
   wire [DATA_WIDTH-1   : 0]  regFile_DataOut2     ;
   wire [DATA_WIDTH-1   : 0]  immediate            ;

   wire [1:0]                 IDEX_aluop           ;
   wire                       IDEX_alusrc_o        ;
   wire                       IDEX_memWrite_o      ;
   wire                       IDEX_memRead_o       ;
   wire                       IDEX_mem2Reg_o       ;
   wire                       IDEX_regWrite_o      ;
   wire [DATA_WIDTH - 1 : 0]  IDEX_PC_o            ;
   wire [DATA_WIDTH - 1 : 0]  IDEX_ReadData1_o     ;
   wire [DATA_WIDTH - 1 : 0]  IDEX_ReadData2_o     ;
   wire [DATA_WIDTH - 1 : 0]  IDEX_signExtended_o  ;
   wire [10 : 0]              IDEX_aluCtrl_o       ;
   wire [4 : 0]               IDEX_Rm_o            ;
   wire [4 : 0]               IDEX_Rn_o            ;
   wire [4 : 0]               IDEX_writeReg_o      ;

   wire                    EXMEM_memRead_o;
   wire                    EXMEM_memWrite_o;
   wire                    EXMEM_regWrite_o;
   wire                    EXMEM_mem2Reg_o;
   wire [4:0]              EXMEM_writeReg_o;
   wire [DATA_WIDTH-1 : 0] EXMEM_writeData_mem_o;
   wire [DATA_WIDTH-1 : 0] EXMEM_aluResult_out;
   wire                    EXMEM_aluZero_o;

   wire [DATA_WIDTH-1 : 0] MEMWB_DataMem_o      ;
   wire [DATA_WIDTH-1 : 0] MEMWB_aluResult_out  ;
   wire                    MEMWB_mem2Reg_o      ;
   wire                    MEMWB_regWrite_o     ;
   wire [4:0]              MEMWB_writeReg_o     ;

   wire        reg2Loc  ;
   wire        ALUsrc   ;
   wire        memtoReg ;
   wire        regWrite ;
   wire        memRead  ;
   wire        memWrite ;
   wire        branch   ;
   wire [1:0]  ALUop    ;

   PC 
   program_counter
   (
      .clock   (clock),
      .reset   (reset),
      .PC_i    (PC_i),
      .PC_o    (PC_o)
   );

   PC_Adder
   PCPlus4
   (
      .PC      (PC_o),
      .Offset  (64'd4),
      .PCNext  (PC_P_4)
   );

   PC_Mux
   PCMux
   (
      .PCSrc_i       (1'b0),
      .PC_i          (PC_P_4),
      .PCPlusOffset  ('d0), //branch addr
      .PCMuxOut      (PC_i)
   );

   instruction_memory
   IMEM
   (
      .PC               (PC_o),
      .CPU_Instruction  (CPU_instr)
   );

   pipe_IFID
   IF_ID
   (
      .clock         (clock         ),
      .reset         (reset         ),
      .IF_ID_Write   (1'b1          ), //pipe enabled or stalled?
      .flush_IF_ID   (1'b0          ),
      .data_IR_i     (PC_o          ),
      .instruction_i  (CPU_instr     ),
      .data_IR_o     (IFID_PC_o     ),
      .instruction_o (IFID_CPU_instr)
   );

   ControlUnit
   MainControlUnit
   (
      .control_instruction_i  (IFID_CPU_instr[31:21]),
      .reg2Loc                (reg2Loc ),
      .ALUsrc                 (ALUsrc  ),
      .memtoReg               (memtoReg),
      .regWrite               (regWrite),
      .memRead                (memRead ),
      .memWrite               (memWrite),
      .branch                 (branch  ),
      .ALUop                  (ALUop   )
   );

   RegisterSelect_Mux
   regSelect
   (
      .Rm         (IFID_CPU_instr[20:16]) ,
      .Rt         (IFID_CPU_instr[4 : 0]) ,
      .reg2Loc    (reg2Loc)               ,
      .registerOut(IFID_REGMux_out)
   );

   regfile
   RegisterFile
   (
      .clock      (clock               ),
      .r1addr     (IFID_CPU_instr[9:5] ),
      .r2addr     (IFID_REGMux_out     ),
      .waddr      (MEMWB_writeReg_o    ),
      .wdata      (DataMemory_WBMuxOut ),
      .reg_write  (MEMWB_regWrite_o    ),
      .r1data_o   (regFile_DataOut1    ),
      .r2data_o   (regFile_DataOut2    )
   );

   signExtended
   signExtend
   (
      .instruction   (IFID_CPU_instr),
      .immediate     (immediate     )
   );

   ID_EX
   pipe_ID_EX
   (
      .clock         (clock               ),
      .reset         (reset               ),
      .flush         ('d0                 ),
      .aluop_i       (ALUop               ),
      .alusrc_i      (ALUsrc              ),
      .memWrite_i    (memWrite            ),
      .memRead_i     (memRead             ),
      .mem2Reg_i     (memtoReg            ),
      .regWrite_i    (regWrite            ),
      .PC_i          (IFID_PC_o           ),
      .ReadData1_i   (regFile_DataOut1    ),
      .ReadData2_i   (regFile_DataOut2    ),
      .signExtended_i(immediate           ),
      .aluCtrl_i     (IFID_CPU_instr[31:21]),
      .Rm_i          (IFID_CPU_instr[20:16]),
      .Rn_i          (IFID_CPU_instr[9 : 5]),
      .writeReg_i    (IFID_CPU_instr[4 : 0]),

      .aluop_o       (IDEX_aluop         ),
      .alusrc_o      (IDEX_alusrc_o      ),
      .memWrite_o    (IDEX_memWrite_o    ),
      .memRead_o     (IDEX_memRead_o     ),
      .mem2Reg_o     (IDEX_mem2Reg_o     ),
      .regWrite_o    (IDEX_regWrite_o    ),
      .PC_o          (IDEX_PC_o          ),
      .ReadData1_o   (IDEX_ReadData1_o   ),
      .ReadData2_o   (IDEX_ReadData2_o   ),
      .signExtended_o(IDEX_signExtended_o),
      .aluCtrl_o     (IDEX_aluCtrl_o     ),
      .Rm_o          (IDEX_Rm_o          ),
      .Rn_o          (IDEX_Rn_o          ),
      .writeReg_o    (IDEX_writeReg_o    )
   );

   wire [3:0] aluOperationSelect;
   ALUControl
   ALUCOntrolLogic
   (
      .ALUop       (IDEX_aluop),
      .opcodeField (IDEX_aluCtrl_o),
      .ALUoperation(aluOperationSelect)
   );

   wire [DATA_WIDTH - 1 : 0]  ALU_MuxOut;
   ALU_EX_Mux
   ALU_inReg_MUX
   (
      .regData       (IDEX_ReadData2_o    ),
      .signExtendNum (IDEX_signExtended_o ),
      .ALUsrc        (IDEX_alusrc_o       ),
      .ALUMuxOut     (ALU_MuxOut          )
   );

   wire ALU_zero;
   wire [DATA_WIDTH-1 : 0] ALU_result;
   ALU
   ArithUnit
   (
      .clock      (clock            ),
      .reset      (reset            ),
      .alu_in1_i  (IDEX_ReadData1_o ),
      .alu_in2_i  (ALU_MuxOut       ),
      .aluctrl_i  (aluOperationSelect),
      .cin        (1'b0             ),
      .cout_o     (                 ),
      .alu_a_gt_b (                 ),
      .alu_a_lt_b (                 ),
      .zero       (ALU_zero         ),
      .alu_o      (ALU_result       )
   );


   pipe_EXMEM
   EX_MEM
   (
      .clock          (clock                  ),
      .reset          (reset                  ),
      .memRead_i      (IDEX_memRead_o         ),
      .memWrite_i     (IDEX_memWrite_o        ),
      .regWrite_i     (IDEX_regWrite_o        ),
      .mem2Reg_i      (IDEX_mem2Reg_o         ),
      .writeReg_i     (IDEX_writeReg_o        ),
      .writeData_mem  (IDEX_ReadData2_o       ),
      .aluResult_in   (ALU_result             ),
      .aluZero_i      (ALU_zero               ),

      .memRead_o      (EXMEM_memRead_o        ),
      .memWrite_o     (EXMEM_memWrite_o       ),
      .regWrite_o     (EXMEM_regWrite_o       ),
      .mem2Reg_o      (EXMEM_mem2Reg_o        ),
      .writeReg_o     (EXMEM_writeReg_o       ),
      .writeData_mem_o(EXMEM_writeData_mem_o  ),
      .aluResult_out  (EXMEM_aluResult_out    ),
      .aluZero_o      (EXMEM_aluZero_o        )
   );

   wire [DATA_WIDTH-1 : 0] DataMem_o;

   Data_Mem
   DATA_MEMORY
   (
      .clock      (clock                  ),
      .memWrite_i (EXMEM_memWrite_o       ),
      .MemRead_i  (EXMEM_memRead_o        ),
      .Address    (EXMEM_aluResult_out    ),
      .WData      (EXMEM_writeData_mem_o  ),
      .Dout       (DataMem_o              )

   );


   pipe_MEMWB
   MEM_WB
   (
      .clock             (clock              ),
      .reset             (reset              ),
      .enable            (1'b1               ),
      .memRead_dataOut_i (DataMem_o          ),
      .regData_i         (EXMEM_aluResult_out),
      .mem2Reg_i         (EXMEM_mem2Reg_o    ),
      .regWrite_i        (EXMEM_regWrite_o   ),
      .writeReg_i        (EXMEM_writeReg_o   ),

      .memRead_dataOut_o (MEMWB_DataMem_o    ),
      .regData_o         (MEMWB_aluResult_out),
      .mem2Reg_o         (MEMWB_mem2Reg_o    ),
      .regWrite_o        (MEMWB_regWrite_o   ),
      .writeReg_o        (MEMWB_writeReg_o   )
   );

   Mux2x1
   WBStage_MUX
   (
      .in1 (MEMWB_DataMem_o),
      .in2 (MEMWB_aluResult_out),
      .sel (MEMWB_mem2Reg_o),
      .out (DataMemory_WBMuxOut)
   );

endmodule