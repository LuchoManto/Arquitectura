`timescale 1ns / 1ps
/*
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:53 09/23/2015 
// Design Name: 
// Module Name:    Ejercicio4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
Desarrolle un modelo Verilog de un detector de picos que encuentre el valor máximo 
dentro de una secuencia de enteros sin signo de 10 bit.

 Un nuevo número arriba a la entrada con un flanco ascendente del reloj.
 
 El valor del máximo número ingresado deberá ser mostrado en los 8 de los leds de usuario 
 presentes en el kit de desarrollo BASYS 2. Se deberá implementar una señal de "RESET"
 utilizando uno de los pulsadores dispuestos en el kit para el usuario. 
 
 El valor máximo mostrado en los leds será borrado (todos los leds apagados) cuando llegue un reset. 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
*/
module Ejercicio4
(
	input wire [9:0] i_numero,
	output reg [7:0] o_leds,
	input wire reset,
	input wire clk    
);

	reg [9:0] mayor = 10'b0000000000;
	
	always@(posedge clk)
	begin
		//Si esta reset guardo en el mayor el 0.
		if(reset)
		begin
			mayor <= 0;
			o_leds <= 0;
		end
		else
		begin
			//Si no esta reset me fijo si la entrada supera a mayor
			if(i_numero > mayor)
			begin
				mayor <= i_numero;
				o_leds <= i_numero;
			end
		end
		
	end

endmodule














