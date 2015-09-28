`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:06:32 05/29/2013 
// Design Name: 
// Module Name:    semaforo 
// Project Name: Practicos Arquitectura de computadoras
// Target Devices: SPARTAN 3E
// Tool versions: 
// Description: ejemplo FSM - Semaforo:
// El semáforo que haremos tiene dos comportamientos diferentes, dependiendo del valor de una entrada externa on_off.
// Si on_off está en bajo: el semáforo está fuera de servicio y se mostrará un patrón que alternara entre todas las luces apagadas 
//	y todas encendidas; si está en alto: inicia con la luz verde, luego de un tiempo pasa a la amarilla y finalmente a la roja, 
//	reiniciando el ciclo hasta que la entrada on_off vuelva a estar en bajo.
//
// Dependencies: Ninguna
//
// Revision: 1.0
//
// Additional Comments: ---
 
// Author: Renzo Bechler
//
//////////////////////////////////////////////////////////////////////////////////

//ES UNA MAQUINA DE ESTADO DE MOORE.


module semaforo(
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
	
	if(~reset)
		current_state <= VERDE;
	else
		current_state <= next_state; //cada vez que viene un clock salta a un siguiente estado. Que le da bola al 
											  // always que se hace para las transiciones.
		

//Logica de salida
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
//PARA OPTIMIZARLO LO QUE PUEDO HACER ES METER EL ALWAYS ANTERIOR DENTRO DE ESTE ALWAYS.
always @*
	begin
		//SI PONGO EL DEFAULT DEL CASE FUERA DEL CASE, ME EVITO TODA LA LOGICA DEL CASE SI NO TOMA NINGUN CASO
		//DEL CASE. ASI SE OPTIMIZA UNA BOCHA EL CODIGO DEL CASE. 
		//next_state = ON_ALL; //En caso de un estado invalido, el semaforo pasa a la secuencia de alternar luces
		case(current_state)
			VERDE:
			//sel_luz = 3b'100; ES UN EJEMPLO DE COMO OPTIMIZAR EL CODIGO.
				begin
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
						next_state = ON_ALL; //En caso de un estado invalido, el semaforo pasa a la secuencia de alternar luces
					end
		endcase
	end //always de logica cambio de estado
endmodule //fin del modulo