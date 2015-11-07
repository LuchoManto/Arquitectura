`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:02 11/06/2015 
// Design Name: 
// Module Name:    fifo_de_rx 
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
module fifo_de_rx
(
	input wire [7:0]d_out,
	input wire rx_done,
	input wire rd,
	input wire clk,
	output reg [7:0]r_data,
	output reg rx_empty
);

//Estados
localparam [2:0] START = 2'b00,
					  IDLE = 2'b01,
					  ESPERO = 2'b10;
					  
					  
					  
//Variables internas
reg [2:0] current_state = 3'b00;
reg [2:0] next_state = 3'b00;

reg [7:0] buffer = 1;

reg esperar = 0;

always @(posedge clk)
begin
		current_state <= next_state;
end

		
always @(posedge clk) // always de logica de salida
begin
	case(current_state)
		START: // estado inicial. start
				begin
					rx_empty = 0;
				end
		IDLE: 
				begin
					if(rd==1 && rx_empty==0)
					begin
						r_data = buffer;
						rx_empty = 1;
					end
					else
					begin
						if(rx_empty==1 && rx_done==1)
						begin
							buffer = d_out;
							rx_empty = 0;
							esperar = 1;
						end
					end
				end		
		ESPERO: 
				begin
					if(rx_done == 0)
						esperar = 0;
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
				if(esperar == 1)
					next_state = ESPERO;
				else
					next_state = IDLE;
			end
		ESPERO:
			begin
				if(esperar == 1)
					next_state = ESPERO;
				else
					next_state = IDLE;
			end
	endcase
end //always de logica cambio de estado
	

endmodule