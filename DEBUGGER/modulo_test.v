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
localparam [2:0] START = 4'b0000,
					  IDLE = 4'b0001,
					  RECIBO = 4'b0010,
					  PASO	= 4'b0011,
					  CONTINUO = 4'b0100,
					  ENVIAR = 4'b0101,
					  ESPERO = 4'b0110;
					  
					  
					  
//Variables internas
reg [7:0] buffer = 1;
reg [3:0] current_state = 4'b0000;
reg [3:0] next_state = 4'b0000;

//Variables para el pipe.
reg inicio = 0; //variable que reinicia todo el pipe a 0.
reg activo = 0; //Variable que habilita los clk del pipe.
reg [2:0]s = 0;
reg [7:0]indice = 0; //variable utilizada para enviar el buffer
reg [7:0]bytes = 148; //cantidad de bytes a enviar en buffer envio
reg [1183:0]buffer_envio = 0;

//Cables para el pipe
wire [8:0]PCF;


Pipe pipeline
(
	.clk(clk),
	.inicio(inicio),
	.activo(activo),
	.PCF(PCF)
);



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
				//Inicializo el pipe
				inicio = 1;
				activo = 1;
				if(s == 3)
				begin
					s = 0;
					next_state = IDLE;
				end
				else
				begin
					s = s+1;
					next_state = START;
				end
			end
		IDLE: // estado inicial. Idle
				begin
					activo = 0;
					inicio = 0;
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
						buffer = r_data;
						rd = 0;
						/*
							si buffer es p voy a paso
							si buffer es c voy a cont
						*/
						next_state = CONTINUO;
					end
					else
					begin
						next_state = RECIBO;
					end
				end
		CONTINUO:
				begin
					activo = 1;
					indice = 0;
					if(finalW == 1)
					begin
						next_state = ENVIAR;
					end
					else
					begin
						next_state = CONTINUO;
					end
				end
		ENVIAR:
				begin
					indice = indice+1;
					w_data = buffer_envio[(indice*8)-1:(indice*8)-8];
					wr = 1;
					next_state = ESPERO;
				end
		ESPERO: 
				begin
					if(tx_full == 1)
					begin
						wr = 0;
						if(indice == bytes)
						begin
							next_state = IDLE;
						end
						else
						begin
							next_state = ENVIAR;
						end
					end
					else
					begin
						next_state = ESPERO;
					end
				end
	endcase
end//always de logica de salida
	


endmodule



