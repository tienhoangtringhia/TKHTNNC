//===== File name: example1_and_gate.v
//===== Version: 1.0
//===== Update Notes: First Version

module example1_and_gate (system_clock, system_rst_n, first_data_in, second_data_in, data_out_and_gate);

//parameter define
parameter DATA_WIDTH = 8;

//input define
input system_clock;
input system_rst_n;
input [DATA_WIDTH-1:0] first_data_in;
input [DATA_WIDTH-1:0] second_data_in;

//output define
output [DATA_WIDTH-1:0] data_out_and_gate;
reg [DATA_WIDTH-1:0] data_out_and_gate;

//internal wire/reg define
wire [DATA_WIDTH-1:0] pre_data_out_and_gate;

//Main functions define
//1.1 Combination logic (and gate)is inplemented by "assign" prototype
assign pre_data_out_and_gate = first_data_in & second_data_in;

//1.3 Sequency logic is inplemented
// system_clock and system_rst_n are events
// system_rst_n is asynchronous and active at falling edged of system_rst_n
always@(posedge system_clock or negedge system_rst_n) begin
    if(system_rst_n==1'b0) begin
       data_out_and_gate <= 0;
    end
    else begin
       data_out_and_gate <= pre_data_out_and_gate;
    end
end

endmodule       
