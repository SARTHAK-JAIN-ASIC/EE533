module ForwardingUnit
(
   input [3:0]      IDEX_RegisterRm,
   input [3:0]      IDEX_RegisterRn,
   input [3:0]      EXMEM_RegisterRd,
   input [3:0]      MEMWB_RegisterRd,
   input [3:0]      IDEX_RegisterRd, //Will only be used for STR because the STR format has Rd = Rm
   input            IDEX_MemWrite,
   input            EXMEM_RegWrite,
   input            MEMWB_RegWrite,
   output reg [1:0] ForwardA,
   output reg [1:0] ForwardB
);

   always @(*) 
   begin
      ForwardA = 2'b00;
      ForwardB = 2'b00;

      //EX hazard:
      if ((EXMEM_RegWrite) && (EXMEM_RegisterRd != 31) && (EXMEM_RegisterRd == IDEX_RegisterRn)) begin
         ForwardA = 2'b10;
      end
      if ((EXMEM_RegWrite) && (EXMEM_RegisterRd != 31) && (EXMEM_RegisterRd == IDEX_RegisterRm) && !(IDEX_MemWrite)) begin //If not STR
         ForwardB = 2'b10;
      end
	  
	  if ((EXMEM_RegWrite) && (EXMEM_RegisterRd != 31) && ( (EXMEM_RegisterRd == IDEX_RegisterRd) || (EXMEM_RegisterRd == IDEX_RegisterRm) ) && (IDEX_MemWrite)) begin //If STR
         ForwardB = 2'b10;
      end

      //MEM hazard:
      if ((MEMWB_RegWrite) && (MEMWB_RegisterRd != 31) && (MEMWB_RegisterRd == IDEX_RegisterRn))
         begin
            ForwardA = 2'b01;
         end
      if ((MEMWB_RegWrite) && (MEMWB_RegisterRd != 31) && (MEMWB_RegisterRd == IDEX_RegisterRm))
         begin
            ForwardB = 2'b01;
         end
   end
endmodule