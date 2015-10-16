`timescale 1ns / 1ps
/*
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:46 09/14/2015 
// Design Name: 
// Module Name:    Ejercicio2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
Desarrolle un modelo Verilog de un circuito con "pipeline" que compute 
el valor m�ximo de 3 flujos de entrada, a, b y c. 
El pipeline debe tener 2 etapas:
1)	La primera etapa determina cual es el mayor entre 'a' y 'b' y guarda el valor de 'c'.
2)	La segunda etapa busca el mayor entre 'c' y el resultado de la comparaci�n de 'a' y 'b'.
Las entradas y salidas son de 14 bits con signo, en complemento a 2.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
*/
module Ejercicio2
#(parameter N=14)
(
	input wire signed [N-1:0]a,
	input wire signed [N-1:0]b,
	input wire signed [N-1:0]c,
	output reg signed [N-1:0]result,
	input wire clock
);
	 
	 reg signed [N-1:0]primera_etapa;
	 reg signed [N-1:0]auxiliar_c;
	 
	 always@(posedge clock)
	 begin
		auxiliar_c <= c;
		
		if(a > b)
			primera_etapa <= a;
		else
			primera_etapa <= b;
		
		if(primera_etapa > auxiliar_c)
			result <= primera_etapa;
		else
			result <= auxiliar_c;
	 end

endmodule
