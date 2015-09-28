`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:30:56 09/07/2015 
// Design Name: 
// Module Name:    seg 
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
module seg#
	(
	parameter N=7
	)
	(
	input signed [N:0] o_ress,
	output reg [6:0] o_ssegg
    );
	
	always @(o_ress)
	begin
		case(o_ress)
				 8'b00000000: o_ssegg <= 7'b1000000; //0
				 8'b00000001: o_ssegg <= 7'b1111001; //1
				 8'b00000010: o_ssegg <= 7'b0100100; //2
				 8'b00000011: o_ssegg <= 7'b0110000; //3
				 8'b00000100: o_ssegg <= 7'b0011001; //4
				 8'b00000101: o_ssegg <= 7'b0010010; //5
				 8'b00000110: o_ssegg <= 7'b0000010; //6
				 8'b00000111: o_ssegg <= 7'b1111000; //7
				 8'b00001000: o_ssegg <= 7'b0000000; //8
				 8'b00001001: o_ssegg <= 7'b0010000; //9
				 default:  o_ssegg <= 7'b0001001; //H
		endcase
	end
endmodule
