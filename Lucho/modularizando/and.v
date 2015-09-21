`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:59:28 09/07/2015 
// Design Name: 
// Module Name:    and 
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
module mand#(parameter N = 1)(
	input wire [N-1:0]i_x,
	input wire [N-1:0]i_y,
	output reg [N-1:0]o_z
    );
	 
	 always@(*)
	 begin
	 o_z = i_x & i_y;
	 end


endmodule
