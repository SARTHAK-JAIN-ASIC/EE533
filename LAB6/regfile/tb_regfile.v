`timescale 1ns/1ps

module regfile_tb;

   // Parameters
   parameter REGISTERED_OUTPUT = 0;
   parameter ADDRESS_WIDTH     = 6;
   parameter DATA_WIDTH        = 64;

   // Inputs
   reg                         clock;
   reg [ADDRESS_WIDTH - 1 : 0] r1addr;
   reg [ADDRESS_WIDTH - 1 : 0] r2addr;
   reg [ADDRESS_WIDTH - 1 : 0] waddr;
   reg [DATA_WIDTH - 1 : 0]    wdata;
   reg                         reg_write;

   // Outputs
   wire [DATA_WIDTH - 1 : 0]   r1data_o;
   wire [DATA_WIDTH - 1 : 0]   r2data_o;

   // Instantiate the Unit Under Test (UUT)
   regfile #(
      .REGISTERED_OUTPUT(REGISTERED_OUTPUT),
      .ADDRESS_WIDTH(ADDRESS_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
   ) uut (
      .clock(clock),
      .r1addr(r1addr),
      .r2addr(r2addr),
      .waddr(waddr),
      .wdata(wdata),
      .reg_write(reg_write),
      .r1data_o(r1data_o),
      .r2data_o(r2data_o)
   );

   // Clock generation
   initial begin
      clock = 0;
      forever #5 clock = ~clock; // Toggle clock every 5 time units
   end

   // Testbench logic
   initial begin
      // Initialize inputs
      r1addr   = 0;
      r2addr   = 0;
      waddr    = 0;
      wdata    = 0;
      reg_write = 0;

      // Wait for a few clock cycles
      #20;

      // Test Case 1: Write to register 1
      waddr    = 6'd1;
      wdata    = 64'h123456789ABCDEF0;
      reg_write = 1;
      #10;
      reg_write = 0;

      // Read from register 1
      r1addr   = 6'd1;
      #10;
      if (r1data_o !== 64'h123456789ABCDEF0) begin
         $display("Test Case 1 Failed: Expected 0x123456789ABCDEF0, Got %h", r1data_o);
      end else begin
         $display("Test Case 1 Passed");
      end

      // Test Case 2: Write to register 2
      waddr    = 6'd2;
      wdata    = 64'hFEDCBA9876543210;
      reg_write = 1;
      #10;
      reg_write = 0;

      // Read from register 2
      r2addr   = 6'd2;
      #10;
      if (r2data_o !== 64'hFEDCBA9876543210) begin
         $display("Test Case 2 Failed: Expected 0xFEDCBA9876543210, Got %h", r2data_o);
      end else begin
         $display("Test Case 2 Passed");
      end

      // Test Case 3: Write to register 0 (should not write)
      waddr    = 6'd0;
      wdata    = 64'hDEADBEEFDEADBEEF;
      reg_write = 1;
      #10;
      reg_write = 0;

      // Read from register 0 (should return 0)
      r1addr   = 6'd0;
      #10;
      if (r1data_o !== 64'd0) begin
         $display("Test Case 3 Failed: Expected 0x0, Got %h", r1data_o);
      end else begin
         $display("Test Case 3 Passed");
      end

      // Test Case 4: Simultaneous read and write
      waddr    = 6'd3;
      wdata    = 64'hAABBCCDDEEFF0011;
      reg_write = 1;
      r1addr   = 6'd3;
      #10;
      reg_write = 0;

      // Read from register 3
      #10;
      if (r1data_o !== 64'hAABBCCDDEEFF0011) begin
         $display("Test Case 4 Failed: Expected 0xAABBCCDDEEFF0011, Got %h", r1data_o);
      end else begin
         $display("Test Case 4 Passed");
      end

      // End simulation
      $display("Simulation Finished");
      $finish;
   end
  
  initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
  end

endmodule