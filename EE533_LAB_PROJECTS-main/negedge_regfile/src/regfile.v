//`include "defines.v"

module regfile
  #(
   	parameter REGISTERED_OUTPUT = 0,
      parameter ADDRESS_WIDTH     = 4,
      parameter DATA_WIDTH        = 64,
      parameter REGFILE_WIDTH     = 32,
	  parameter INIT_FILE = "regfile.mem" // Default memory initialization file
  )
  (
   input                         clock, reset,

   input [ADDRESS_WIDTH -1 : 0]  r1addr, r2addr,
   input [ADDRESS_WIDTH - 1 : 0] waddr,
   input [DATA_WIDTH - 1 : 0]    wdata,
   input                         reg_write,

   output [DATA_WIDTH-1 : 0]     r1data_o,
   output [DATA_WIDTH-1 : 0]     r2data_o
);

   reg [DATA_WIDTH-1 : 0] register [REGFILE_WIDTH-1 : 0];
   
   initial 
    begin
        if (INIT_FILE != "") // If INIT_FILE is provided, load memory contents
        begin
            //$display("Loading memory from %s", INIT_FILE);
            $readmemh(INIT_FILE, register);
        end
    end

  /*  initial
   begin
      register[0]  = 64'h1;
      register[1]  = 64'h2;
      register[2]  = 64'h3;
      register[3]  = 64'h4;
      register[4]  = 64'h5;
      register[5]  = 64'h6;
      register[6]  = 64'h7;
      register[7]  = 64'h8;
      register[8]  = 64'h9;
      register[9]  = 64'hA;
      register[10] = 64'hB;
      register[11] = 64'hC8; // sp = 200
      register[12] = 64'hD;
      register[13] = 64'hE;
      register[14] = 64'hF;
      register[15] = 64'h64; // fp = 100
      register[16] = 64'h11;
      register[17] = 64'h12;
      register[18] = 64'h13;
      register[19] = 64'h14;
      register[20] = 64'h15;
      register[21] = 64'h16;
      register[22] = 64'h17;
      register[23] = 64'h18;
      register[24] = 64'h19;
      register[25] = 64'h1A;
      register[26] = 64'h1B;
      register[27] = 64'h1C;
      register[28] = 64'h1D;
      register[29] = 64'h1E;
      register[30] = 64'h1F;
      register[31] = 64'h20;
   end  */
   /*
   always @(posedge reset) begin
    if (reset) begin 

	  register[0]  <= 64'h1;
      register[1]  <= 64'h2;
      register[2]  <= 64'h3;
      register[3]  <= 64'h4;
      register[4]  <= 64'h5;
      register[5]  <= 64'h6;
      register[6]  <= 64'h7;
      register[7]  <= 64'h8;
      register[8]  <= 64'h9;
      register[9]  <= 64'hA;
      register[10] <= 64'hB;
      register[11] <= 64'hC8; // sp = 200
      register[12] <= 64'hD;
      register[13] <= 64'hE;
      register[14] <= 64'hF;
      register[15] <= 64'h64; // fp = 100
      register[16] <= 64'h11;
      register[17] <= 64'h12;
      register[18] <= 64'h13;
      register[19] <= 64'h14;
      register[20] <= 64'h15;
      register[21] <= 64'h16;
      register[22] <= 64'h17;
      register[23] <= 64'h18;
      register[24] <= 64'h19;
      register[25] <= 64'h1A;
      register[26] <= 64'h1B;
      register[27] <= 64'h1C;
      register[28] <= 64'h1D;
      register[29] <= 64'h1E;
      register[30] <= 64'h1F;
      register[31] <= 64'h20;

	 end 
 end
*/
   always @(negedge clock) 
  /*  always @(posedge clock) */
   begin
	  if (reset) begin 
		  register[0]  <= 64'h1;
		  register[1]  <= 64'h2;
		  register[2]  <= 64'h3;
		  register[3]  <= 64'h4;
		  register[4]  <= 64'h5;
		  register[5]  <= 64'h6;
		  register[6]  <= 64'h7;
		  register[7]  <= 64'h8;
		  register[8]  <= 64'h9;
		  register[9]  <= 64'hA;
		  register[10] <= 64'hB;
		  register[11] <= 64'hC8; // sp = 200
		  register[12] <= 64'hD;
		  register[13] <= 64'hE;
		  register[14] <= 64'hF;
		  register[15] <= 64'h64; // fp = 100
		  register[16] <= 64'h11;
		  register[17] <= 64'h12;
		  register[18] <= 64'h13;
		  register[19] <= 64'h14;
		  register[20] <= 64'h15;
		  register[21] <= 64'h16;
		  register[22] <= 64'h17;
		  register[23] <= 64'h18;
		  register[24] <= 64'h19;
		  register[25] <= 64'h1A;
		  register[26] <= 64'h1B;
		  register[27] <= 64'h1C;
		  register[28] <= 64'h1D;
		  register[29] <= 64'h1E;
		  register[30] <= 64'h1F;
		  register[31] <= 64'h20;

	 end 
      else if(reg_write) begin
         register[waddr] <=  wdata;
		end
   end

   generate
      if(REGISTERED_OUTPUT)
      begin
         reg [DATA_WIDTH-1 : 0] data_reg1;
         reg [DATA_WIDTH-1 : 0] data_reg2;
         always @(posedge clock)
         begin
           data_reg1 <= (r1addr != 0) ? register[r1addr] : 'd0;
           data_reg2 <= (r2addr != 0) ? register[r2addr] : 'd0;
         end

         assign r1data_o = data_reg1;
         assign r2data_o = data_reg2;
      end
      else
      begin
        assign r1data_o = (r1addr != 0) ? register[r1addr] : 'd0;
        assign r2data_o = (r2addr != 0) ? register[r2addr] : 'd0;
      end
   endgenerate

endmodule