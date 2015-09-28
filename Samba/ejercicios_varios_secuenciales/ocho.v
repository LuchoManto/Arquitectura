`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:31:13 09/12/2015 
// Design Name: 
// Module Name:    ocho 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
/*
8.	Describa en Verilog un circuito para un contador de módulo 12.
 Se deberá permitir cargar un valor umbral, con una
 resolución <= a 12 bits utilizando los switches dispuestos en la placa
 de desarrollo BASYS 2. Cuando el contador alcance (o supere)
 dicho umbral deberá encender un led (de los disponibles en el kit de 
 desarrollo) que indique dicho evento. Al alcanzar su valor de cuenta
 máxima se deberá apagar dicho LED.
*/
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ocho
	# (parameter N_BITS = 12, parameter CUENTA_MAX = 4096)
	(
	input [N_BITS-1:0] i_umbral,
	input reset, clk,
	output reg o_led
    );
	
	reg [N_BITS-1:0] umbral;
	reg [N_BITS-1:0] contador;
	
	initial
	begin
		umbral = 0;
		contador = 0;
	end
	
	always @ (posedge clk)
	begin
		if (reset)
		begin
			contador <= {N_BITS{1'b0}};
		end
		
		umbral <= i_umbral;
			contador <= contador +1;
			if (contador < umbral)
				o_led <= 0;
			if (contador >= umbral)
				o_led <= 1;
			if (contador >= CUENTA_MAX-1)
				o_led <= 0;
	end

endmodule
