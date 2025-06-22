module adder
#(
  parameter DATA_WIDTH = 64
)
(
  input [DATA_WIDTH - 1 : 0] PC_i         ,
  input [DATA_WIDTH - 1 : 0] Immediate_i  ,
  output[DATA_WIDTH - 1 : 0] Br_Addr      
);
  
  assign Br_Addr = PC_i + Immediate_i;
endmodule