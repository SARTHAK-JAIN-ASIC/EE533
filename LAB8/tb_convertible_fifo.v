`timescale 1ns/1ps

module tb_CONVERTIBLE_FIFO;

   parameter DATA_WIDTH = 64;
   parameter CTRL_WIDTH = DATA_WIDTH/8;

   reg clock;
   reg rst;
   reg switch; // Mode control: 1 = FIFO Mode (NetFPGA), 0 = CPU Mode

   // FIFO (NetFPGA) Inputs
   reg small_fifo_empty_i;
   reg [DATA_WIDTH-1:0] in_small_fifo_data_i;
   reg [CTRL_WIDTH-1:0] control_value_i;
   reg out_rdy_i;

   wire out_wr_valid_o;
   wire small_fifo_read_en_o;
   wire cpu_stall_o;
   wire fifo_mode_wr_en_o;
   wire [71:0] fifo_data_wdata_o;
   wire fifo_full_o;
   wire fifo_empty_o;
   wire [9:0] fifo_tail_o;
   wire [9:0] fifo_head_o;

   // CPU (DMEM) Inputs
   reg proc_wr_en_i;
   reg proc_rd_en_i;
   reg [DATA_WIDTH-1:0] EXMEM_aluResult_i;
   reg [DATA_WIDTH-1:0] EXMEM_writeData_mem_i;

   wire [DATA_WIDTH-1:0] cpu_mem_address_o;
   wire [DATA_WIDTH-1:0] cpu_wdata_o;
   wire cpu_read_enable_o;
   wire cpu_write_enable_o;

   // Instantiate the DUT (Device Under Test)
   CONVERTIBLE_FIFO uut (
      .clock(clock),
      .reset(rst),
      .switch(switch),

      // FIFO (NetFPGA) Interface
      .small_fifo_empty_i(small_fifo_empty_i),
      .in_small_fifo_data_i(in_small_fifo_data_i),
      .control_value_i(control_value_i),
      .out_rdy_i(out_rdy_i),
      .out_wr_valid_o(out_wr_valid_o),
      .small_fifo_read_en_o(small_fifo_read_en_o),
      .cpu_stall_o(cpu_stall_o),
      .fifo_mode_wr_en_o(fifo_mode_wr_en_o),
      .fifo_data_wdata_o(fifo_data_wdata_o),
      .fifo_full_o(fifo_full_o),
      .fifo_empty_o(fifo_empty_o),
      .fifo_tail_o(fifo_tail_o),
      .fifo_head_o(fifo_head_o),

      // CPU (DMEM) Interface
      .proc_wr_en_i(proc_wr_en_i),
      .proc_rd_en_i(proc_rd_en_i),
      .EXMEM_aluResult_i(EXMEM_aluResult_i),
      .EXMEM_writeData_mem_i(EXMEM_writeData_mem_i),
      .cpu_mem_address_o(cpu_mem_address_o),
      .cpu_wdata_o(cpu_wdata_o),
      .cpu_read_enable_o(cpu_read_enable_o),
      .cpu_write_enable_o(cpu_write_enable_o)
   );

   // Generate Clock (10 ns period -> 100 MHz)
   always #5 clock = ~clock;

   //always @(posedge clock)
   //begin
   //   if (uut.curr_state == 2'b11)
   //      $display(" FSM in state == %0d at time %0t", uut.curr_state, $time);
//
   //   if (uut.end_of_pkt_nxt)
   //      $display(" end_of_pkt_nxt set at time %0t", $time);
   //end

   initial
   begin
      // **Step 1: Initialize Signals**
      clock = 0;
      rst = 1;
      switch = 0; // Start in CPU (DMEM) Mode

      // FIFO Inputs (Not active yet)
      small_fifo_empty_i = 1;
      in_small_fifo_data_i = 0;
      control_value_i = 0;
      out_rdy_i = 0;

      // CPU Inputs (Not active yet)
      proc_wr_en_i = 0;
      proc_rd_en_i = 0;
      EXMEM_aluResult_i = 0;
      EXMEM_writeData_mem_i = 0;

      // Hold reset for a few cycles
      @(posedge clock);//#20;
      @(posedge clock);
      rst = 0;
      @(posedge clock);

      // **Step 2: Test CPU (DMEM) Mode**
      $display("🚀 Testing CPU (DMEM) Mode...");
      proc_wr_en_i = 1;
      EXMEM_aluResult_i = 64'h1000;
      EXMEM_writeData_mem_i = 64'hDEADBEEFCAFEBABE;
      @(posedge clock);
      proc_wr_en_i = 0;
      @(posedge clock);

      proc_rd_en_i = 1;
      EXMEM_aluResult_i = 64'h1000;
      @(posedge clock);
      proc_rd_en_i = 0;
      @(posedge clock);

      // **Step 3: Switch to FIFO (NetFPGA) Mode**
      $display("🚀 Switching to FIFO (NetFPGA) Mode...");
      switch = 1;
      @(posedge clock);

      // **Step 4: Write Data to FIFO (NetFPGA)**
      $display("🚀 Writing Data into FIFO...");
      small_fifo_empty_i = 0;
      in_small_fifo_data_i = 64'hAABBCCDDEEFF1122;
      control_value_i = 8'hFF; // Header
      @(posedge clock);

      in_small_fifo_data_i = 64'h123456789ABCDEF0;
      control_value_i = 8'hAA;
      @(posedge clock);

      in_small_fifo_data_i = 64'hDEADBEEFCAFEBABE;
      control_value_i = 8'h00; // Start of Packet Data
      @(posedge clock);

      in_small_fifo_data_i = 64'hFACEFACEFACEFACE;
      control_value_i = 8'h00;
      @(posedge clock);

      in_small_fifo_data_i = 64'hC0DE1234C0DE5678;
      control_value_i = 8'h10; // End of Packet
      @(posedge clock);

      @(posedge clock);
      small_fifo_empty_i = 1;
      @(posedge clock);
      @(posedge clock);

      // **Step 5: Read Data from FIFO**
      $display("🚀 Reading Data from FIFO...");
      out_rdy_i = 1;
      repeat(5)
         @(posedge clock);//#50;
      out_rdy_i = 0;

      // **Step 6: Check FIFO Full Behavior**
      if (fifo_full_o)
         $display("  FIFO Full Detected After Writing.");
      else
         $display("❌ FIFO Full Error!");

      // Read Data
      out_rdy_i = 1;
      repeat(3)
         @(posedge clock);//#30;
      out_rdy_i = 0;

      if (!fifo_full_o)
         $display("  FIFO Full Cleared After Reading.");
      else
         $display("❌ FIFO Full Stuck!");

      // **Step 7: Switch Back to CPU (DMEM) Mode**
      $display("🚀 Switching Back to CPU Mode...");
      switch = 0;
      @(posedge clock);

      // **Step 8: Read Data Again in CPU Mode**
      proc_rd_en_i = 1;
      EXMEM_aluResult_i = 64'h1000;
      @(posedge clock);
      proc_rd_en_i = 0;
      @(posedge clock);

      // **Step 9: Verify FIFO Empty Behavior**
      if (fifo_head_o == fifo_tail_o && fifo_empty_o)
         $display("  FIFO Empty Detected Correctly.");
      else
         $display("❌ FIFO Empty Error!");

      // **Finish Simulation**
      $display("  Test Completed Successfully!  ");
      $stop;
   end

endmodule
