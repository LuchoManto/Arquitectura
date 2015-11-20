`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:51 11/17/2015 
// Design Name: 
// Module Name:    Latch_Fin_ID 
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
module Latch_Fin_ID(
	input wire RegWriteD,
	input wire MemtoRegD,
	input wire MemWriteD,
	input wire [3:0]ALUControlID,
	input wire [1:0]ALUSrcD,
	input wire RegDstD,
	input wire [31:0]RD1,
	input wire [31:0]RD2,
	input wire [0:4]RsD,
	input wire [0:4]RtD,
	input wire [0:4]RdD,
	input wire [31:0]SignImmD,
	input wire clk,
	input wire FlushE,
	input wire inicio,
	output reg RegWriteE,
	output reg MemtoRegE,
	output reg MemWriteE,
	output reg [3:0]ALUControlIE,
	output reg [1:0]ALUSrcE,
	output reg RegDstE,
	output reg [31:0]RD1E,
	output reg [31:0]RD2E,
	output reg [0:4]RsE,
	output reg [0:4]RtE,
	output reg [0:4]RdE,
	output reg [31:0]SignImmE
);

always@(posedge clk)
begin
	if(FlushE || inicio)
	begin
		RegWriteE <= 0;
		MemtoRegE <= 0;
		MemWriteE <= 0;
		ALUControlIE <= 0;
		ALUSrcE <= 0;
		RegDstE <= 0;
		RD1E <= 0;
		RD2E <= 0;
		RsE <= 0;
		RtE <= 0;
		RdE <= 0;
		SignImmE <= 0;
	end
	else
	begin
		RegWriteE <= RegWriteD;
		MemtoRegE <= MemtoRegD;
		MemWriteE <= MemWriteD;
		ALUControlIE <= ALUControlID;
		ALUSrcE <= ALUSrcD;
		RegDstE <= RegDstD;	
		RD1E <= RD1;
		RD2E <= RD2;
		RsE <= RsD;
		RtE <= RtD;
		RdE <= RdD;
		SignImmE <= SignImmD;
	end
end

endmodule
