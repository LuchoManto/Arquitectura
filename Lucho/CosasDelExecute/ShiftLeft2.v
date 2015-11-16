`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:54:26 11/10/2015 
// Design Name: 
// Module Name:    ShiftLeft2 
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
module ShiftLeft2(
	input wire [31:0]in,
	output reg [31:0]out,
	
	input wire clk
    );
	 
	 
	 always@(posedge clk)
	 begin
	 
	 out <= in << 2;
	 
	 end


endmodule
