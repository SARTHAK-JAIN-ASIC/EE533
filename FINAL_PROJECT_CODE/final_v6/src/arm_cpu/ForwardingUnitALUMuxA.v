/* module ForwardingUnitALUMuxA
#(
   parameter DATA_WIDTH  = 64
)
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
 */
 
 module ForwardingUnitALUMuxA
#(
   parameter DATA_WIDTH  = 64
)
(
   input [DATA_WIDTH - 1:0] regData1,
   input [DATA_WIDTH - 1:0] dataMemoryMUXout,
   input [DATA_WIDTH - 1:0] EXMEM_InputAddress,
   input [1:0] ForwardA,
   output [DATA_WIDTH - 1:0] ForwardingUnitALUMUXoutA
);

   assign ForwardingUnitALUMUXoutA = (ForwardA == 2'b00) ? regData1 :
                                     (ForwardA == 2'b01) ? dataMemoryMUXout :
                                     (ForwardA == 2'b10) ? EXMEM_InputAddress :
                                     regData1; // default case

endmodule
