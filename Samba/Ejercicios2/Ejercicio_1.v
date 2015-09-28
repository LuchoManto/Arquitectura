`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:19 09/14/2015 
// Design Name: 
// Module Name:    Ejercicio_1 
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
module Ejercicio_1
	#( parameter N = 32
		)
	(	input wire [N-1:0]i_a,
		output reg [N-1:0]o_a,
		input wire clk
	);

always @(posedge clk)
	o_a<=i_a;

endmodule
