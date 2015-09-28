`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:09:05 09/21/2015 
// Design Name: 
// Module Name:    Ejercicio_4 
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
module Ejercicio_4
	( input wire [9:0]i_a,
	  input wire [9:0]i_b,
	  input wire reset,
	  input wire clk,
	  output reg [9:0]o_a
    );

always @(posedge clk)
	begin
		if (reset == 1)
			o_a <= 0000000000;
		else 
		begin
			if (i_a > i_b)
			 o_a <= i_a;
			else
			 o_a <= i_b;
		end 
	end
endmodule
