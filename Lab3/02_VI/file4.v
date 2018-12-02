module decimal_decode(factor, hex_format_output1, hex_format_output2);

input [6:0] factor;

output [3:0] hex_format_output1;
output [3:0] hex_format_output2;
reg [3:0] hex_format_output1;
reg [3:0] hex_format_output2;

always@(factor) begin
   hex_format_output1 <= factor/10;
   hex_format_output2 <= factor%10;
end

endmodule
