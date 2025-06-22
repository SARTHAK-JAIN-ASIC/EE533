module branch_and
(
   input    branch_en   ,
   input    zero        ,
   output   PCsrc       
);

   assign PCsrc = zero & branch_en;
endmodule