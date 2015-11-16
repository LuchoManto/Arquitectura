`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:29:56 11/15/2015 
// Design Name: 
// Module Name:    leftShift2 
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
module leftShift2(
	input wire [31:0]in,
	output reg [31:0]out,
	
	input wire clk
    );
	 
	 
	 always@(posedge clk)
	 begin
	 
	 out <= in << 2;
	 
	 end


endmodule
