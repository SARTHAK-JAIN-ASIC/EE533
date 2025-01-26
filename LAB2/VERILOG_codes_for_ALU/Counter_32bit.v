module Counter_32bit (
    input wire CLK,            // Clock signal
    input wire RST,            // Asynchronous reset (active-high)
    output reg [31:0] Q        // 32-bit counter output
);

    always @(posedge CLK or posedge RST) begin
        if (RST)
            Q <= 32'b0;  // Reset counter to 0
        else
            Q <= Q + 1;  // Increment counter by 1 on each clock cycle
    end

endmodule
