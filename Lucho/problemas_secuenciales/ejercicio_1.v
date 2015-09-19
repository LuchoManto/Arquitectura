`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:26 09/14/2015 
// Design Name: 
// Module Name:    ejercicio_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: l
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ejercicio_1#(parameter N=32)(
	input wire [N-1:0]i_e,
	output reg [N-1:0]o_s,
	input wire clock
    );
	 
	 always@(posedge clock)
	 o_s <= i_e;


endmodule
