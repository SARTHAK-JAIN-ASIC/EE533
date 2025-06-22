module ForwardingUnitALUMuxB
#(
   parameter DATA_WIDTH  = 64
)
(
   input [DATA_WIDTH - 1:0] 	 regData2,
   input [DATA_WIDTH - 1:0] 	 dataMemoryMUXout,
   input [DATA_WIDTH - 1:0] 	 EXMEM_InputAddress,
   input [1:0] 					 ForwardB,
   output reg [DATA_WIDTH - 1:0] ForwardingUnitALUMUXoutB
);

   always @(*) 
	case (ForwardB)
      2'b00: ForwardingUnitALUMUXoutB = regData2;
      2'b01: ForwardingUnitALUMUXoutB = dataMemoryMUXout;
      2'b10: ForwardingUnitALUMUXoutB = EXMEM_InputAddress;
      default: ForwardingUnitALUMUXoutB = regData2;
   endcase
endmodule
