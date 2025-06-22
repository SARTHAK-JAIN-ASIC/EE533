module HazardDetectionUnit
(
	   input            IDEX_MemRead,
	   input            IDEX_MemWrite,
	   input            IDEX_RegWrite,
	   
	   input            EXMEM_MemRead,
	   input            EXMEM_MemWrite,
	   input            EXMEM_RegWrite,
	   
	   input            flush,
	   
	   input            MEMWB_RegWrite,

	   output reg       IFID_Write,
	   output reg       PCWire,
	   output reg       ControlWire
);
      initial
      begin
         IFID_Write       = 1'b1;
         PCWire           = 1'b1;
         ControlWire      = 1'b1;
      end

      always @(*) 
      begin
		 if (flush) begin
		       IFID_Write  = 1'b0;
               PCWire      = 1'b1;
               ControlWire = 1'b1;
		end
         else if (IDEX_MemRead || IDEX_MemWrite || IDEX_RegWrite || EXMEM_MemRead || EXMEM_MemWrite || EXMEM_RegWrite || MEMWB_RegWrite)
         begin
               IFID_Write  = 1'b0;
               PCWire      = 1'b0;
               ControlWire = 1'b0;
         end 
         else 
         begin
               IFID_Write  = 1'b1;
               PCWire      = 1'b1;
               ControlWire = 1'b1;
         end
      end
endmodule
