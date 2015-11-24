`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:24 11/07/2015 
// Design Name: 
// Module Name:    modulo_test 
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
module modulo_test
(
	input wire [7:0]r_data,
	input wire clk,
	input wire rx_empty,
	input wire tx_full,
	output reg [7:0]w_data,
	output reg rd,
	output reg wr
);
		
//Estados
localparam [2:0] START = 2'b00,
					  IDLE = 2'b01,
					  RECIBO = 2'b10,
					  ESPERO = 2'b11;
					  
					  
					  
//Variables internas
reg [7:0] buffer = 1;
reg [2:0] current_state = 3'b00;
reg [2:0] next_state = 3'b00;


always @(posedge clk)
begin
		current_state <= next_state;
end

		
always @(posedge clk) // always de logica de salida
begin
	case(current_state)
		START:
			begin
				w_data=buffer;
				rd = 0;
				wr = 0;
				next_state = IDLE;
			end
		IDLE: // estado inicial. Idle
				begin
					if(rx_empty == 0)
					begin
						rd=1;
						next_state = RECIBO;
					end
					else
					begin
						rd=0;
						next_state = IDLE;
					end
				end
		RECIBO: 
				begin
					//Espero que rx empty vuelva a 1
					if(rx_empty == 1)
					begin
						if(tx_full==0)
						begin
							w_data = r_data;
							wr = 1;
							rd = 0;
							next_state = ESPERO;
						end
						else
						begin
							next_state = RECIBO;
						end
					end
				end
		ESPERO: 
				begin
					if(tx_full == 1)
					begin
						wr = 0;
						next_state = IDLE;
					end
					else
					begin
						next_state = ESPERO;
					end
				end
	endcase
end//always de logica de salida
	


endmodule



