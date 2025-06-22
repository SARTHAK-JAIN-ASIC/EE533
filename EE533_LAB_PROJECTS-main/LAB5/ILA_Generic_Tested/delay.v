module delay
(
   input                               clock,
   input          [`DATA_WIDTH-1 : 0]  data_in,
   output   reg   [`DATA_WIDTH-1 : 0]  data_out
);

   reg   [`DATA_WIDTH-1 : 0]  delay_regz;
   reg   [`DATA_WIDTH-1 : 0]  delay_regzz;
   reg   [`DATA_WIDTH-1 : 0]  delay_regzzz;

   always @(posedge clock)
   begin
      delay_regz  <= data_in;
      //delay_regzz <= delay_regz;
      data_out    <= delay_regz;
   end

endmodule