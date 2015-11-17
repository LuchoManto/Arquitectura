`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:41 11/17/2015 
// Design Name: 
// Module Name:    latch_3_signal 
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
module latch_exec_out(

	input wire ALUoutE,
	input wire WriteDataE,
	input wire WriteRegE,
	
	output reg ALUoutM,
	output reg WriteDataM,
	output reg WriteRegM,
	
	input wire clk
    );
	 
	 always@(posedge clk)
	 begin
			ALUoutM <= ALUoutE;
			WriteDataM<= WriteDataE;
			WriteRegM <= WriteRegE;
	 end


endmodule
