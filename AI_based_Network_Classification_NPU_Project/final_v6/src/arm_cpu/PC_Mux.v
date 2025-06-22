module PC_Mux
#(
   parameter DATA_WIDTH = 64
)
(
   input                            PCSrc_i,
   input       [DATA_WIDTH - 1 : 0] PC_i,
   input       [DATA_WIDTH - 1 : 0] PCPlusOffset,
   output reg  [DATA_WIDTH - 1 : 0] PCMuxOut
);

   always @(*)
   begin
      case(PCSrc_i)
         0 : PCMuxOut = PC_i;
         1 : PCMuxOut = PCPlusOffset;
         default : PCMuxOut = PC_i;
      endcase
   end

endmodule
