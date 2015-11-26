`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:10:19 11/18/2015 
// Design Name: 
// Module Name:    Latch_Fin_Mem 
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
module Latch_Fin_Mem(
	input wire [1:0]MemReadM,
	input wire RegWriteM,
	input wire MemtoRegM,
	input wire [31:0]ReadData,
	input wire [31:0]ALUOutM,
	input wire [4:0]WriteRegM,
	input wire clk,
	input wire inicio,
	input wire activo,
	input wire finalM,
	output reg [1:0]MemReadW,
	output reg RegWriteW,
	output reg MemtoRegW,
	output reg [31:0]ReadDataW,
	output reg [31:0]ALUOutW,
	output reg [4:0]WriteRegW,
	output reg finalW
);

always@(negedge clk)
begin
	if(activo)
	begin
		if(inicio)
		begin
			RegWriteW <= 0;
			MemtoRegW <= 0;
			ReadDataW <= 0;
			ALUOutW <= 0;
			WriteRegW <= 0;		
			MemReadW <= 0;
			finalW <= 0;
		end
		else
		begin
			RegWriteW <= RegWriteM;
			MemtoRegW <= MemtoRegM;
			ALUOutW <= ALUOutM;
			WriteRegW <= WriteRegM;
			MemReadW <= MemReadM;
			finalW <= finalM;
			
			ReadDataW <= ReadData;
		end
	end
end

/*
always@(*)
begin
	ReadDataW <= ReadData;
end
*/

endmodule