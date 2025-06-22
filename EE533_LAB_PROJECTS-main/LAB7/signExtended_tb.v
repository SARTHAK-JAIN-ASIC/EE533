module signExtended_tb;

   // Parameters
   localparam INSTR_WIDTH = 32;
   localparam DATA_WIDTH  = 64;

   // Testbench Signals
   reg  [INSTR_WIDTH - 1 : 0] instruction;
   wire [DATA_WIDTH - 1 : 0] immediate;

   // DUT Instance
   signExtended #(
       .INSTR_WIDTH(INSTR_WIDTH),
       .DATA_WIDTH(DATA_WIDTH)
   ) dut (
       .instruction(instruction),
       .immediate(immediate)
   );

   // Task to print test result
   task print_result;
       input [INSTR_WIDTH-1:0] instr;
       input [DATA_WIDTH-1:0] imm;
       begin
         $display("Instruction: %b Immediate: %b", instr[31:21], imm);
       end
   endtask

   // Test Procedure
   initial 
   begin
      $display("Starting signExtended Testbench...");

      // R-type ADD
      instruction = 32'b10001011000000000000000000000000;  // opcode 10001011000 (ADD)
      #10 $display("Instruction: %b Immediate: %b", instruction[31:21], immediate);

      // I-type ADDI with positive immediate
      instruction = 32'b1001_0001_0000_0000_0000_0101_0000_0001;  // opcode 1001000100, imm=5
      #10 $display("Instruction: %b || Instruction[21:10] = %b || Immediate: %b", instruction[31:21], instruction[21:10], immediate);

      // I-type SUBI with large positive immediate
      instruction = 32'b1101_0001_0000_0000_0001_1111_0000_0001;  // opcode 1101000100, imm=1023
      #10 $display("Instruction: %b || Instruction[21:10] = %b || Immediate: %0d", instruction[31:21], instruction[21:10], immediate);

      // D-type LDUR with small offset
      instruction = 32'b1111_1000_0000_0000_1000_0000_0000_0001;  // opcode 11111000010, offset=0
      #10 $display("Instruction: %b || Instruction[20:12] = %b || Immediate: %0d", instruction[31:21], instruction[20:12], immediate);

      // D-type STUR with negative offset (-1)
      instruction = 32'b11111000000000011111111110000001;  // opcode 11111000000, offset=-1 (2's complement)
      #10 print_result(instruction, immediate);

      // B-type Branch forward (offset 4 words, 16 bytes)
      instruction = 32'b00010100000000000000000000000100;  // opcode 000101, offset=4
      #10 print_result(instruction, immediate);

      // B-type Branch backward (offset -4 words, -16 bytes)
      instruction = 32'b0001_0111_1111_1111_1111_1111_1111_1100;  // opcode 000101, offset=-4
      #10 $display("Instruction: %b || Instruction[25:0] = %b || Immediate: %b", instruction[31:21], instruction[25:0], immediate);

      // CB-type CBZ with positive offset
      instruction = 32'b10110100000000000000000000000001;  // opcode 10110100, offset=1
      #10 print_result(instruction, immediate);

      // CB-type CBZ with negative offset
      instruction = 32'b10110101111111111111111111111111;  // opcode 10110101, offset=-1
      #10 print_result(instruction, immediate);

      // Random Instruction (unhandled case)
      instruction = 32'hDEADBEEF;  // No valid opcode
      #10 print_result(instruction, immediate);

      $display("signExtended Testbench Completed.");
      $stop;
   end

endmodule
