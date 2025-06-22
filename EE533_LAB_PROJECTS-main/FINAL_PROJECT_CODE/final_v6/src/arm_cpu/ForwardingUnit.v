/* module ForwardingUnit
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


   assign RM_FW_FROM_MEM = (EXMEM_RegisterRd == IDEX_RegisterRm) & (EXMEM_RegisterRd != 0 & EXMEM_RegWrite   != 0);
   assign RM_FW_FROM_WB  = (MEMWB_RegisterRd == IDEX_RegisterRm) & (MEMWB_RegWrite   !=0  & MEMWB_RegisterRd != 0);

   assign RN_FW_FROM_MEM = (EXMEM_RegisterRd == IDEX_RegisterRn) & (EXMEM_RegisterRd != 0 & EXMEM_RegWrite   != 0);
   assign RN_FW_FROM_WB  = (MEMWB_RegisterRd == IDEX_RegisterRn) & (MEMWB_RegWrite   !=0  & MEMWB_RegisterRd != 0);

   always @(*)
   begin
      if(RM_FW_FROM_MEM)
      begin
         ForwardA = 2'b10;
      end
      else
      begin
         if(RM_FW_FROM_WB & ~(RM_FW_FROM_MEM))
            ForwardA = 2'b01;
         else
            ForwardA = 2'b00;
      end

      if(RN_FW_FROM_MEM)
      begin
         ForwardB = 2'b10;
      end
      else
      begin
         if(RN_FW_FROM_WB & ~(RN_FW_FROM_MEM))
            ForwardB = 2'b01;
         else
			begin
				if ((EXMEM_RegWrite) && (EXMEM_RegisterRd != 31) && ( (EXMEM_RegisterRd == IDEX_RegisterRd) || (EXMEM_RegisterRd == IDEX_RegisterRm) ) && (IDEX_MemWrite)) begin //If STR
					 ForwardB = 2'b10;
				end
			
				else
					ForwardB = 2'b00;
			end
      end

   end
endmodule */

module ForwardingUnit
(
   input [3:0]      IDEX_RegisterRm,
   input [3:0]      IDEX_RegisterRn,
   input [3:0]      EXMEM_RegisterRd,
   input [3:0]      MEMWB_RegisterRd,
   input [3:0]      IDEX_RegisterRd,
   input            IDEX_MemWrite,
   input            EXMEM_RegWrite,
   input            MEMWB_RegWrite,
   output reg [1:0] ForwardA,
   output reg [1:0] ForwardB
);

   wire RM_FW_FROM_MEM = (EXMEM_RegisterRd == IDEX_RegisterRm) & (EXMEM_RegisterRd != 0 & EXMEM_RegWrite != 0);
   wire RM_FW_FROM_WB  = (MEMWB_RegisterRd == IDEX_RegisterRm) & (MEMWB_RegWrite != 0 & MEMWB_RegisterRd != 0);
   
   wire RN_FW_FROM_MEM = (EXMEM_RegisterRd == IDEX_RegisterRn) & (EXMEM_RegisterRd != 0 & EXMEM_RegWrite != 0);
   wire RN_FW_FROM_WB  = (MEMWB_RegisterRd == IDEX_RegisterRn) & (MEMWB_RegWrite != 0 & MEMWB_RegisterRd != 0);

   wire STR_FW_FROM_MEM = (EXMEM_RegWrite && (EXMEM_RegisterRd != 31) && 
                           ((EXMEM_RegisterRd == IDEX_RegisterRd) || 
                            (EXMEM_RegisterRd == IDEX_RegisterRm)) && 
                           IDEX_MemWrite);

   always @(*)
   begin
      // ForwardA logic
      if (RM_FW_FROM_MEM)
         ForwardA = 2'b10;
      else if (RM_FW_FROM_WB)
         ForwardA = 2'b01;
      else
         ForwardA = 2'b00;

      // ForwardB logic
      if (RN_FW_FROM_MEM)
         ForwardB = 2'b10;
      else if (RN_FW_FROM_WB)
         ForwardB = 2'b01;
      else if (STR_FW_FROM_MEM)
         ForwardB = 2'b10;
      else
         ForwardB = 2'b00;
   end

endmodule
