`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:14:15 10/15/2015 
// Design Name: 
// Module Name:    Ejemplo 
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
module Ejemplo(
    input clk,
    input reset,
    input on_off,
    output reg [2:0] sel_luz
    );


//Declaración de estados
localparam [2:0] VERDE = 3'b000,
					  AMARILLO = 3'b001,
					  ROJO = 3'b010,
					  OFF_A = 3'b011,
					  ONALL = 3'b100;
						 
//Declaración de señales (las utilizare para el elemento de memoria por lo tanto son tipo REGISTRO)
reg[2:0] current_state, next_state;
						
						
//Registro de estado (Memoria)
always @(negedge clk, negedge reset)
begin
	//Si se resetea se pone verde.
	if(~reset)
		current_state <= VERDE;
	//Cada vez que viene un clock se actualiza el estado al proximo.
	else
		current_state <= next_state;
end

//Logica de salida
//Maquina de estado de moore solo depende del estado en el que me encuentro.
//si fuera de mealy tendria en cuenta las entradas.
//El  always * entra cada vez que cambian las senales que tengo adentro del bloque always, en este caso
//solo entra cuando cambia current_state
always @*
	begin
		case(current_state)
			VERDE:
					begin
						sel_luz = 3'b100; //Luz verde  
					end
			AMARILLO:
					begin
						sel_luz = 3'b010; //Luz amarilla
					end
			ROJO:
					begin
						sel_luz = 3'b001; //Luz roja
					end
			OFF_A:
					begin
						sel_luz = 3'b000; //Todas las luces apagadas
					end
			ONALL:
					begin
						sel_luz = 3'b111; //Todas las luces encendidas
					end
			default:
					begin
						sel_luz = 3'b111; //En caso de un estado invalido, el semaforo pasara a Todas las luces encendidas
					end
		endcase
	end//always de logica de salida
	

//Logica de cambio de estado
always @*
	begin
		//Puedo poner el estado por default al principio para evitar toda lea logica del estado default
		//Si ingresa a un case correcto se sobreescribe y no hay problema. Evitando la necesidad
		//de tener definido el default.
		next_state = ONALL; //En caso de un estado invalido, el semaforo pasa a la secuencia de alternar luces
		case(current_state)
			VERDE:
				begin
					//Como son combinacionales puedo poner aca lo del always anterior
					//para optimizar mas.
					sel_luz = 3'b100;
					if(~on_off)
						next_state = OFF_A;
					else
						next_state = AMARILLO;
				end
			AMARILLO:
				begin
					if(~on_off)
						next_state = ONALL;
					else
						next_state = ROJO;
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
						next_state = ONALL; //En caso de un estado invalido, el semaforo pasa a la secuencia de alternar luces
					end
		endcase
	end //always de logica cambio de estado
endmodule //fin del modulo
