module Mux2x1
#(
   parameter DATA_WIDTH = 64
)
(
   input    [DATA_WIDTH - 1 : 0] in1,
   input    [DATA_WIDTH - 1 : 0] in2,
   input                         sel,
   output   [DATA_WIDTH - 1 : 0] out
);

   assign out = sel ? in1 : in2;

endmodule