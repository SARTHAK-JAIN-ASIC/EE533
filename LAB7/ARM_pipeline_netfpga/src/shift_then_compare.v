module shift_then_compare 
#(
   parameter DATA_WIDTH = 64
)
(
   input wire                       clock,               // Clock signal
   input wire                       reset,               // Reset signal
   input wire [DATA_WIDTH-1 : 0]    data_in,             // Incoming 64-bit (8-byte) data stream
   input wire [DATA_WIDTH-1 : 0]    pattern_in,          // 7-byte pattern to match (fixed input)
   output                           match_detected_o     // Match flag output
);

   reg [(DATA_WIDTH*2) - 1 : 0]     shift_reg_stage1;      // Stage 1 - Shift register storage
   reg [(DATA_WIDTH*2) - 1 : 0]     shift_reg_stage2;      // Stage 2 - Delayed shift register for pipelining
   reg [9:0]                        match_results_next;    // Stage 2 - Parallel match results
   reg [9:0]                        match_results;
   reg                              first_cycle_done;      // Flag to track first cycle
   reg                              first_cycle_done_reg;
   wire [DATA_WIDTH-9 : 0]          pattern;              //55:0 -> 7 BYTE//

   assign pattern = pattern_in[DATA_WIDTH-9 : 0];         //55:0 -> 7 BYTE//

   //Pipeline Stage 1: Shift Register Update and Track first cycle
   always @(posedge  clock or negedge  reset) 
   begin
      if (! reset) 
      begin
         shift_reg_stage1     <= 128'b0;
         first_cycle_done_reg <= 1'b0;
         first_cycle_done     <= 1'b0;
      end 
      else 
      begin
         shift_reg_stage1     <= {shift_reg_stage1[63:0], data_in};  // Shift left by 8 bytes, append new data -> Create 2 "frames" of total 16B
         first_cycle_done_reg <= 1'b1;  // Track first cycle
         first_cycle_done     <= first_cycle_done_reg;
      end
   end

   //Pipeline Stage 2: Parallel Pattern Matching 
   always @(posedge  clock or negedge  reset) 
   begin
      if(! reset)
      begin
         first_cycle_done  <= 1'd0;
         match_results     <=  'd0;
      end
      else
      begin
         //shift_reg_stage2  <= shift_reg_stage1; //Pass shift_reg to next stage
         match_results     <= 'd0;
      end
   end

   always @(*)
   begin
      if (!first_cycle_done) 
      begin
         //Cycle 1: Check all 10 positions 
         match_results[9] = (shift_reg_stage1[127:72] == pattern);
         match_results[8] = (shift_reg_stage1[119:64] == pattern);
         match_results[7] = (shift_reg_stage1[111:56] == pattern);
         match_results[6] = (shift_reg_stage1[103:48] == pattern);
         match_results[5] = (shift_reg_stage1[95:40]  == pattern);
         match_results[4] = (shift_reg_stage1[87:32]  == pattern);
         match_results[3] = (shift_reg_stage1[79:24]  == pattern);
         match_results[2] = (shift_reg_stage1[71:16]  == pattern);
         match_results[1] = (shift_reg_stage1[63:8]   == pattern);
         match_results[0] = (shift_reg_stage1[55:0]   == pattern);
      end 
      else 
      begin
         //Cycle 2+: Ignore first 2 positions as they were already checked in the first cycle
         match_results[7] = (shift_reg_stage1[111:56] == pattern);
         match_results[6] = (shift_reg_stage1[103:48] == pattern);
         match_results[5] = (shift_reg_stage1[95:40]  == pattern);
         match_results[4] = (shift_reg_stage1[87:32]  == pattern);
         match_results[3] = (shift_reg_stage1[79:24]  == pattern);
         match_results[2] = (shift_reg_stage1[71:16]  == pattern);
         match_results[1] = (shift_reg_stage1[63:8]   == pattern);
         match_results[0] = (shift_reg_stage1[55:0]   == pattern);
      end
   end
  
   //always @(posedge  clock or negedge  reset) 
   //begin
   //	if (! reset) 
   //    match_results <= 'd0;
   //  else
   //    match_results <= match_results_next;
   //end
   //
   assign  match_detected_o = (! reset) ? 'd0 : |match_results;  // OR-reduction to check if any position matched
   

endmodule
