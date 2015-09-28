`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:10:15 08/21/2015 
// Design Name: 
// Module Name:    Multiplexor_estructural 
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
module Multiplexor_estructural( 
	input wire [3:0] i_a,
	input wire [1:0] i_con,
	output wire o_y
    );

	assign o_y = i_a[i_con]; 

endmodule
