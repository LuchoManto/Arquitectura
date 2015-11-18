`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:45:04 11/17/2015 
// Design Name: 
// Module Name:    mux_2_32 
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
module mux_RegDstE(
	input wire [4:0]RtE,
	input wire [4:0]RdE,
	input wire RegDstE,
	output reg [4:0]WriteRegE
);
	 
	 always@(*)
	 begin
		 if(RegDstE)
			WriteRegE <= RdE;
		 else
			WriteRegE <= RtE;
	 end


endmodule
