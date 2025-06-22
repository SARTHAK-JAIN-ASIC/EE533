module ControlUnit
(
   input [10 : 0] control_instruction_i,
   output reg           reg2Loc        ,
   output reg           ALUsrc         ,
   output reg           memtoReg       ,
   output reg           regWrite       ,
   output reg           memRead        ,
   output reg           memWrite       ,
   output reg           branch         ,
   output reg [1 : 0]   ALUop          
);

   initial
   begin
      reg2Loc        = 0;
      ALUsrc         = 0;
      memtoReg       = 0;
      regWrite       = 0;
      memRead        = 0;
      memWrite       = 0;
      branch         = 0;
      ALUop          = 2'b00;
   end

   always @(*)
   begin
      if(control_instruction_i[10:5] == 6'b000101) // Control bits for B
      begin
         reg2Loc        = 0;
         ALUsrc         = 0;
         memtoReg       = 0;
         regWrite       = 0;
         memRead        = 0;
         memWrite       = 0;
         branch         = 1;
         ALUop          = 2'b01;
      end
      else if(control_instruction_i[10:3] == 8'b10110100) // Control bits for CBZ
      begin
         reg2Loc        = 1;
         ALUsrc         = 0;
         memtoReg       = 0;
         regWrite       = 0;
         memRead        = 0;
         memWrite       = 0;
         branch         = 1;
         ALUop          = 2'b01;
      end
      else if(control_instruction_i[10:1] == 10'b1001000100) // ADDI
      begin
          reg2Loc       = 0;
          ALUsrc        = 1;
          memtoReg      = 0;
          regWrite      = 1;
          memRead       = 0;
          memWrite      = 0;
          branch        = 0;
          ALUop         = 2'b10;  // ALU does ADD (part of ALU control unit logic)
      end
      else if(control_instruction_i[10:1] == 10'b1101000100) // SUBI
      begin
          reg2Loc       = 0;
          ALUsrc        = 1;
          memtoReg      = 0;
          regWrite      = 1;
          memRead       = 0;
          memWrite      = 0;
          branch        = 0;
          ALUop         = 2'b10;  // ALU does SUB (part of ALU control unit logic)
      end
      else
      begin
         case(control_instruction_i)

            11'b10001011000, //ADD
            11'b11001011000, //SUB
            11'b10001010000, //AND
            11'b10101010000: //ORR
            begin
               reg2Loc     = 0;
               ALUsrc      = 0;
               memtoReg    = 0;
               regWrite    = 1;
               memRead     = 0;
               memWrite    = 0;
               branch      = 0;
               ALUop       = 2'b10;
            end

            11'b11111000010: //LDUR Load
            begin
               reg2Loc     = 1;
               ALUsrc      = 1;
               memtoReg    = 1;
               regWrite    = 1;
               memRead     = 1;
               memWrite    = 0;
               branch      = 0;
               ALUop       = 2'b00;
            end

            11'b11111000000: //STUR Store
            begin
               reg2Loc     = 1;
               ALUsrc      = 1;
               regWrite    = 0;
               memRead     = 0;
               memWrite    = 1;
               branch      = 0;
               ALUop       = 2'b00;
            end

         endcase
      end
   end

endmodule