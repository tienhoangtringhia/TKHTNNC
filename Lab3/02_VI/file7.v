module traffic_light(clk, rst_n, light_1, light_2, time_dis_1, time_dis_2); //input first
parameter TIMEDIS = 7;    

parameter INI = 0;
parameter D_X = 1;
parameter D_V = 2;
parameter X_D = 3;
parameter V_D = 4;

input clk;
input rst_n;

output [2:0] light_1; // light[0]:Red; light[1]:Yeallow; light[2]:Green
output [2:0] light_2; // light[0]:Red; light[1]:Yeallow; light[2]:Green
output [TIMEDIS-1:0] time_dis_1;
output [TIMEDIS-1:0] time_dis_2;

reg [2:0] light_1; // light[0]:Red; light[1]:Yeallow; light[2]:Gree
reg [2:0] light_2; // light[0]:Red; light[1]:Yeallow; light[2]:Green
reg [TIMEDIS-1:0] time_dis_1;
reg [TIMEDIS-1:0] time_dis_2;

reg [2:0] next_state;
wire [2:0] state;

reg [7:0] counter;
reg [7:0] next_counter;
reg [7:0] pre_next_counter;
reg state_ena;

//Main Function
//1. State machine
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        next_state <= INI;
        nect_counter <= 0;
    end
    else if(state==INI) begin
        next_state <= D_X;
        nect_counter <= 35;
    end
    else if (state_ena) begin
        case (state)
            D_X: begin
                next_state <= D_V;
                next_counter <= 3;
            end
            D_V: begin
                next_state <= X_D;
                next_counter <= 35;
            end
            X_D: begin
                next_state <= V_D;
                next_counter <= 3;
            end
            default: begin //V_D
                next_state <= D_X;
                next_counter <= 35;
            end
        endcase
    end  
    else begin
        next_state <= state;
        next_counter <= pre_next_counter;
    end
end
assign state = next_state;
assign pre_next_counter = next_counter;

//For LIGHT
always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        light_1 <= 0;
        light_2 <= 0;
    end
    else if (state==INI) begin // ALL IS OFF
        light_1 <= 3'b000;
        light_2 <= 3'b000;
    end
    else if (state==D_X) begin
        light_1 <= 3'b100;
        light_2 <= 3'b001;
    end
    else if (state==D_V) begin
        light_1 <= 3'b100;
        light_2 <= 3'b010;
    end
    else if (state==X_D) begin
        light_1 <= 3'b001;
        light_2 <= 3'b100;
    end
    else begin //V_D
        light_1 <= 3'b010;
        light_2 <= 3'b100;
    end
end

//For TIME
always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        time_dis_1 <= 0;
        time_dis_2 <= 0;
    end
    else if (state==INI) begin // ALL IS OFF
        time_dis_1 <= 0;
        time_dis_2 <= 0;
    end
    else if (state==D_X) begin
        if(counter==0) begin
            time_dis_1 <= 39;
            time_dis_2 <= 35;
        end
        else begin
            time_dis_1 <= counter+4-1;
            time_dis_2 <= counter-1;
        end
    end
    else if (state==D_V) begin
        if (counter==0)begin
            time_dis_1 <= 3;
            time_dis_2 <= 3;
        end
        else begin
            time_dis_1 <= counter-1;
            time_dis_2 <= counter-1;
        end
    end
    else if (state==X_D) begin
        if (counter==0)begin
            time_dis_1 <= 35;
            time_dis_2 <= 39;
        end
        else begin
            time_dis_1 <= counter-1;
            time_dis_2 <= counter+4-1;
        end
    end
    else begin
        if (counter===0) begin
            time_dis_1 <= 3;
            time_dis_2 <= 3;
        end
        else begin
            time_dis_1 <= counter -1;
            time_dis_2 <= counter -1;
        end
    end
end 

 //2. Counter 
always@(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= 0;
    end
    else begin
        if(counter==0) begin
            counter <= next_counter;
        end
        else begin
            if(counter==2) begin
                state_ena <=1;
            end
            else begin
                state_ena <=0;
            end
        counter <= counter -1;
        end
    end
end   

endmodule


