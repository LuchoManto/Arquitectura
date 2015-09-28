`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:44:23 09/07/2015 
// Design Name: 
// Module Name:    cuatro 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
/*
4.	Desarrolle un modelo Verilog de un detector de picos que encuentre el valor
 m�ximo dentro de una secuencia de enteros sin signo de 10 bit. Un nuevo n�mero 
 arriba a la entrada con un flanco ascendente del reloj. El valor del m�ximo n�mero
 ingresado deber� ser mostrado en  8 de los leds de usuario presentes en el kit
 de desarrollo BASYS 2. Se deber� implementar una se�al de "RESET" utilizando uno
 de los pulsadores dispuestos en el kit para el usuario. El valor m�ximo mostrado
 en los leds ser� borrado (todos los leds apagados) cuando llegue un reset. 
*/
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cuatro(
	input [9:0] i_dato,
	input clk,reset,
	output reg [9:0] o_dato
    );
	
	always @(posedge clk)
	begin
		if(reset)
			o_dato <= {10{1'b0}};
		else
		begin
			if(o_dato > i_dato)
				o_dato <= o_dato;
			else
				o_dato <= i_dato;
		end
	end


endmodule
