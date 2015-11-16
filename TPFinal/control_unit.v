`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:47 11/16/2015 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(
	input wire [31:0]instruction,
	
	output reg regDest,
	output reg branch,
	output reg memRead,
	output reg memToReg,
	output reg aluOp,
	output reg memWrite,
	output reg aluSrc,
	output reg regWrite,
	
	input wire clk
    );
	 
	 


endmodule
