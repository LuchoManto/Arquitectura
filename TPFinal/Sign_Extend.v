`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:44:42 11/10/2015 
// Design Name: 
// Module Name:    Sign_Extend 
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
module Sign_Extend(
	input wire [15:0]in,
	output reg [31:0]out,
	
	input wire clk
    );
	 
	 always@(posedge clk)
	 begin
	 
	 out <= $signed(in);
	 
	 end


endmodule
