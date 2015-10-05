	`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:53:20 10/03/2015 
// Design Name: 
// Module Name:    problema_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//  Diseñar un multiplexor de 4 entradas (a,b,c,d) y una salida (y) describiéndolo en nivel RTL.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module problema_1
#(parameter N=7)
(
	input [N:0] a,
	input [N:0] b,
	input [N:0] c,
	input [N:0] d,
	input [1:0] selector,
	output reg [N:0] salida
);


always@(*)
begin
	case(selector)
		8'b00:	salida=a;
		8'b01:	salida=b;
		8'b10:	salida=c;
		8'b11:	salida=d;
		default:	salida=0;
	endcase
end


endmodule
