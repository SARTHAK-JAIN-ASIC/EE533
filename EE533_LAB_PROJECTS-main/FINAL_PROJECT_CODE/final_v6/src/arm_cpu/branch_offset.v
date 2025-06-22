module branch_address //This is the adder that takes in PC and shiftleft2 of sign extended
#(
   parameter DATA_WIDTH = 64
)
(
   input    [DATA_WIDTH - 1 : 0] PC,
   input    [DATA_WIDTH - 1 : 0] sign_extended,
   input                         positive_offset,
   
   output   [DATA_WIDTH - 1 : 0] branch_address
);

   // branch_address calculation is based on whether it is a positive offset or negative offset.
   assign branch_address = (positive_offset) ? (PC + sign_extended-1) : (PC - sign_extended-1); 
   


endmodule
