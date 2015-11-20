`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:37:56 11/18/2015 
// Design Name: 
// Module Name:    Latch_Fin_Exec 
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
module Latch_Fin_Exec(
	input wire [1:0]MemReadE,
	input wire RegWriteE,
	input wire MemtoRegE,
	input wire [3:0]MemWriteE,
	input wire [31:0]ALUOut,
	input wire [31:0]WriteDataE,
	input wire [4:0]WriteRegE,
	input wire clk,
	input wire inicio,
	output reg [1:0]MemReadM,
	output reg RegWriteM,
	output reg MemtoRegM,
	output reg [3:0]MemWriteM,
	output reg [31:0]ALUOutM,
	output reg [31:0]WriteDataM,
	output reg [4:0]WriteRegM
);

always@(posedge clk)
begin
	if(inicio)
	begin
		MemReadM <= 0;
		RegWriteM <= 0;
		MemtoRegM <= 0;
		MemWriteM <= 0;
		ALUOutM <= 0;
		WriteDataM <= 0;
		WriteRegM <= 0;
	end
	else
	begin
		MemReadM <= MemReadE;
		RegWriteM <= RegWriteE;
		MemtoRegM <= MemtoRegE;
		MemWriteM <= MemWriteE;
		ALUOutM <= ALUOut;
		WriteDataM <= WriteDataE;
		WriteRegM <= WriteRegE;
	end
end

endmodule
