`timescale 1ns / 1ps
/*
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:41 10/15/2015 
// Design Name: 
// Module Name:    UARTFIFORX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
	FIFO UART, parameter DB databits of UART,
	parameter size, cantidad de buffers en FIFO. 
	
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
*/

module fifo_receiver
#(
	parameter DB=8
)
(
	input wire [DB-1:0] d_out,
	input wire rx_done,
	input wire rd,
	output reg [DB-1:0] r_data,
	output reg rx_empty,
	input wire clk
);

//Declaro estados
localparam [3:0] ENVIO_A_CPU = 3'b000,
					  ESPERO_A_CPU = 3'b001,
					  RECIBO_DE_RX = 3'b010,
					  ESPERO_A_RX = 3'b011,
					  IDLE = 3'b100;
					  
//Declaracion de senales (las utilizare para el elemento de memoria por lo tanto son tipo REGISTRO)
reg[3:0] current_state=3'b100;
reg[3:0] next_state=3'b100;					  

				  				
//Stack FIFO.
reg [DB-1:0] stack=0;

//Init los reg output para evitar que esten en x.
initial 
begin
r_data = 0;
rx_empty = 1;
end


//Registro de estado (Memoria)
always @(posedge clk)
begin
	//Cada vez que viene un clock se actualiza el estado al proximo.
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
			ENVIO_A_CPU:
				begin
					r_data=stack;
					rx_empty=1;
				end
			RECIBO_DE_RX:
				begin
					stack=d_out;
					rx_empty=0;
				end
		 endcase
	end//always de logica de salida

//Logica de cambio de estado
always @*
	begin
		//Puedo poner el estado por default al principio para evitar toda lea logica del estado default
		//Si ingresa a un case correcto se sobreescribe y no hay problema. Evitando la necesidad
		//de tener definido el default.
		next_state = IDLE; //En caso de un estado invalido
		case(current_state)
			ENVIO_A_CPU:
				begin
					next_state=ESPERO_A_CPU;
				end
			ESPERO_A_CPU:
				begin
					if(rd==1)
					begin
						next_state=ESPERO_A_CPU;
					end
					else
					begin
						next_state=IDLE;
					end
				end
			RECIBO_DE_RX:
				begin
					next_state=ESPERO_A_RX;
				end
			ESPERO_A_RX:
				begin
					if(rx_done==1)
					begin
						next_state=ESPERO_A_RX;
					end
					else
					begin
						next_state=IDLE;
					end
				end
			IDLE:
				begin
					if(rd==1 && rx_empty==0)
					begin
						next_state=ENVIO_A_CPU;
					end
					else
					begin
						if(rx_done==1)
						begin
							next_state=RECIBO_DE_RX;
						end
						else
						begin
							next_state=IDLE;
						end
					end
				end
		endcase
	end //always de logica cambio de estado

endmodule
