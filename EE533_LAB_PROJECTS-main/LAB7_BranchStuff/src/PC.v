module PC
#(
   parameter DATA_WIDTH = 64
)
(
   input                            clock, reset,
   input       [DATA_WIDTH-1 : 0]   PC_i,
   output reg  [DATA_WIDTH-1 : 0]   PC_o
);

   always @(posedge clock, negedge reset)
   begin
      if(!reset)
         PC_o <= 'd0;
      else if (PC_i === 64'bX)
         PC_o <= 'd0;
      else
         PC_o <= PC_i;
   end

endmodule