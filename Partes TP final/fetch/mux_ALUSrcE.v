`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:16:28 11/18/2015 
// Design Name: 
// Module Name:    mux_ALUSrcE 
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
module mux_ALUSrcE(
	input wire [31:0]WriteDataE,
	input wire [31:0]SignImmE,
	input wire ALUSrcE,
	output reg [31:0]SrcBE
);
	 
	 always@(*)
	 begin
		 if(ALUSrcE)
			SrcBE <= SignImmE;
		 else
			SrcBE <= WriteDataE;
	 end


endmodule