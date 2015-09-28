`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:35:16 09/21/2015 
// Design Name: 
// Module Name:    Ejercicio_6 
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
//
//////////////////////////////////////////////////////////////////////////////////
module Ejercicio_6
	(
		input wire clk,
		output reg control
    );

	reg [4:0]cont = 000000;
	reg cont4 = 0;
	reg cont20 = 0;
	reg cont24 = 0;
	
//los contadores cada 4,20,24, cuentan cada vez que el contador cont esta en 4,20,24 o 
// cuentan cada 4,20,24 clocks del reloj? 
	
	always @(posedge clk)
	begin 
		cont = cont + 1;
		if (cont == 5'b00100)
			control <= 1;
		else 
			control <= 0;
		
		if (cont == 5'b10100)
			control <= 1;
		else 
			control <= 0;
		
		if (cont == 5'b11000)
			control <= 1;
		else 
			control <= 0;
		
		if (cont == 5'b11111)
			cont <= 0;
	end
endmodule
