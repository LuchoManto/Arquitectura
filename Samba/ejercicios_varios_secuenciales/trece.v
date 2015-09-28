`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:10 09/13/2015 
// Design Name: 
// Module Name:    trece 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
/*
13.	Describa en Verilog e implemente en el kit BASYS 2 un PWM con resoluci�n
 de 4 bits. Deber� modular el ancho de pulso de una onda cuadrada externa, la cual 
 se introducir� a la placa a trav�s de alguno de los pines disponibles para se�ales
 externas. Se Deber� determinar la m�xima frecuencia de se�al de entrada que su 
 circuito puede modular.
*/
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module trece

	/*
	Tengo el clk de 50MHz, y quiero que la se�al se actualice cada 1ms
	entonces mi per�odo ser�:
	P = t_actualizacion * clk
	P = 0.001 * 50000000 = 50000 s = 50Ks
	
	Con esto puedo calcular lel "retardo de paso" , como tengo resoluci�n de 2 ^ N_BITS =16 pasos
	Entonces:
	retardo = P / pasos
	retardo = 50000 / 16  = 3125
	
	*/
	#(parameter cincuenta_M = 50000000, parameter retardo = 3125)
	(
	input i_senal, clk,
	output reg o_salida
    );
	
	reg [15:0] contador = 0;
	
	always @ (posedge clk)
	begin
		contador <= contador +1;
		
		if(contador < i_senal * retardo)
			o_salida <= 1;
		else
			o_salida <= 0;
		
		if (contador >= cincuenta_M)
			contador <= 0;
			
	end
	
endmodule
