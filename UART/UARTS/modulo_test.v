`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:31 11/06/2015 
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
localparam [2:0] IDLE = 2'b00,
					  RECIBO = 2'b01,
					  ESPERO = 2'b10;
					  
					  
					  
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
		IDLE: // estado inicial. Idle
				begin
					if(rx_empty == 0)
						rd=1;
					else
						rd=0;
				end
		RECIBO: 
				begin
				w_data = r_data;
				/*
					if(rx_empty==1)
					begin
						w_data = r_data;
						//wr = 1;
						//rd = 0;
					end
					*/
				end
		ESPERO: 
				begin
					if(tx_full == 1)
						wr = 0;
				end
	endcase
end//always de logica de salida
	
always @*
begin
	next_state = IDLE;
	case(current_state)
		IDLE:
			begin
				if(rd == 1)
					next_state = RECIBO;
				else
					next_state = IDLE;
			end
		RECIBO:
			begin
				next_state = IDLE;
				/*
				if(wr==1)
					next_state = ESPERO;
					*/
			end
		ESPERO:
			begin
				if(wr == 0)
					next_state = IDLE;
			end
	endcase
end //always de logica cambio de estado
	

endmodule
