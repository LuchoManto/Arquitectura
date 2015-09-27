`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:42:48 09/14/2015 
// Design Name: 
// Module Name:    ejercicio_2 
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

//2.	Desarrolle un modelo Verilog de un circuito con “pipeline” que compute el valor máximo de 3 flujos de entrada, a, b y c.
// El pipeline debe tener 2 etapas:
//•	La primera etapa determina cual es el mayor entre ‘a’ y ‘b’ y guarda el valor de ‘c’.
//•	La segunda etapa busca el mayor entre ‘c’ y el resultado de la comparación de ‘a’ y ‘b’.
//Las entradas y salidas son de 14 bits con signo, en complemento a 2.

//
//////////////////////////////////////////////////////////////////////////////////
module ejercicio_2(
	input wire signed [13:0]i_a,
	input wire signed [13:0]i_b,
	input wire signed [13:0]i_c,
	output reg [13:0]result,
	
	input wire clock
    );
	 
	// reg [13:0]s_a;
//	 reg [13:0]s_b;
	// reg [13:0]s_c;
	 reg [13:0]s_aux;
	 reg [13:0]s_c;
	 
	 always@(posedge clock) // primera etapa
	 begin
	 if(i_a > i_b)
	 s_aux <= i_a;
	 else
	 s_aux <= i_b;
	 
	 s_c <= i_c;
	 end
	 
	 always@(posedge clock) // primera etapa
	 begin
	 if(s_aux > s_c)
	 result <= s_aux;
	 else
	 result <= s_c;
	 end


endmodule
