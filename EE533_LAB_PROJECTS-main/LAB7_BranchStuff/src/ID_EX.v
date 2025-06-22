module ID_EX
#(
   parameter DATA_WIDTH             = 64
)
(
   input                            clock, reset, flush,
   input       [1:0]                aluop_i,
   input                            alusrc_i, 
   input                            memWrite_i,
   input                            memRead_i,
   input                            mem2Reg_i,
   input                            regWrite_i,
   input       [DATA_WIDTH - 1 : 0] PC_i,
   input       [DATA_WIDTH - 1 : 0] ReadData1_i,
   input       [DATA_WIDTH - 1 : 0] ReadData2_i,
   input       [DATA_WIDTH - 1 : 0] signExtended_i,
   input       [10 : 0]             aluCtrl_i,
   input       [4 : 0]              Rm_i, Rn_i,
   input       [4 : 0]              writeReg_i,
   input                            branch_en_i,

   output reg [1:0]                 aluop_o,
   output reg                       alusrc_o,
   output reg                       memWrite_o,
   output reg                       memRead_o,
   output reg                       mem2Reg_o,
   output reg                       regWrite_o,
   output reg [DATA_WIDTH - 1 : 0]  PC_o,
   output reg [DATA_WIDTH - 1 : 0]  ReadData1_o,
   output reg [DATA_WIDTH - 1 : 0]  ReadData2_o,
   output reg [DATA_WIDTH - 1 : 0]  signExtended_o,
   output reg [10 : 0]              aluCtrl_o,
   output reg [4 : 0]               Rm_o, Rn_o,
   output reg [4 : 0]               writeReg_o,
   output reg                       branch_en_o
);

   initial
   begin
      aluop_o     = 'd0;
      alusrc_o    = 'd0;
      memWrite_o  = 'd0;
      memRead_o   = 'd0;
      mem2Reg_o   = 'd0;
      regWrite_o  = 'd0;
   end

   always @(posedge clock, negedge reset)
   begin
      if(!reset)
      begin
         aluop_o        <= 'd0;
         alusrc_o       <= 'd0;
         memWrite_o     <= 'd0;
         memRead_o      <= 'd0;
         mem2Reg_o      <= 'd0;
         regWrite_o     <= 'd0;
         PC_o           <= 'd0;
         ReadData1_o    <= 'd0;
         ReadData2_o    <= 'd0;
         signExtended_o <= 'd0;
         aluCtrl_o      <= 'd0;
         Rm_o           <= 'd0;
         Rn_o           <= 'd0;
         writeReg_o     <= 'd0;
		 branch_en_o    <= 'd0;
      end
      else
      begin
         //--------- <EX STAGE>----------//
         aluop_o        <= aluop_i       ;
         alusrc_o       <= alusrc_i      ;
		 branch_en_o    <= branch_en_i   ;

         //-------- <MEM STAGE>----------//
         memWrite_o     <= memWrite_i    ;
         memRead_o      <= memRead_i     ;

         //--------- <WB STAGE>----------//
         mem2Reg_o      <= mem2Reg_i     ;
         regWrite_o     <= regWrite_i    ;


         PC_o           <= PC_i          ;
         ReadData1_o    <= ReadData1_i   ;
         ReadData2_o    <= ReadData2_i   ;
         signExtended_o <= signExtended_i;
         aluCtrl_o      <= aluCtrl_i     ;
         Rm_o           <= Rm_i          ;
         Rn_o           <= Rn_i          ;
         writeReg_o     <= writeReg_i    ;
		 
      end
   end

endmodule
