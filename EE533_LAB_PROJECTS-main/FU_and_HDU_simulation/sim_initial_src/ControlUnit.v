module ControlUnit
(
   input [7 : 0] control_instruction_i,
   output reg           reg2Loc        ,
   output reg           ALUsrc         ,
   output reg           memtoReg       ,
   output reg           regWrite       ,
   output reg           memRead        ,
   output reg           memWrite       ,
   output reg           branch         ,
   //output reg           MOV            ,
   output reg [1 : 0]   ALUop          
);

  /*  initial
   begin
      reg2Loc        = 0;
      ALUsrc         = 0;
      memtoReg       = 0;
      regWrite       = 0;
      memRead        = 0;
      memWrite       = 0;
      branch         = 0;
      ALUop          = 2'b00;
   end */

   always @(*)
   begin
      /* if(control_instruction_i[10:5] == 6'b000101) // Control bits for B
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
      else if */
	  
	  
	  if(control_instruction_i == 8'b0010_1000) // ADD with Immediate value like "add r1, r2, #0"
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
      else if(control_instruction_i == 8'b0010_0100) // SUB with Immediate value like "add r1, r2, #0"
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
	  else if(control_instruction_i == 8'b0011_1010) // MOV (with immediate value)
      begin
          reg2Loc       = 0;
          ALUsrc        = 1; //This matters. Must choose the signextended immediate value
          memtoReg      = 0;
          regWrite      = 1;
          memRead       = 0;
          memWrite      = 0;
          branch        = 0;
          ALUop         = 2'b10;  
      end
	  else if(control_instruction_i == 8'b0001_1010) // MOV (with register)
      begin
          reg2Loc       = 0;
          ALUsrc        = 0; //Chooses Read Data Out of RegFile Addr2
          memtoReg      = 0;
          regWrite      = 1;
          memRead       = 0;
          memWrite      = 0;
          branch        = 0;
          ALUop         = 2'b10;  
      end
      else
      begin
         case(control_instruction_i)

            8'b0000_1000: //ADD
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
            8'b0000_0100: //SUB
            /* 11'b10001010000, //AND
            11'b10101010000: //ORR */
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

            8'b0101_0001:
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
			8'b0101_1001: //LDR with positive offset , LDR with negative offset
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

            8'b0101_0000: //STR with negative offset, 
            begin
               reg2Loc     = 1;
               ALUsrc      = 1;
               regWrite    = 0;
               memRead     = 0;
               memWrite    = 1;
               branch      = 0;
               ALUop       = 2'b00;
            end
			
			// Default case (only applies if no other matches)
			default: 
            begin
               reg2Loc   = 0;
               ALUsrc    = 0;
               memtoReg  = 0;
               regWrite  = 0;
               memRead   = 0;
               memWrite  = 0;
               branch    = 0;
               ALUop     = 2'b00;
            end

         endcase
      end
   end

endmodule