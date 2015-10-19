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
module test(
	input wire [7:0]r_data,
	output reg rd,
	input wire rx_empty,
	
	output reg [7:0]w_data,
	output reg wr,
	input wire tx_full,
	
	input wire [7:0]dato_a_enviar,
	output reg success,
	
	input wire clk
    );
	 
//Estados
localparam [2:0] ESPERA_ENVIAR = 3'b000,
					  ENVIAR = 3'b001,
					  ESPERA_RECIBIR = 3'b010,
					  RECIBIR = 3'b011,
					  FIN = 3'b100;
					  
//Variables internas
reg [2:0] current_state = 3'b000;
reg [2:0] next_state = 3'b000;
reg [7:0] dato_a_recibir = 0;


always @(posedge clk)
begin
		current_state <= next_state;
end

		
always @(posedge clk) // always de logica de salida
begin
	case(current_state)
		ESPERA_ENVIAR: // coloca en 1 la bandera de envio y espera que este disponible el buffer
				begin
				wr = 1;
				end
		ENVIAR: // el dato del buffer de entrada se envia
				begin
					w_data = dato_a_enviar;
					wr = 0;
				end
		ESPERA_RECIBIR: // se coloca en 1 la bandera de recepcion y se espera a que el buffer este disponible
				begin
				rd = 1;
				end
		RECIBIR: // el dato recibido se guarda
				begin
					dato_a_recibir = r_data;
					rd = 0;
				end
		FIN: // se comparan los datos
				begin
				if(dato_a_enviar == dato_a_recibir)
				success = 1;
				else
				success = 0;
				end
	endcase
end//always de logica de salida
	
always @* // logica de cambio de estado
begin
	next_state = ESPERA_ENVIAR;
	case(current_state)
		ESPERA_ENVIAR:
			begin
				if(tx_full == 0)
					next_state = ENVIAR;
				else
					next_state = ESPERA_ENVIAR;
			end
		ENVIAR:
			begin
					next_state = ESPERA_RECIBIR;
			end
		ESPERA_RECIBIR:
			begin
			if (rx_empty == 0)
				next_state = RECIBIR;
			else
				next_state = ESPERA_RECIBIR;
		end
		RECIBIR:
			begin
				next_state = FIN;
			end
		FIN:
			begin
				next_state = FIN;
			end
	endcase
end //always de logica cambio de estado
	


endmodule
