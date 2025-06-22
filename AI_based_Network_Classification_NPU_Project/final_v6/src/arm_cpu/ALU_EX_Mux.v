module ALU_EX_Mux
#(
   parameter DATA_WIDTH = 64
)
(
   input    [DATA_WIDTH - 1 : 0] signExtendNum  ,
   input    [DATA_WIDTH - 1 : 0] regData        ,
   input                         ALUsrc         ,
   output   [DATA_WIDTH - 1 : 0] ALUMuxOut      
); 

   assign ALUMuxOut = ALUsrc ? signExtendNum : regData;

endmodule