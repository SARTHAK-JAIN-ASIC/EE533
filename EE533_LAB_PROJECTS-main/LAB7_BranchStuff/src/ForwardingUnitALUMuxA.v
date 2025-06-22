module ForwardingUnitALUMuxA
(
   input [DATA_WIDTH - 1:0]      regData1,
   input [DATA_WIDTH - 1:0]      dataMemoryMUXout,
   input [DATA_WIDTH - 1:0]      EXMEM_InputAddress,
   input [1:0]                   ForwardA,
   output reg [DATA_WIDTH - 1:0] ForwardingUnitALUMUXoutA
);

   always @(*) 
   case (ForwardA)
      2'b00: ForwardingUnitALUMUXoutA   = regData1;
      2'b01: ForwardingUnitALUMUXoutA   = dataMemoryMUXout;
      2'b10: ForwardingUnitALUMUXoutA   = EXMEM_InputAddress;
      default: ForwardingUnitALUMUXoutA = regData1;
   endcase
endmodule
