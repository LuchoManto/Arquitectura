`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:12:47 10/31/2015 
// Design Name: 
// Module Name:    demultiplexor 
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
module demultiplexor
(
	input [4:0] selector,
	input entrada,
	output reg salida0,
	output reg salida1,
	output reg salida2,
	output reg salida3,
	output reg salida4,
	output reg salida5,
	output reg salida6,
	output reg salida7,
	output reg salida8,
	output reg salida9,
	output reg salida10,
	output reg salida11,
	output reg salida12,
	output reg salida13,
	output reg salida14,
	output reg salida15,
	output reg salida16,
	output reg salida17,
	output reg salida18,
	output reg salida19,
	output reg salida20,
	output reg salida21,
	output reg salida22,
	output reg salida23,
	output reg salida24,
	output reg salida25,
	output reg salida26,
	output reg salida27,
	output reg salida28,
	output reg salida29,
	output reg salida30,
	output reg salida31
);

always @(*)
begin
	case (selector)
		5'b00000: salida0 = entrada;
		5'b00001: salida1 = entrada;
		5'b00010: salida2 = entrada;
		5'b00011: salida3 = entrada;
		5'b00100: salida4 = entrada;
		5'b00101: salida5 = entrada;
		5'b00110: salida6 = entrada;
		5'b00111: salida7 = entrada;
		5'b01000: salida8 = entrada;
		5'b01001: salida9 = entrada;
		5'b01010: salida10 = entrada;
		5'b01011: salida11 = entrada;
		5'b01100: salida12 = entrada;
		5'b01101: salida13 = entrada;
		5'b01110: salida14 = entrada;
		5'b01111: salida15 = entrada;
		5'b10000: salida16 = entrada;
		5'b10001: salida17 = entrada;
		5'b10010: salida18 = entrada;
		5'b10011: salida19 = entrada;
		5'b10100: salida20 = entrada;
		5'b10101: salida21 = entrada;
		5'b10110: salida22 = entrada;
		5'b10111: salida23 = entrada;
		5'b11000: salida24 = entrada;
		5'b11001: salida25 = entrada;
		5'b11010: salida26 = entrada;
		5'b11011: salida27 = entrada;
		5'b11100: salida28 = entrada;
		5'b11101: salida29 = entrada;
		5'b11110: salida30 = entrada;
		5'b11111: salida31 = entrada;
	endcase
end
 

endmodule
