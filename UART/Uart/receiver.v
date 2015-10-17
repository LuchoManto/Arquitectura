`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:51 10/15/2015 
// Design Name: 
// Module Name:    receiver 
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
module receiver(
		input wire rx,
		input wire clk,
		output reg [7:0]d_out,
		output reg rx_done
    );
		
	localparam [2:0] E0 = 3'b000,
						  E1 = 3'b001,
						  E2 = 3'b010,
						  E3 = 3'b011,
						  E4 = 3'b100,
						  E5 = 3'b101,
						  E6 = 3'b110,
						  E7 = 3'b111;
	
reg [2:0]current_state, next_state;
reg [4:0]n;
reg [4:0]s;
reg [7:0]buffer;

always @(posedge clk)
		current_state <= next_state;
		
begin
		
always @(posedge clk) // always de logica de salida
	begin
		case(current_state)
			E0: // estado inicial. Idle
					begin
						rx_done = 0;
						s = 0;
						n = 0;
					end
			E1: // se recibe el bit de start
					begin
						s = s + 1;
					end
			E2: // se recibe cada dato
					begin
						s = 0;
					end
			E3: // se incrementa s
					begin
						s = s + 1; 
					end
			E4: // se guarda el dato en el buffer
					begin
						buffer[n] = rx;
						n = n + 1;
						s = 1;
					end
			E5: // se envia el buffer
					begin
						s = 0;
						rx_done = 1;
						d_out = buffer;
					end
			E6: // bit de stop
					begin
						s = s + 1;
					end
					
			default: // default = idle
					begin
						rx_done = 0;
						s = 0;
						n = 0;
					end
		endcase
	end//always de logica de salida
	
always @*
	begin
		//SI PONGO EL DEFAULT DEL CASE FUERA DEL CASE, ME EVITO TODA LA LOGICA DEL CASE SI NO TOMA NINGUN CASO
		//DEL CASE. ASI SE OPTIMIZA UNA BOCHA EL CODIGO DEL CASE. 
		//next_state = ON_ALL; //En caso de un estado invalido, el semaforo pasa a la secuencia de alternar luces
		case(current_state)
			E0:
			//sel_luz = 3b'100; ES UN EJEMPLO DE COMO OPTIMIZAR EL CODIGO.
				begin
					if(rx == 0)
						next_state = E1;
					else
						next_state = E0;
				end
			E1:
				begin
					if(s == 7)
						next_state = E2;
					else
						next_state = E1;
				end
			E2:
				begin 
						next_state = E3;
				end
			E3:
				begin
					if(s == 14)
						next_state = E4;
					else
						next_state = E3;
				end
			E4:
				begin
					if(n == 7)
						next_state = E5;
					else
						next_state = E3;
				end
			E5:
				begin
						next_state = E6;
				end
			E6:
				begin
					if(s == 14)
						next_state = E1;
					else
						next_state = E6;
				end
			default:
					begin
						next_state = E0; //En caso de un estado invalido, el semaforo pasa a la secuencia de alternar luces
					end
		endcase
	end //always de logica cambio de estado
	
	end


endmodule
