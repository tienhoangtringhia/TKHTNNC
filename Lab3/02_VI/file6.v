module top (s_clk, rst_n, led7_01, led7_02, led7_06, led7_07, light_1, light_2);

input s_clk;
input rst_n;

output [6:0] led7_01;
output [6:0] led7_02;
output [6:0] led7_06;
output [6:0] led7_07;

output [2:0] light_1;
output [2:0] light_2;

wire clk;
wire [6:0] time_dis_1,time_dis_2;

wire [3:0] input_hex1;
wire [3:0] input_hex2;
wire [3:0] input_hex3;
wire [3:0] input_hex4;

clock_generate X01 (.s_clk(s_clk), .rst_n(rst_n), .clk(clk));
traffic_light X02 (.clk(clk), .rst_n(rst_n), .light_1(light_1), .light_2(light_2), .time_dis_1(time_dis_1), .time_dis_2(time_dis_2));

decimal_decode X03 (.factor(time_dis_1),.hex_format_output1(input_hex1),.hex_format_output2(input_hex2));
decimal_decode X04 (.factor(time_dis_2),.hex_format_output1(input_hex3),.hex_format_output2(input_hex4));

led_export X05 (.input_hex(input_hex1),.led7(led7_01));
led_export X06 (.input_hex(input_hex2),.led7(led7_02));
led_export X07 (.input_hex(input_hex3),.led7(led7_06));
led_export X08 (.input_hex(input_hex4),.led7(led7_07));

endmodule

