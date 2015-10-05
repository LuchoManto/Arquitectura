`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:13:31 10/04/2015 
// Design Name: 
// Module Name:    problema5 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// 		Diseñar un circuito full adder de 2 bits. 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module problema5
#(parameter N=1)
(
	input [N:0] A,
	input [N:0] B,
	input cin,
	output reg [N:0] sum,
	output reg cout
);

always@(*)
begin
	{cout, sum} = A + B + cin;
end

endmodule
