module RegisterSelect_Mux
(
   input [3:0]    Rm, Rt,
   input          reg2Loc,
   output [3:0]   registerOut
);

   assign registerOut = reg2Loc ? Rt : Rm;

endmodule
