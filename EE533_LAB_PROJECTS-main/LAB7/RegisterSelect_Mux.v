module RegisterSelect_Mux
(
   input [4:0]    Rm, Rt,
   input          reg2Loc,
   output [4:0]   registerOut
);

   assign registerOut = reg2Loc ? Rt : Rm;

endmodule
