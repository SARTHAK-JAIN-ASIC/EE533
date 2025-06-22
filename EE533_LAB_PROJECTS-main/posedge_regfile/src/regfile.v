module regfile
  #(
    parameter REGISTERED_OUTPUT = 0,
    parameter ADDRESS_WIDTH     = 4,
    parameter DATA_WIDTH        = 64,
    parameter REGFILE_WIDTH     = 32
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

  // Initialize registers on reset
  integer i;
  always @(posedge clock) begin
    if (reset) begin
      // Initialize each register with its index + 1
      for (i = 0; i < REGFILE_WIDTH; i = i + 1) begin
        register[i] <= i + 1;
      end

      // Initialize specific registers with custom values
      register[15] <= 64'h64; // fp = 100
      register[11] <= 64'hC8; // sp = 200
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
