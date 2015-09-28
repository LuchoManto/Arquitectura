`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:54:17 09/07/2015 
// Design Name: 
// Module Name:    dos 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
/*
2.	Desarrolle un modelo Verilog de un circuito con "pipeline" que compute el valor máximo de 3 flujos 
de entrada, a, b y c. El pipeline debe tener 2 etapas:

•	La primera etapa determina cual es el mayor entre 'a' y 'b' y guarda el valor de 'c'.
•	La segunda etapa busca el mayor entre 'c' y el resultado de la comparación de 'a' y 'b'.

Las entradas y salidas son de 14 bits con signo, en complemento a 2.

PIPELINE: LA SALIDA DE UN REGISTRO SE LA PONES A OTRO

*/
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dos(
	input signed [13:0] i_a, 
	input signed [13:0] i_b,
	input signed [13:0] i_c,
	input clk,
	output reg signed [13:0] o_dato
    );
	
	reg signed [13:0] intermedio;
	
	//Primera etapa
	reg signed [13:0] c_reg;
	
	/*
	wire  signed [13:0] resultado_ab;
	wire  signed [13:0] resultado_c;
	
	assign resultado_ab=(i_a>i_b)?  i_a : i_b;
	assign resultado_c=(intermedio>c_reg)?  intermedio : c_reg;
	
	always @ (posedge clk)
	begin
		intermedio<=resultado_ab;
		c_reg<=i_c;
		o_dato<=resultado_c;
	end
	
	*/
	
	always @ (posedge clk)
	begin
		if (i_a > i_b)
			intermedio <= i_a;
		else
			intermedio <= i_b;
		
		c_reg <= i_c;
		
		//Segunda etapa
		if(intermedio > c_reg)
			o_dato <= intermedio;
		else
			o_dato <= c_reg;
		
	end
	
endmodule
