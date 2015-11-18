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

	input wire [31:0]ALUoutE,
	input wire [31:0]WriteDataE,
	input wire [31:0]WriteRegE,
	
	output reg [31:0]ALUoutM,
	output reg [31:0]WriteDataM,
	output reg [31:0]WriteRegM,
	
	input wire clk
    );
	 
	 always@(posedge clk)
	 begin
			ALUoutM <= ALUoutE;
			WriteDataM<= WriteDataE;
			WriteRegM <= WriteRegE;
	 end


endmodule
