module mux_2to1_8bit (
    input select,          
    input [7:0] a, 
    input [7:0] b,  
    output [7:0] mux_out  
);
    assign mux_out = select ? a : b; 

   
endmodule
