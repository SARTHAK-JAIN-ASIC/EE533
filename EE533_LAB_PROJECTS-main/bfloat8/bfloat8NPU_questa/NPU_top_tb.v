module tb_NPU_top;

   reg clk;
   reg reset;
   reg [63:0] data_in;

   NPU_top uut(
	.clk(clk),
	.reset(reset),
	.data_in(data_in)
   );
   
  /*  initial
   begin
	  reset      = 0;
	  clk        = 0;
	  #80; reset = ~reset;
	  #80; reset = ~reset;
		#10000;
      $finish;
	end */

	always
	begin
		#10 clk = ~clk;
	end
	
	initial begin
	  reset      = 0;
	  clk        = 0;
	  data_in    = 0;
	  #80; reset = ~reset;
	  #80; reset = ~reset;
	  // #40;
	
   
	// Actual: 1
	data_in = 64'b0001100000111000011111000100100000011000000110000001100000011000;
    #20;  // Wait one clock
	
	// Actual: 2
    data_in = 64'b0011100000111000000011000000100000001000001110000011110000110000;
    #20;  // Wait one clock
	
	 // Actual: 0
    data_in = 64'b0001100000111100001001000000000000000000001001000011110000011000;
    #20;  // Wait one clock
	
	// Actual: 2
    data_in = 64'b0001100001111000011010000000110000001000000010000001111000011111;
    #20;  // Wait one clock
	
	// Actual: 4
    data_in = 64'b0000100000011100000101000010110000111100000111000000100000001000;
    #20;  // Wait one clock
	
	// Actual: 3
	data_in = 64'b0011110000111100001011000000110000000110000000100010011000111100;
    #20;  // Wait one clock
	
	// Actual: 5
    data_in = 64'b0000111000111100001000000011100000001100000011000011100000110000;
    #20;  // Wait one clock
	
	 // Actual: 7
    data_in = 64'b0001111000111110001000100010010000001000000010000001100000010000;
    #20;  // Wait one clock
	
	// Actual: 2
    data_in = 64'b0011000000111000011010000000100000011000000100000011111000110000;
    #20;  // Wait one clock
	
	// Actual: 1
    data_in = 64'b0000010000001110000111000011110000001100000011000000110000000100;
    #20;  // Wait one clock


	
	
	
	
	
	/* // Test case 1: 7
    data_in = 64'b0001111000111110001000100010010000001000000010000001100000010000;
    #20;  // Wait one clock
	
	// Test case 1: 2
    data_in = 64'b0011000000111000011010000000100000011000000100000011111000110000;
    #20;  // Wait one clock
	
	 // Test case 1: 1
    data_in = 64'b0000010000001110000111000011110000001100000011000000110000000100;
    #20;  // Wait one clock
	
	// Test case 1: 7
    data_in = 64'b0001111000111110001000100010010000001000000010000001100000010000;
    #20;  // Wait one clock
	
	// Test case 1: 2
    data_in = 64'b0011000000111000011010000000100000011000000100000011111000110000;
    #20;  // Wait one clock
	
	// Test case 1: 1
    data_in = 64'b0000010000001110000111000011110000001100000011000000110000000100;
    #20;  // Wait one clock
	
	
	// Test case 1: 5
    data_in = 64'b0000111000111100001000000011100000001100000011000011100000110000;
    #20;  // Wait one clock  */

	
	#1000 //Run for another 1000 ns

    // End the simulation
    $finish;
  end


endmodule
