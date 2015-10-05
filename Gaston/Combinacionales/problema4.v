`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:47:38 10/04/2015 
// Design Name: 
// Module Name:    problema4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//		Diseñar un circuito half adder de 2 bits.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module problema4
#(parameter N=1)
(
	input [N:0] A,
	input [N:0] B,
	output reg [N:0] sum,
	output reg cout
);

always@(*)
begin
	{cout, sum} = A + B;
end

endmodule
