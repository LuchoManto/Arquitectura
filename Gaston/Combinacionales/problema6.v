`timescale 1ns / 1ps
/*
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:25 10/04/2015 
// Design Name: 
// Module Name:    problema6 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
	Los segmentos estaran pensados como: a,b,c,d,e,f,g
	Diseñar un decodificador de 7 segmentos para un solo display:
	a. El display es anodo común. (se prende con 0)
	b. Deberá ser capaz de mostrar los números comprendidos entre 0 y 9,
		para los demás valores deberá mostrar la letra "H". 
		Para esto utilizara 4 bits de entrada donde "0000" ? 0 y "1001" ? 9;

// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
*/
module problema6
(
	input [3:0] val,
	output reg [6:0] seg,
	input clk
);


//Los segmentos estaran pensados como a,b,c,d,e,f,g
always@(posedge clk)
begin
	case(val)
		4'b0000:	seg<=7'b0000001;
		4'b0001:	seg<=7'b1001111;
		4'b0010:	seg<=7'b0010010;
		4'b0011:	seg<=7'b0000110;
		4'b0100:	seg<=7'b1001100;
		4'b0101:	seg<=7'b0100100;
		4'b0110:	seg<=7'b0100000;
		4'b0111:	seg<=7'b0001111;
		4'b1000:	seg<=7'b0000000;
		4'b1001:	seg<=7'b0001100;
		default: seg<=7'b1001000;
	endcase
end


endmodule
