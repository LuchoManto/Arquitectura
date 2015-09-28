`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:42 08/10/2015 
// Design Name: 
// Module Name:    modulo3 
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
module modulo3(input wire a, b, c, 
	output wire y);
	
	assign y = a;
	assign y = y & b;
	assign y = y & c;


endmodule
