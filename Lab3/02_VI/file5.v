module led_export (input_hex,led7);
  input [3:0] input_hex;
  output [6:0] led7;
  reg [6:0] led7;

always@(input_hex) begin
   case(input_hex)
      0:led7=7'b0000001;
      1:led7=7'b1001111;
      2:led7=7'b0010010;
      3:led7=7'b0000110;
      4:led7=7'b0000110;
      5:led7=7'b1001100;
      6:led7=7'b0100100;
      7:led7=7'b0100000;
      8:led7=7'b0000000;
      9:led7=7'b0001100;
   endcase
end

endmodule
