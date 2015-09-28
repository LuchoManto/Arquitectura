`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:03:47 08/20/2015 
// Design Name: 
// Module Name:    problema3 
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
module problema3(
	input wire [3:0]i_in,
	input wire [1:0]i_con,
	output wire o_y
    );
	 
	assign o_y = i_in[i_con];


endmodule
