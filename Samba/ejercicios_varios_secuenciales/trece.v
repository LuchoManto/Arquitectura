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
13.	Describa en Verilog e implemente en el kit BASYS 2 un PWM con resolución
 de 4 bits. Deberá modular el ancho de pulso de una onda cuadrada externa, la cual 
 se introducirá a la placa a través de alguno de los pines disponibles para señales
 externas. Se Deberá determinar la máxima frecuencia de señal de entrada que su 
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
	Tengo el clk de 50MHz, y quiero que la señal se actualice cada 1ms
	entonces mi período será:
	P = t_actualizacion * clk
	P = 0.001 * 50000000 = 50000 s = 50Ks
	
	Con esto puedo calcular lel "retardo de paso" , como tengo resolución de 2 ^ N_BITS =16 pasos
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
