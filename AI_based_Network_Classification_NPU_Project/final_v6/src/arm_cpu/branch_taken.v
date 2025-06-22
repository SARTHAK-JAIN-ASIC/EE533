module branch_taken //This module provides the output of whether a branch is taken or not.
#(
   parameter DATA_WIDTH = 64
)
(
   input wire   B_i,
   input wire   BGE_i,
   input wire   BLE_i,
   input wire   zero_i,
   input wire   GT_i,
   input wire   LT_i,
   
   output branchTaken_o
   
   
   
);

wire BGE_and;
wire BLE_and;

assign BGE_and = BGE_i && (zero_i || GT_i);
assign BLE_and = BLE_i && (zero_i || LT_i);

assign branchTaken_o = B_i || BGE_and || BLE_and;



endmodule
