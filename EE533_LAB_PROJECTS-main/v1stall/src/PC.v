module PC
#(
   parameter DATA_WIDTH = 64
)
(
   input                            clock, reset,
   input       [DATA_WIDTH-1 : 0]   PC_i,
   input                            PCWire,
   output reg  [DATA_WIDTH-1 : 0]   PC_o
);

   /* always @(posedge clock, negedge reset)
   begin
      if(!reset) */


   always @(posedge clock)
   begin
      if(reset) begin
         PC_o <= 'd0;
      end
      else if (PC_i === 64'bX) begin
         PC_o <= 'd0;
      end
      else if (PCWire) begin// Only bring in Next PC when no stall
         PC_o <= PC_i;
      end
   end

endmodule
