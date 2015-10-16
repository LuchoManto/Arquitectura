`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:24 09/28/2015 
// Design Name: 
// Module Name:    eprom 
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
module eprom(
	input wire i_ready,
	input wire i_read_write,
	
	output reg o_OE,
	output reg o_WE,
	
	input wire clock
);


//Declaración de estados
localparam [2:0] INICIAL = 3'b000,
					  LISTO = 3'b001,
					  ESCRITURA = 3'b010,
					  LECTURA = 3'b011;

//Declaración de señales (las utilizare para el elemento de memoria por lo tanto son tipo REGISTRO)
reg[2:0] current_state, next_state;

//Registro de estado (Memoria)
always @(negedge clk, negedge reset)
	
	if(~reset)
		current_state <= INICIAL;
	else
		current_state <= next_state;

//Logica de salida
always @*
	begin
		case(current_state)
			INICIAL:
					begin
						o_WE = 3'b100; 
						o_OE = 3'b100;   
					end
			LISTO:
					begin
						o_WE = 3'b010; 
						o_OE = 3'b010; 
					end
			ESCRITURA:
					begin
						o_WE = 3'b001; 
						o_OE = 3'b001; 
					end
			LECTURA:
					begin
						o_WE = 3'b000; 
						o_OE = 3'b000;
					end
			default:
					begin
						o_WE = 3'b111; 
						o_OE = 3'b111; 
					end
		endcase
	end//always de logica de salida

//Logica de cambio de estado
always @*
	begin
		case(current_state)
			INICIAL:
				begin
					if(ready)
						next_state = LISTO;
				end
			LISTO:
				begin
					if(~read_write)
						next_state = ESCRITURA;
					else
						next_state = LECTURA ;
				end
			ROJO:
				begin
					if(~on_off)
						next_state = OFF_A;
					else
						next_state = VERDE;
				end
			OFF_A:
				begin
					if(~on_off)
						next_state = ONALL;
					else
						next_state = VERDE;
				end
			ONALL:
				begin
					if(~on_off)
						next_state = OFF_A;
					else
						next_state = VERDE;
				end
			default:
					begin
						next_state = ON_ALL; //En caso de un estado invalido, el semaforo pasa a la secuencia de alternar luces
					end
		endcase
	end //always de logica cambio de estado
endmodule //fin del modulo
							
