`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:13:15 10/15/2015 
// Design Name: 
// Module Name:    Tx 
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
module Tx(
	input wire clk,
	input wire [7:0]d_in,
	input wire tx_start,
	output reg tx_done,
	output reg tx
    );

//Declaro los estados que voy a tener.
localparam [2:0] 	UNO 	 = 3'b000,
						DOS  	 = 3'b001,
						TRES 	 = 3'b010,
						CUATRO = 3'b011,
						CINCO	 = 3'b100,
						SEIS 	 = 3'b101,
						SIETE	 = 3'b110;

//Declaro las variables necesarias internas.
reg [3:0] current_state, next_state;
reg [7:0] bus_interno_tx;
reg n;
reg s; 

//Registro de estado, cambio segun el clock (aca va a ir conectado
// el s_tick).
always @(posedge clk)
begin
	current_state <= next_state;
end

//declaro ahora la logica de salida de cada estado
always @*
begin
	case(current_state)
		UNO:
			begin
				tx_done = 1;
			end
		DOS:
			begin 
				bus_interno_tx = d_in;
				tx_done = 0;
				n = 0;
				s = 0;
			end
		TRES:
			begin
				tx = 0;
				s = s + 1;
			end
		CUATRO:
			begin
				tx = bus_interno_tx [n];
				n = n + 1;
				s = 0;
			end	
		CINCO:
			begin
				s = s + 1;
			end
		SEIS:
			begin
				tx = 1;
				s = 0;
			end 	
		SIETE:
			begin
				s = s + 1;
			end
		default:
			begin
				tx_done = 0;
			end
	endcase
end


//Logica para el cambio de estado.
always @*
begin
	next_state = UNO;
	
	case (current_state)
		UNO:
			if (tx_start == 1)
				next_state = DOS;
			else
				next_state = UNO;
		DOS: 
				next_state = TRES;
		TRES:
			if (s == 15)
				next_state = CUATRO;
			else 
				next_state = TRES;
		CUATRO:
			if (n < 8)
				next_state = CINCO;
			else 
				next_state = SEIS;
		CINCO:
			if	(s == 15)
				next_state = CUATRO;
			else
				next_state = CINCO;
		SEIS:
				next_state = SIETE;
		SIETE:
			if (s == 15)
				next_state = UNO;
			else 
				next_state = SIETE;
	endcase
end

endmodule
