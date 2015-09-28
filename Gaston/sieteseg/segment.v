`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:40:37 08/21/2015 
// Design Name: 
// Module Name:    sietesegmentos 
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
module sietesegmentos(
	input wire [3:0]i_in,
	output reg [6:0]o_sseg
    );
	 
	 always @(i_in)
	 begin
	 case(i_in)
	 4'b0000: o_sseg = 7'b1000000; //0
	 4'b0001: o_sseg = 7'b1111001; //1
	 4'b0010: o_sseg = 7'b0100100; //2
	 4'b0011: o_sseg = 7'b0110000; //3
	 4'b0100: o_sseg = 7'b0011001; //4
	 4'b0101: o_sseg = 7'b0010010; //5
	 4'b0110: o_sseg = 7'b0000010; //6
	 4'b0111: o_sseg = 7'b1111000; //7
	 4'b1000: o_sseg = 7'b0000000; //8
	 4'b1001: o_sseg = 7'b0010000; //9
	 default: o_sseg = 7'b0001001; //H
	 endcase
	 end

endmodule