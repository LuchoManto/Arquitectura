`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:42:55 09/14/2015 
// Design Name: 
// Module Name:    Ejercicio_2 
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
module Ejercicio_2
	( input wire signed [13:0]i_a,
	  input wire signed [13:0]i_b,
	  input wire signed [13:0]i_c,
	  output reg signed [13:0]o_1,
	  input wire clk
    );
	 
		reg signed [13:0] o_ab;
		reg signed [13:0] o_c;
		
		always @(posedge clk)
		begin
			o_c <= i_c;
			if (i_a > i_b)
				o_ab <= i_a;
			else 
				o_ab <= i_b;
			
			if (o_ab > o_c)
				o_1 <= o_ab;
			else 
				o_1 <= i_c;	

		end

endmodule
