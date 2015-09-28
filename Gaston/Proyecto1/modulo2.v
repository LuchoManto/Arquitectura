`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:30:17 08/10/2015 
// Design Name: 
// Module Name:    modulo2 
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
module modulo2(
	 input wire a, b, c,
	 output reg y // se llama reg porque es la unica manera que y pueda estar a la izquierda de una asignacion no bloqueante
	// al ser reg, tiene la capacidad de poder almacenar un valor (el valor de a, b o c)
	 );
	 
	 always @*
		begin
			y <= a;
			y <= y & c;
			y <= y & b;
		end
		
endmodule
