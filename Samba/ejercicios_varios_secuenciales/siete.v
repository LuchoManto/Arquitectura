`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:29:27 09/12/2015 
// Design Name: 
// Module Name:    siete 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
/*
7.	Describa en Verilog un circuito que utilice 
contadores para dividir un master clock de 20.48 MHz y
 genere un señal con un “duty cycle” del 50% y una frecuencia de 5 KHz.
 
 20480000 - 100%
 50000      - 0.024% => 40.96 => necesito contador de 6bits
 
"Duty cycle": parámetro asociado o que define a la señal PWM, denominado Ciclo de Trabajo,
 el cual determina el porcentaje de tiempo que el pulso (o voltaje aplicado) está en estado activo (on) durante un ciclo.
Por ejemplo, si una señal tiene un periodo de 10 ms y sus pulsos son de ancho (PW) 2ms, dicha señal tiene un ciclo
 de trabajo (duty cycle) de 20% (20% on y 80% off). El siguiente gráfico muestra tres señales PWM con diferentes "duty cycles". 

*/
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module siete
	# (parameter N_BITS = 6 , parameter CONTADOR_VALOR = 41)
	(
	input clk,
	output reg o_clk
    );
	
	reg [N_BITS-1:0] contador;
	
	initial 
	begin
		contador = 0;
	end
	
	//El contador varia según el clokc de entrada
	always @ (posedge clk)
	begin
		if (contador < CONTADOR_VALOR)
			contador <= contador +1;
		else
			contador <= 0;
	end
	
	//El clock de salida varia segun el contador. Se mantiene el alto 2/4 (50% del tiempo) .
	always @ (contador)
	begin
		if (contador < CONTADOR_VALOR/2)
			o_clk <= 1;
		else
			o_clk <= 0;
	end
	
	

endmodule
