module PC_Adder
#(
   parameter DATA_WIDTH = 64
)
(
   input    [DATA_WIDTH - 1 : 0] PC,
   input    [DATA_WIDTH - 1 : 0] Offset,
   output   [DATA_WIDTH - 1 : 0] PCNext
);

   assign PCNext = PC + Offset;

endmodule