//`timescale 1ns / 1ps
module pipe_MEMWB 
#(
    parameter DATA_WIDTH  = 64,
    parameter REGFILE_ADDRESS_WIDTH  = 4
) 
(
    input                                           clock               ,  // Clock
    input                                           reset               ,  // Reset
	//input                                           flush               ,
    input                                           enable              ,  // Enable (for stalls)

    input      [DATA_WIDTH-1:0]                     memRead_dataOut_i   ,
    input      [DATA_WIDTH-1:0]                     regData_i           ,
    input                                           mem2Reg_i           ,
    input                                           regWrite_i          ,
    input      [REGFILE_ADDRESS_WIDTH-1:0]          writeReg_i          ,
	input 											memRead_i           ,
	input	                                        branch_taken_i,

    output reg [DATA_WIDTH-1:0]                     memRead_dataOut_o   ,
    output reg [DATA_WIDTH-1:0]                     regData_o           ,
    output reg                                      mem2Reg_o           ,
    output reg                                      regWrite_o          ,
    output reg [REGFILE_ADDRESS_WIDTH-1:0]          writeReg_o          ,
	output reg 										memRead_o 		    ,
	output reg	                                    branch_taken_o
);

    /* always @(posedge clock or negedge reset)
    begin
        if (!reset) */
   always @(posedge clock)
   begin
      if(reset )//|| flush)
        begin
            memRead_dataOut_o  <= 64'd0;
            regData_o          <= 64'd0;
            mem2Reg_o          <= 1'd0;
            regWrite_o         <= 1'd0;
            writeReg_o         <= 1'd0;
			memRead_o		   <= 1'd0;
			branch_taken_o     <= 1'd0;
        end
        else if (enable)
        begin
            memRead_dataOut_o  <=  memRead_dataOut_i;
            regData_o          <=  regData_i        ;
            mem2Reg_o          <=  mem2Reg_i        ;
            regWrite_o         <=  regWrite_i       ;
            writeReg_o         <=  writeReg_i       ;
			memRead_o		   <=  memRead_i		;
			branch_taken_o     <=  branch_taken_i   ;
        end
    end

endmodule
