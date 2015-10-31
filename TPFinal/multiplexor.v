`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:16 10/31/2015 
// Design Name: 
// Module Name:    multiplexor 
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
module multiplexor
(
	input [4:0] selector,
	input [31:0] entrada0,
	input [31:0] entrada1,
	input [31:0] entrada2,
	input [31:0] entrada3,
	input [31:0] entrada4,
	input [31:0] entrada5,
	input [31:0] entrada6,
	input [31:0] entrada7,
	input [31:0] entrada8,
	input [31:0] entrada9,
	input [31:0] entrada10,
	input [31:0] entrada11,
	input [31:0] entrada12,
	input [31:0] entrada13,
	input [31:0] entrada14,
	input [31:0] entrada15,
	input [31:0] entrada16,
	input [31:0] entrada17,
	input [31:0] entrada18,
	input [31:0] entrada19,
	input [31:0] entrada20,
	input [31:0] entrada21,
	input [31:0] entrada22,
	input [31:0] entrada23,
	input [31:0] entrada24,
	input [31:0] entrada25,
	input [31:0] entrada26,
	input [31:0] entrada27,
	input [31:0] entrada28,
	input [31:0] entrada29,
	input [31:0] entrada30,
	input [31:0] entrada31,
	output reg [31:0] salida
 );

always @(*)
begin
	case (selector)
		5'b00000: salida = entrada0;
		5'b00001: salida = entrada1;
		5'b00010: salida = entrada2;
		5'b00011: salida = entrada3;
		5'b00100: salida = entrada4;
		5'b00101: salida = entrada5;
		5'b00110: salida = entrada6;
		5'b00111: salida = entrada7;
		5'b01000: salida = entrada8;
		5'b01001: salida = entrada9;
		5'b01010: salida = entrada10;
		5'b01011: salida = entrada11;
		5'b01100: salida = entrada12;
		5'b01101: salida = entrada13;
		5'b01110: salida = entrada14;
		5'b01111: salida = entrada15;
		5'b10000: salida = entrada16;
		5'b10001: salida = entrada17;
		5'b10010: salida = entrada18;
		5'b10011: salida = entrada19;
		5'b10100: salida = entrada20;
		5'b10101: salida = entrada21;
		5'b10110: salida = entrada22;
		5'b10111: salida = entrada23;
		5'b11000: salida = entrada24;
		5'b11001: salida = entrada25;
		5'b11010: salida = entrada26;
		5'b11011: salida = entrada27;
		5'b11100: salida = entrada28;
		5'b11101: salida = entrada29;
		5'b11110: salida = entrada30;
		5'b11111: salida = entrada31;
	endcase
end
					
endmodule
