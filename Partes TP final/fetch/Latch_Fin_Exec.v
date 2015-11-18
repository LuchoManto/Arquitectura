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
	input wire RegWriteE,
	input wire MemtoRegE,
	input wire MemWriteE,
	input wire [31:0]ALUOut,
	input wire [31:0]WriteDataE,
	input wire [4:0]WriteRegE,
	input wire clk,
	output reg RegWriteM,
	output reg MemtoRegM,
	output reg MemWriteM,
	output reg [31:0]ALUOutM,
	output reg [31:0]WriteDataM,
	output reg [4:0]WriteRegM
);

always@(posedge clk)
begin
	RegWriteM <= RegWriteE;
	MemtoRegM <= MemtoRegE;
	MemWriteM <= MemWriteE;
	ALUOutM <= ALUOut;
	WriteDataM <= WriteDataE;
	WriteRegM <= WriteRegE;
end

endmodule
