`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:00 11/06/2015 
// Design Name: 
// Module Name:    rx 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module rx
(
	input wire senial,
	input wire clk,
	input wire baud,
	output reg [7:0]d_out,
	output reg rx_done
);
		
//Estados
localparam [3:0] IDLE = 3'b000,
					  START = 3'b001,
					  DATA = 3'b010,
					  STOP = 3'b011,
					  WAIT = 3'b111;
					  
					  
					  
//Variables internas
reg [3:0] current_state = 3'b000;
reg [3:0] next_state = 3'b000;
reg [3:0] state_after_wait = 3'b000;
reg [3:0] n = 0;
reg [3:0] s = 0;
reg [7:0] buffer = 1;

always @(posedge clk)
begin
	current_state <= next_state;
end
		
always @(posedge clk) // always de logica de salida
begin
	//d_out = buffer;
	//current_state = next_state;
	case(current_state)
		IDLE: // estado inicial. Idle
				begin
					rx_done = 0;
					s = 0;
					n = 0;
					if(senial == 0)
						next_state = START;
					else
						next_state = IDLE;
				end
		START: // se recibe el bit de start
				begin
					if(baud==0)
					begin
						if(s==7)
						begin
							s=0;
							n=1;
							next_state = WAIT;
							state_after_wait = DATA;
						end
						else
						begin
							s = s+1;
							next_state = WAIT;
							state_after_wait = START;
						end
					end
				end	
		DATA: // se espera incrementando s
				begin
					if(baud == 0)
					begin
						if(s==15)
						begin
							s=0;
							buffer[n-1]=senial;
							if(n<9)
							begin
								n = n+1;
							end
							else
							begin
								d_out = buffer;
								rx_done=1;
								next_state = WAIT;
								state_after_wait = STOP;
							end
						end
						else
						begin
							s = s+1;
							next_state = WAIT;
							state_after_wait = DATA;
						end
					end
				end
		STOP: // se guarda el dato en el buffer
				begin
					if(senial == 0)
					begin
						next_state = START;
						rx_done = 0;
						s = 0;
						n = 0;
					end
					else
					begin
						if(baud == 0)
						begin
							s=s+1;
							if(s == 15)
							begin
								next_state = IDLE;
								state_after_wait = IDLE;
							end
							else
							begin
								next_state = WAIT;
								state_after_wait = STOP;
							end
						end
					end
				end
		WAIT:
			begin
				if(baud==0)
				begin
					next_state = WAIT;
				end
				else
				begin
					next_state = state_after_wait;
				end
			end
	endcase
end//always de logica de salida
	

endmodule
