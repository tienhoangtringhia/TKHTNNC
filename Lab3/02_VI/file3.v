module clock_generate (s_clk, rst_n, clk);

parameter HALF_SECOND = 24999999;

input s_clk;
input rst_n;

output clk;
wire clk;

reg pre_clk;
reg update_en;
reg[25:0] counter;

always@(posedge s_clk or negedge rst_n) begin
   if(!rst_n)begin
      counter<=0;
   end
   else if(update_en==1)begin
      counter<=0;
   end
   else begin 
       counter<=counter+1;
   end
end

always@(posedge s_clk or negedge rst_n) begin
   if(!rst_n)begin
      pre_clk<=0;
      update_en<=0;
   end
   else if(counter== HALF_SECOND)begin
      pre_clk<=!pre_clk;
      update_en<=1;
   end
   else begin
      update_en<=0;
   end
end

assign clk=pre_clk;
endmodule 

