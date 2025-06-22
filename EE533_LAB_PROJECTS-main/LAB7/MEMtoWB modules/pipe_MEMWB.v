//`timescale 1ns / 1ps
module pipe_MEMWB 
#(
    parameter DATA_WIDTH  = 64,
    parameter REGFILE_ADDRESS_WIDTH  = 5
) 
(
    input                                           clock               ,  // Clock
    input                                           reset               ,  // Reset
    input                                           enable              ,  // Enable (for stalls)

    input      [DATA_WIDTH-1:0]                     memRead_dataOut_i   ,
    input      [DATA_WIDTH-1:0]                     regData_i           ,
    input                                           mem2Reg_i           ,
    input                                           regWrite_i          ,
    input      [4:0]                                writeReg_i          ,

    output reg [DATA_WIDTH-1:0]                     memRead_dataOut_o   ,
    output reg [DATA_WIDTH-1:0]                     regData_o           ,
    output reg                                      mem2Reg_o           ,
    output reg                                      regWrite_o          ,
    output reg [4:0]                                writeReg_o          
);

    always @(posedge clock or posedge reset)
    begin
        if (!reset)
        begin
            memRead_dataOut_o  <= 'd0;
            regData_o          <= 'd0;
            mem2Reg_o          <= 'd0;
            regWrite_o         <= 'd0;
            writeReg_o         <= 'd0;
        end
        else if (enable)
        begin
            memRead_dataOut_o  <=  memRead_dataOut_i;
            regData_o          <=  regData_i        ;
            mem2Reg_o          <=  mem2Reg_i        ;
            regWrite_o         <=  regWrite_i       ;
            writeReg_o         <=  writeReg_i       ;
        end
    end

endmodule
