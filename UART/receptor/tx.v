`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:32 11/07/2015 
// Design Name: 
// Module Name:    tx 
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
module tx
(
	input wire tx_start,
	input wire [7:0]d_in,
	input wire clk,
	input wire baud,
	output reg tx,
	output reg tx_done
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
					tx_done = 1;
					tx = 1;
					if(tx_start == 1)
					begin
						buffer = d_in;
						tx_done = 0;
						s = 0;
						next_state = START;	
					end
					else
						next_state = IDLE;
				end
		START: // se recibe el bit de start
				begin
					if(baud==0)
					begin
						tx = 0;
						if(s==15)
						begin
							s=0;
							n=0;
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
		DATA: 
				begin
					if(baud == 0)
					begin
						tx = buffer[n];
						if(s==15)
						begin
							if(n==7)
							begin
								s=0;
								next_state = WAIT;
								state_after_wait = STOP;
							end
							else
							begin
								n=n+1;
								s=0;
								next_state = WAIT;
								state_after_wait = DATA;
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
					if(baud == 0)
					begin
						tx=1;
						if(s == 15)
						begin
							next_state = IDLE;
							state_after_wait = IDLE;
						end
						else
						begin
							s=s+1;
							next_state = WAIT;
							state_after_wait = STOP;
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

