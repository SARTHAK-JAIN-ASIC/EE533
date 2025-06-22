module pipe_EXMEM
   #(
      parameter DATA_WIDTH            = 64,
      parameter REGFILE_ADDRESS_WIDTH = 3
   ) 
   (
      input                         clock, reset   ,
      input                         memRead_i      ,
      input                         memWrite_i     ,
      input                         regWrite_i     ,
      input                         mem2Reg_i      ,
      input      [4:0]              writeReg_i     ,
      input      [DATA_WIDTH-1 : 0] writeData_mem  ,
      input      [DATA_WIDTH-1 : 0] aluResult_in   ,
      input                         aluZero_i      ,
      input	     [DATA_WIDTH-1 : 0] branch_address_i,
      input                         branch_en_i    ,

      output reg                    memRead_o      ,
      output reg                    memWrite_o     ,
      output reg                    regWrite_o     ,
      output reg                    mem2Reg_o      ,
      output reg [4:0]              writeReg_o     ,
      output reg [DATA_WIDTH-1 : 0] writeData_mem_o,
      output reg [DATA_WIDTH-1 : 0] aluResult_out  ,
      output reg                    aluZero_o      ,
      output reg [DATA_WIDTH-1 : 0] branch_address_o,
      output reg                    branch_en_o
	  
   );

   always @(posedge clock or negedge reset)
   begin
      if (!reset)
		begin
         memRead_o        <= 'd0;
         memWrite_o       <= 'd0;
         regWrite_o       <= 'd0;
         mem2Reg_o        <= 'd0;
         writeReg_o       <= 'd0;
         writeData_mem_o  <= 'd0;
         aluResult_out    <= 'd0;
         aluZero_o        <= 'd0;
		 branch_address_o <= 'd0;
		 branch_en_o      <= 'd0;
      end 
      else //if (enable)
      begin
         memRead_o        <= memRead_i       ;
         memWrite_o       <= memWrite_i      ;
         regWrite_o       <= regWrite_i      ;
         mem2Reg_o        <= mem2Reg_i       ;
         writeReg_o       <= writeReg_i      ;
         writeData_mem_o  <= writeData_mem   ;
         aluResult_out    <= aluResult_in    ;
         aluZero_o        <= aluZero_i       ;
		 branch_address_o <= branch_address_i;
		 branch_en_o      <= branch_en_i     ;
      end
   end
   
endmodule
