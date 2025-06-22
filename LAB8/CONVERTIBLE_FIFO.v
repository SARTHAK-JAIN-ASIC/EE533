module CONVERTIBLE_FIFO
#(
   parameter DATA_WIDTH = 64,
   parameter CTRL_WIDTH = DATA_WIDTH/8,
   parameter UDP_REG_SRC_WIDTH = 2
)
(
   input                      clock,
   input                      reset,

   input                      switch,

   input                      small_fifo_empty_i,
   input  [DATA_WIDTH-1:0]    in_small_fifo_data_i,
   input  [CTRL_WIDTH-1:0]    control_value_i,
   input                      out_rdy_i,

   output reg                 out_wr_valid_o,
   output reg                 small_fifo_read_en_o,
   output reg                 cpu_stall_o,

   output reg                 fifo_mode_wr_en_o,
   output reg [71 : 0]        fifo_data_wdata_o,
   output reg                 fifo_full_o,
   output reg                 fifo_empty_o,
   output reg [9 : 0]         fifo_tail_o,
   output reg [9 : 0]         fifo_head_o,

   input                      proc_wr_en_i,
   input                      proc_rd_en_i,
   input [DATA_WIDTH-1 : 0]   EXMEM_aluResult_i,
   input [DATA_WIDTH-1 : 0]   EXMEM_writeData_mem_i,

   output reg [DATA_WIDTH-1 : 0] cpu_mem_address_o,
   output reg [DATA_WIDTH-1 : 0] cpu_wdata_o,
   output reg                    cpu_read_enable_o,
   output reg                    cpu_write_enable_o
);

   parameter START         = 2'b00;
   parameter PARSE_HEADERS = 2'b01;
   parameter PARSE_PAYLOAD = 2'b10;
   parameter END_PACKET    = 2'b11;


   reg [1:0]   nxt_state, curr_state;

   reg                     start_of_pkt, end_of_pkt;
   reg                     cpu_stall_nxt;
   //reg                     fifo_mode_wr_en_nxt, small_fifo_read_en_nxt;
   reg [9:0]               fifo_tail_nxt, fifo_head_nxt;
   reg                     out_wr_valid_nxt;
   reg                     start_of_pkt_nxt;
   reg                     end_of_pkt_nxt;
   reg [71 : 0]            fifo_data_wdata_int;
   reg                     cpu_read_enable_nxt;
   reg                     cpu_write_enable_nxt;

   always @(*)
   begin
      cpu_stall_nxt           = cpu_stall_o;
      fifo_mode_wr_en_o       = 1'd0;
      small_fifo_read_en_o    = 1'd0;
      fifo_tail_nxt           = fifo_tail_o;
      //fifo_head_nxt           = 'd0 ; //fifo_head_o;
      out_wr_valid_nxt        = 1'd0;
         
      start_of_pkt_nxt        = start_of_pkt; //1'd0;
      end_of_pkt_nxt          = end_of_pkt  ; //1'd0;
      fifo_data_wdata_int     = fifo_data_wdata_o;//'d0;
      nxt_state               = curr_state;

      if(switch)
      begin
         cpu_stall_nxt        = 1'd1;

         if(!small_fifo_empty_i)
         begin
            //start_of_pkt_nxt        = start_of_pkt; //1'd0;
            //end_of_pkt_nxt          = end_of_pkt; //1'd0;
            fifo_mode_wr_en_o       = 1'd1;
            small_fifo_read_en_o    = 1'd1;
            //fifo_tail_nxt           = fifo_tail_o;
            fifo_data_wdata_int     = {control_value_i, in_small_fifo_data_i};
            
            case(curr_state)
               START:
               begin
                  if(!fifo_full_o && control_value_i != 8'd00) //start storing packets including headers
                  begin
                     out_wr_valid_nxt  = 1'd1;
                     start_of_pkt_nxt  = 1'd1;
                     end_of_pkt_nxt    = 1'd0;
                     nxt_state         = PARSE_HEADERS;
                     fifo_tail_nxt     = fifo_tail_nxt  + 1'd1;
                  end
               end

               PARSE_HEADERS:
               begin
                  start_of_pkt_nxt     = 1'd0;
                  out_wr_valid_nxt     = 1'd1;
                  fifo_tail_nxt        = fifo_tail_nxt + 1'd1;
                  if(control_value_i == 8'd00)
                     nxt_state         =  PARSE_PAYLOAD;
               end

               PARSE_PAYLOAD:
               begin
                  start_of_pkt_nxt     = 1'd0;
                  end_of_pkt_nxt       = 1'd0;
                  out_wr_valid_nxt     = 1'd1;
                  fifo_tail_nxt        = fifo_tail_nxt + 1'd1;
                  if(control_value_i != 8'h00)
                  begin
                     nxt_state         = END_PACKET;
                     end_of_pkt_nxt       = 1'd1;
                  end
               end

               END_PACKET:
               begin
                  //start_of_pkt_nxt     = 1'd0;
                  end_of_pkt_nxt       = 1'd0;
                  nxt_state            = START;
                  $display("FSM in END_PACKET = %0d at time %0t", end_of_pkt_nxt, $time);
               end

               default : nxt_state = START;
            endcase
         end
      end

      //CPU MODE ON//
      else 
      begin
         cpu_stall_nxt        = 1'd0;
         cpu_write_enable_nxt = 1'd0;
         cpu_read_enable_nxt  = 1'b0;

         if(proc_wr_en_i)
         begin
            cpu_write_enable_nxt = 1'b1;
            fifo_tail_nxt        = fifo_tail_nxt + 1;
         end

         if(proc_rd_en_i)
         begin
            cpu_read_enable_nxt  = 1'b1;
            fifo_head_nxt        = fifo_head_nxt + 1;
         end
      end

   end

   always @(posedge clock)
   begin
      if(reset)
      begin
         cpu_stall_o             <= 1'd0;
         curr_state              <= START;
         //fifo_mode_wr_en_o       <= 'd0;
         //small_fifo_read_en_o    <= 'd0;
         fifo_data_wdata_o       <= 'd0;
         fifo_tail_o             <= 'd0;
         fifo_head_o             <= 'd0;
         out_wr_valid_o          <= 'd0;
         start_of_pkt            <= 'd0;
         end_of_pkt              <= 'd0;
         cpu_write_enable_o      <= 'd0;
         cpu_read_enable_o       <= 'd0;
         cpu_wdata_o             <= 'd0;
         cpu_mem_address_o       <= 'd0;
      end
      else
      begin
         if(switch)
         begin
            cpu_stall_o          <= cpu_stall_nxt         ;
            curr_state           <= nxt_state             ;
            //fifo_mode_wr_en_o    <= fifo_mode_wr_en_nxt   ;
            //small_fifo_read_en_o <= small_fifo_read_en_nxt;
            fifo_data_wdata_o    <= fifo_data_wdata_int   ;
            fifo_tail_o          <= fifo_tail_nxt         ;
            //fifo_head_o          <= fifo_head_nxt         ;
            out_wr_valid_o       <= out_wr_valid_nxt      ;
            start_of_pkt         <= start_of_pkt_nxt      ;
            end_of_pkt           <= end_of_pkt_nxt        ;
         end
         else
         begin
            cpu_write_enable_o   <= cpu_write_enable_nxt    ;
            cpu_read_enable_o    <= cpu_read_enable_nxt     ;

            if(proc_wr_en_i)
            begin
               cpu_mem_address_o <= EXMEM_aluResult_i       ;
               cpu_wdata_o       <= EXMEM_writeData_mem_i   ;
               fifo_tail_o       <= fifo_tail_nxt           ;
            end

            if(proc_rd_en_i)
            begin
               cpu_mem_address_o <= EXMEM_aluResult_i ;
               fifo_head_o       <= fifo_head_nxt     ;
            end
         end
      end
   end

   always @(*)
   begin
      fifo_full_o  = 1'd0;
      fifo_empty_o = 1'd0;

      if(curr_state == END_PACKET)
         fifo_full_o    = 1;

      if(fifo_head_o == fifo_tail_o)
         fifo_empty_o   = 1;
      else
         fifo_empty_o   = 0;

      //Reset fifo_full_o when FIFO is read//
      if (!fifo_empty_o && out_rdy_i)
         fifo_full_o    = 0;

   end

   always @(posedge clock)
   begin
      if(reset)
      begin
         fifo_head_o <= 'd0;
      end
      else
      begin
         if(switch)
         begin
            if(!fifo_empty_o && out_rdy_i)
               fifo_head_o <= fifo_head_o + 1'd1;
         end
         else if(!switch && proc_rd_en_i && !fifo_empty_o)
         begin
            fifo_head_o <= fifo_head_o + 1'd1;
         end
      end
   end

endmodule