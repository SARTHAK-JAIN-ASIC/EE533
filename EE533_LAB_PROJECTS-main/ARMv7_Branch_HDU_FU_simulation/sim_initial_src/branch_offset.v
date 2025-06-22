module branch_address //This is the adder that takes in PC and shiftleft2 of sign extended
#(
   parameter DATA_WIDTH = 64
)
(
   input    [DATA_WIDTH - 1 : 0] PC,
   input    [DATA_WIDTH - 1 : 0] sign_extended,
   output   [DATA_WIDTH - 1 : 0] branch_address
);

   assign branch_address = PC + sign_extended;

endmodule
