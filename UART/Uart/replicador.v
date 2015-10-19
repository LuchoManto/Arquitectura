`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:29:18 10/19/2015 
// Design Name: 
// Module Name:    test 
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
module replicador(
	input wire [7:0]r_data,
	output reg rd,
	input wire rx_empty,
	
	output reg [7:0]w_data,
	output reg wr,
	input wire tx_full,
	
	input wire clk
    );
	 
//Estados
localparam [1:0] ESPERA = 2'b00,
					  PIDE_DATO = 2'b01,
					  PIDE_ENVIO = 2'b10,
					  ENVIAR = 2'b11;
					  
//Variables internas
reg [2:0] current_state = 3'b000;
reg [2:0] next_state = 3'b000;
reg [7:0] buffer = 0;


always @(posedge clk)
begin
		current_state <= next_state;
end

		
always @(posedge clk) // always de logica de salida
begin
	case(current_state)
		ESPERA: // estado inicial. Idle
				begin
					rd = 1;
				end
		PIDE_DATO: // se recibe el bit de start
				begin
					buffer = r_data;
					rd = 0;
				end
		PIDE_ENVIO: // se espera incrementando s
				begin
					wr = 1;
				end
		ENVIAR: // se guarda el dato en el buffer
				begin
					w_data = buffer;
					wr = 0;
				end
	endcase
end//always de logica de salida
	
always @* // logica de cambio de estado
begin
	next_state = ESPERA;
	case(current_state)
		ESPERA:
			begin
				if(rx_empty == 0)
					next_state = PIDE_DATO;
				else
					next_state = ESPERA;
			end
		PIDE_DATO:
			begin
					next_state = PIDE_ENVIO;
			end
		PIDE_ENVIO:
			begin
			if (tx_full == 0)
				next_state = ENVIAR;
			else
				next_state = PIDE_ENVIO;
		end
		ENVIAR:
			begin
				next_state = ESPERA;
			end
	endcase
end //always de logica cambio de estado
	


endmodule
