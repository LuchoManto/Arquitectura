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
    input ready,
	 input rw,
    output reg [2:0] sel_luz
    );


//Declaración de estados
localparam [1:0] IDLE = 2'b00,
					  DECISION = 2'b01,
					  READ = 2'b10,
					  WRITE = 2'b11;
						 
//Declaración de señales (las utilizare para el elemento de memoria por lo tanto son tipo REGISTRO)
reg[2:0] current_state, next_state;
						
						
//Registro de estado (Memoria)
always @(negedge clk)
	
	if(ready)
		current_state <= next_state;
	else
		current_state <= current_state; //cada vez que viene un clock salta a un siguiente estado. Que le da bola al 
											  // always que se hace para las transiciones.
		

//Logica de salida
always @*
	begin
		case(current_state)
			IDLE:
					begin
						sel_luz = 2'b00; //Luz verde  
					end
			DECISION:
					begin
						sel_luz = 2'b01; //Luz amarilla
					end
			WRITE:
					begin
						sel_luz = 2'b10; //Luz roja
					end
			READ:
					begin
						sel_luz = 2'b11; //Todas las luces apagadas
					end
			default:
					begin
						sel_luz = 3'b00; //En caso de un estado invalido, el semaforo pasara a Todas las luces encendidas
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
			IDLE:
			//sel_luz = 3b'100; ES UN EJEMPLO DE COMO OPTIMIZAR EL CODIGO.
				begin
					if(ready)
						next_state = DECISION;
					else
						next_state = IDLE;
				end
			DECISION:
				begin
					if(rw)
						next_state = READ;
					else
						next_state = WRITE;
				end
			READ:
				begin
					if(ready)
						next_state = IDLE;
					else
						next_state = WRITE;
				end
			WRITE:
				begin
					if(ready)
						next_state = IDLE;
					else
						next_state = WRITE;
				end
			default:
					begin
						next_state = IDLE; //En caso de un estado invalido, el semaforo pasa a la secuencia de alternar luces
					end
		endcase
	end //always de logica cambio de estado
endmodule //fin del modulo