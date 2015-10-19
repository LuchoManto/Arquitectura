`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:08:04 10/17/2015 
// Design Name: 
// Module Name:    UART_FIFO_TX 
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
module fifo_transmitter
#(
	parameter DB=8
)
(
	input wire [DB-1:0] w_data,
	input wire tx_done,
	input wire wr,
	output reg [DB-1:0] d_in,
	output reg tx_full,
	output reg tx_start,
	input wire clk
);

//Declaro estados
localparam [3:0] IDLE = 3'b000,
					  ENVIO_A_TX = 3'b001,
					  ESPERO_A_TX = 3'b010,
					  RECIBO_DE_CPU = 3'b011,
					  ESPERO_A_CPU = 3'b100;
					  
//Declaracion de senales (las utilizare para el elemento de memoria por lo tanto son tipo REGISTRO)
reg[3:0] current_state=3'b000;
reg[3:0] next_state=3'b000;					  

//Init los reg output para evitar que esten en x.
initial 
begin
d_in = 0;
tx_full = 0;
tx_start = 0;
end
		
		
//Stack FIFO.
reg [DB-1:0] stack=0;
reg stack_empty=1;


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
			ENVIO_A_TX:
				begin
					d_in=stack;
					tx_full=0;
					tx_start=1;
					stack_empty=1;
				end
			RECIBO_DE_CPU:
				begin
					stack=w_data;
					stack_empty=0;
					tx_full=1;
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
			ENVIO_A_TX:
				begin
					if(tx_done==1)
					begin
						next_state=ESPERO_A_TX;
					end
					else
					begin
						next_state=IDLE;
					end
				end
			ESPERO_A_TX:
				begin
					if(tx_done==1)
					begin
						next_state=ESPERO_A_TX;
					end
					else
					begin
						next_state=IDLE;
					end
				end
			RECIBO_DE_CPU:
				begin
					if(wr==1)
					begin
						next_state=ESPERO_A_CPU;
					end
					else
					begin
						next_state=IDLE;
					end
				end
			ESPERO_A_CPU:
				begin
					if(wr==1)
					begin
						next_state=ESPERO_A_CPU;
					end
					else
					begin
						next_state=IDLE;
					end
				end
			IDLE:
				begin
					if(stack_empty==0 && tx_done==1)
					begin
						next_state=ENVIO_A_TX;
					end
					else
					begin
						if(wr==1 && tx_full==0)
						begin
							next_state=RECIBO_DE_CPU;
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
