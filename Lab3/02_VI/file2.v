//===== File : t_example1_and_gate.v
//===== Version: 1.0
//===== Update Note: First version


module t_example1_and_gate;

//parameter define
parameter DATA_WIDTH = 8;

//input define
reg t_system_clock;
reg t_system_rst_n;
reg [DATA_WIDTH-1:0] t_second_data_in;
reg [DATA_WIDTH-1:0] t_first_data_in;

//output define
wire [DATA_WIDTH-1:0] t_data_out_and_gate;

//clock define
always begin
   t_system_clock=1'b0;
  #50;
   t_system_clock=1'b1;
  #50;
end

//instance define
example1_and_gate example1_and_gate_01( .system_clock(t_system_clock)
                     ,.system_rst_n(t_system_rst_n)
                     ,.first_data_in(t_first_data_in)
                     ,.second_data_in(t_second_data_in)
                     ,.data_out_and_gate(t_data_out_and_gate)
                     );
//display the output
initial begin
    $monitor("time=%d, system_clock=%b, system_rst_n=%b, t_first_data_in:%b, t_second_data_in:%b, data_out_and_gate=%b \n",
       $stime, t_system_clock, t_system_rst_n, t_first_data_in, t_second_data_in, t_data_out_and_gate);
end

//Declare Testcases
initial begin
#1  t_system_rst_n = 0;
#10  t_system_rst_n = 1;
#10  t_first_data_in = 8'b1101_0101;
     t_second_data_in = 8'b1010_1010;
#100 $finish;
end

initial begin
   $vcdplusfile("example1_and_gate.vpd");
   $vcdpluson();
end

endmodule                 
