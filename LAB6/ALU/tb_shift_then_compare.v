`timescale 1ns / 1ps

module tb_pipelined_shift_register_matcher;

   //  Parameters 
   localparam CLK_PERIOD = 10; // Clock period in nanoseconds
   localparam DATA_WIDTH = 64;

   //  Testbench Signals 
   reg clock;
   reg reset;
   reg [63:0] data_in;
   reg [55:0] pattern_in;
   wire match_detected_o;

   //  Instantiate DUT (Design Under Test) 
   shift_then_compare
   pattern_matcher (
       .clock(clock),
       .reset(reset),
       .data_in(data_in),
       .pattern_in(pattern_in),
       .match_detected_o(match_detected_o)
   );

   //Clock Generation 
   always #(CLK_PERIOD) clock = ~clock; // Toggle clock every 10 ns

    //  Test Stimulus 
   initial 
   begin
      //  Initialize Inputs 
      clock = 0;
      reset = 0;
      data_in = 64'b0;
      pattern_in = 56'b0;
        
      //  Apply Reset 
      #(2*CLK_PERIOD);
      reset = 1;

      //  Set a Known Pattern 
      #CLK_PERIOD;
      pattern_in = 56'hfa_1234_5678_9ABC;  // Example 7-byte pattern to match

      //  Scenario 1: Random Data with No Match 
      #(2*CLK_PERIOD); data_in = 64'h1122334455667788;
      #(2*CLK_PERIOD); data_in = 64'h99AABBCCDDEEFF00;
      #(2*CLK_PERIOD); data_in = 64'h8877665544332211;
      #(2*CLK_PERIOD); data_in = 64'hFAFAFAFAFAFAFAFA;

      //pattern_in = 56'hfa_1234_5678_9ABC;  // Example 7-byte pattern to match
      //  Scenario 2: Pattern Appears in One Cycle 
      #(2*CLK_PERIOD); data_in = 64'h123456789ABC1122; //  Pattern should match 

      pattern_in = 56'hfa_1234_5678_9ABC;  // Example 7-byte pattern to match

      //Scenario 3: Pattern Split Across Two Cycles 
      #(2*CLK_PERIOD); data_in = 64'h5678_9ABC_3344_5566;
      #(2*CLK_PERIOD); data_in = 64'h778899AA12345678; //  Pattern spans across shift 

      pattern_in = 56'h78_1234_5678_9ABC;

      //  Scenario 4: Multiple Consecutive Matches 
      #(2*CLK_PERIOD); data_in = 64'h123456789ABC1234; //  Match 
      #(2*CLK_PERIOD); data_in = 64'h56789ABC56789ABC; //  Match 
      #(2*CLK_PERIOD); data_in = 64'h1122334455667788; //  No match 
      #(2*CLK_PERIOD); data_in = 64'h123456789ABC1234; //  Match Again 

      //  Scenario 5: No More Matches 
      #(2*CLK_PERIOD); data_in = 64'h5566778899AABBCC;
      #(2*CLK_PERIOD); data_in = 64'hDDEEFF1122334455;
      #(2*CLK_PERIOD); data_in = 64'h6666666666666666;
      #(2*CLK_PERIOD); data_in = 64'h7777777777777777;

      //  Continue Randomized Data Feed for Robust Testing 
      repeat (10)
      begin
         #(2*CLK_PERIOD);
         data_in = $random;
      end

      //  End Simulation 
      #500;
      $finish;
   end

   //Monitor Outputs 
   initial 
   begin
      $monitor($time, " ns | reset=%b | data_in=%h | pattern_in=%h | match_detected_o=%b", reset, data_in, pattern_in, match_detected_o);
   end

   //  Dump Waveform for Debugging 
   initial 
   begin
      $dumpfile("pipelined_shift_register_matcher.vcd");
      $dumpvars(0, tb_pipelined_shift_register_matcher);
   end

endmodule
