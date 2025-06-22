`include "defines.v"
`include "stop_counter.v"
`include "write_address_controller.v"
`include "read_address_controller.v"
`include "delay.v"
`include "memory.v"

module ila_top
#(
   parameter COUNT_WIDTH         = 16,
   parameter UDP_REG_SRC_WIDTH   = 2
)
(
   input                               reset, clock,
   input                               trigger_i,
   
   input       [`DATA_WIDTH-1 : 0]     data_in, 
   output      [`DATA_WIDTH-1 : 0]     data_out,
   input       [COUNT_WIDTH-1 : 0]     max_count_i,
   output                              primed_o,

   // --- Register interface
   input                               reg_req_in,
   input                               reg_ack_in,
   input                               reg_rd_wr_L_in,
   input  [`UDP_REG_ADDR_WIDTH-1:0]    reg_addr_in,
   input  [`CPCI_NF2_DATA_WIDTH-1:0]   reg_data_in,
   input  [UDP_REG_SRC_WIDTH-1:0]      reg_src_in,

   output                              reg_req_out,
   output                              reg_ack_out,
   output                              reg_rd_wr_L_out,
   output  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_out,
   output  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_out,
   output  [UDP_REG_SRC_WIDTH-1:0]     reg_src_out

);

   wire                        stopped;
   wire   [`ADDR_WIDTH-1 : 0]  waddr, raddr;
   wire   [`DATA_WIDTH-1 : 0]  data_delayed;
   wire                        triggered;

   reg [31:0] ila_part_0 [0:11];
   reg [31:0] ila_part_1 [0:11];
   reg [31:0] ila_part_2 [0:11];

   write_address_controller 
      write_control
      (
         .reset(reset),
         .clock(clock),
         .write_en_i(!stopped),
         .waddr_i(waddr), //output from this module//
         .primed_o(primed_o)
      );

   read_address_controller
      read_control
      (
         .reset(reset),
         .clock(clock),
         .read_en_i(stopped),
         .waddr_i(waddr),
         .triggered(triggered),
         .raddr_o(raddr)
      );

   stop_counter
      #(.COUNT_WIDTH(COUNT_WIDTH))
         stop_count
         (
            .reset      (reset),
            .clock      (clock),
            .trigger_i  (trigger_i),
            .primed_i   (primed_o),
            .triggered  (triggered),
            .max_count_i(max_count_i),
            .stop_o     (stopped)
         );

   memory
      ila_memory
      (
         .clock(clock),
         .reset(reset),
         .write_en_i(!stopped),
         .waddr_i(waddr),
         .raddr_i(raddr),
         .data_write_mem_i(data_in),
         .data_read_mem_o(data_out)
      );

   // Instantiate generic_regs to connect to memory map
   generic_regs
   #( 
      .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
      .TAG                 (`ILA_TOP_BLOCK_ADDR),          // Tag -- eg. MODULE_TAG
      .REG_ADDR_WIDTH      (`ILA_TOP_REG_ADDR_WIDTH),     // Width of block addresses -- eg. MODULE_REG_ADDR_WIDTH
      .NUM_COUNTERS        (0),                 // Number of counters
      .NUM_SOFTWARE_REGS   (0),                 // Number of sw regs
      .NUM_HARDWARE_REGS   (41)                  // Number of hw regs
   ) 
   ila_generic_regs
   (
      .reg_req_in       (reg_req_in),
      .reg_ack_in       (reg_ack_in),
      .reg_rd_wr_L_in   (reg_rd_wr_L_in),
      .reg_addr_in      (reg_addr_in),
      .reg_data_in      (reg_data_in),
      .reg_src_in       (reg_src_in),

      .reg_req_out      (reg_req_out),
      .reg_ack_out      (reg_ack_out),
      .reg_rd_wr_L_out  (reg_rd_wr_L_out),
      .reg_addr_out     (reg_addr_out),
      .reg_data_out     (reg_data_out),
      .reg_src_out      (reg_src_out),

      // --- counters interface
      .counter_updates  (),
      .counter_decrement(),

      // --- SW regs interface
      .software_regs    ({max_count_i, trigger_i}),

      // --- HW regs interface
      .hardware_regs
      (
         {
            primed_o,
            triggered,
            stopped,
            waddr,
            raddr,

            ila_part_0[0], ila_part_1[0], ila_part_2[0], 
            ila_part_0[1], ila_part_1[1], ila_part_2[1], 
            ila_part_0[2], ila_part_1[2], ila_part_2[2], 
            ila_part_0[3], ila_part_1[3], ila_part_2[3], 
            ila_part_0[4], ila_part_1[4], ila_part_2[4], 
            ila_part_0[5], ila_part_1[5], ila_part_2[5], 
            ila_part_0[6], ila_part_1[6], ila_part_2[6], 
            ila_part_0[7], ila_part_1[7], ila_part_2[7],
            ila_part_0[8], ila_part_1[8], ila_part_2[8],
            ila_part_0[9], ila_part_1[9], ila_part_2[9],
            ila_part_0[10], ila_part_1[10], ila_part_2[10],
            ila_part_0[11], ila_part_1[11], ila_part_2[11]
         }
      ),

      .clk(clock),
      .reset(reset)
   );

   integer i;
   integer mem_size = $clog2(`MEMORY_SIZE); //12 if memory size is 4096

   always@ (posedge clock)
   begin
      if(reset)
      begin
         for(i=0; i<mem_size; i=i+1)
         begin
            ila_part_0[i] <= 'd0;
            ila_part_1[i] <= 'd0;
            ila_part_2[i] <= 'd0;
         end
      end
      else
      begin
         for(i=mem_size-2; i>0; i=i-1)
         begin
            ila_part_0[i] <= ila_part_0[i-1];
            ila_part_1[i] <= ila_part_1[i-1];
            ila_part_2[i] <= ila_part_2[i-1];
         end

         //new data from data_out stored into last location and then shifted across
         ila_part_0[0] <= data_out[31:0];
         ila_part_1[0] <= data_out[63:0];
         ila_part_2[0] <= {24'd0, data_out[71:64]};
      end
   end

endmodule