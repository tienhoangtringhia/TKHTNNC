module file_01 (clk, rst_n, a, b, c);

//parameter
parameter DATA_WIDTH = PARAMETER_WIDTH;

//INSERT PARAMETER

//input
input clk;
input rst_n;
input  [DATA_WIDTH-1:0]a;
input  [DATA_WIDTH-1:0]b;

//output
output [DATA_WIDTH-1:0]c;
reg    [DATA_WIDTH-1:0]c;

//internal signal

wire [DATA_WIDTH-1:0]d;

//Main function

assign d = !(a & b);  //NAND logic

always@(posedge clk or negedge rst_n) begin // D Flip Flop
    if(rst_n == 1'b0) begin
        c <= 3'b000;
    end
    else begin
        c <= d;
    end
end

endmodule

