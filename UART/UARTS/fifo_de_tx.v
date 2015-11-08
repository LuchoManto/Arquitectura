`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:11 11/07/2015 
// Design Name: 
// Module Name:    fifo_de_tx 
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
module fifo_de_tx
(
	input wire [7:0]w_data,
	input wire wr,
	input wire tx_done,
	input wire clk,
	output reg tx_full,
	output reg tx_start,
	output reg [7:0]d_in
);

//Estados
localparam [2:0] START = 2'b00,
					  IDLE = 2'b01,
					  ENVIO = 2'b10,
					  ESPERO = 2'b11;
					  
					  
					  
//Variables internas
reg [2:0] current_state = 3'b00;
reg [2:0] next_state = 3'b00;

reg [7:0] buffer = 1;


always @(posedge clk)
begin
		current_state <= next_state;
end

		
always @(posedge clk) // always de logica de salida
begin
	case(current_state)
		START: // estado inicial. start
				begin
					tx_start = 0;
					d_in = 1;
					tx_full = 0;
				end
		IDLE: 
				begin
					if(wr==1)
					begin
						buffer = w_data;
						tx_full = 1;
					end
				end		
		ENVIO: 
				begin
					if(tx_done == 1)
					begin
						d_in = buffer;
						tx_start = 1;
						tx_full = 0;
					end
				end
		ESPERO:
			begin
				if(tx_done == 0)
				begin
					tx_start=0;
				end
			end
	endcase
end//always de logica de salida
	
always @*
begin
	next_state = IDLE;
	case(current_state)
	   START:
			begin
				next_state = IDLE;
			end
		IDLE:
			begin
				if(tx_full == 1)
					next_state = ENVIO;
				else
					next_state = IDLE;
			end
		ENVIO:
			begin
				if(tx_full == 0)
					next_state = ESPERO;
				else
					next_state = ENVIO;
			end
		ESPERO:
			begin
				if(tx_start == 0)
				begin
					next_state = IDLE;
				end
				else
				begin
					next_state = ESPERO;
				end
			end
	endcase
end //always de logica cambio de estado
	

endmodule