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

  // Initialize registers on reset
  integer i;
  always @(posedge clock) begin
    if (reset) begin
      register[0] <= 1;
	  register[1] <= 2;
	  register[2] <= 3;
	  register[3] <= 4;
	  register[4] <= 5;
	  register[5] <= 6;
	  register[6] <= 7;
	  register[7] <= 8;
	  register[8] <= 9;
	  register[9] <= 10;
	  register[10] <= 11;
	  register[11] <= 64'hC8; // sp = 200
	  register[12] <= 13;
	  register[13] <= 14;
	  register[14] <= 15;
	  register[15] <= 64'h64; // fp = 100

    end else if (reg_write) begin
      // Write data to register when reg_write is active
      register[waddr] <= wdata;
    end
  end

  // Generate registered output logic
  generate
    if (REGISTERED_OUTPUT) begin
      reg [DATA_WIDTH-1 : 0] data_reg1;
      reg [DATA_WIDTH-1 : 0] data_reg2;
      always @(posedge clock) begin
        data_reg1 <= (r1addr != 0) ? register[r1addr] : 'd0;
        data_reg2 <= (r1addr != 0) ? register[r2addr] : 'd0;
      end

      assign r1data_o = data_reg1;
      assign r2data_o = data_reg2;
    end else begin
      assign r1data_o = (r1addr != 0) ? register[r1addr] : 'd0;
      assign r2data_o = (r2addr != 0) ? register[r2addr] : 'd0;
    end
  endgenerate

endmodule
