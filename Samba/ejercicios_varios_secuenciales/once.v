`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:51:55 09/14/2015 
// Design Name: 
// Module Name:    once 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
/*
11.	Diseñe un circuito en Verilog que sea capaz de contar el periodo de una señal 
externa periódica y de onda cuadrada,  con una resolución de 8 bits y mostrarlo en 
los 8 Leds de usuarios disponibles en la placa BASYS 2. 
NOTA: Para realizar este ejercicio deberá utilizar un generador de señales.

*/
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module once
	# (parameter N_BITS = 8)
	(
	input i_cuadrada, clk, reset,
	output reg o_leds
    );

	reg [N_BITS-1:0] contador;
	reg valor_anterior; //para almacenar un flanco
	
	always @ (posedge clk)
	begin
		valor_anterior <= i_cuadrada;
		
		if (reset)
			contador <= 0;
		else
		begin
			if (valor_anterior == 0 &&  i_cuadrada == 1)
				begin
					o_leds <= contador;
					contador <= 0;
				end
			else
				contador <= contador +1;
		end
	end
endmodule
