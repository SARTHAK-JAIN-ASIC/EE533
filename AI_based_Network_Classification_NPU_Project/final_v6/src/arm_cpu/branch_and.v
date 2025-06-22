module branch_and //ANDing of branch enable and ALUzero
(
   input     branch_en,
   input     zero,
   output    PCsrc
);

   assign PCsrc = branch_en & zero;

endmodule