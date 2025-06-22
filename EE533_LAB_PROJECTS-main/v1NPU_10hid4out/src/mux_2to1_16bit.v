module mux_2to1_16bit (
    input select,          
    input [15:0] a, 
    input [15:0] b,  
    output [15:0] mux_out  
);
    assign mux_out = select ? a : b; 

   
endmodule
