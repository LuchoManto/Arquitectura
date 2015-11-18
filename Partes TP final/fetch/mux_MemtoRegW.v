`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:23:32 11/18/2015 
// Design Name: 
// Module Name:    mux_MemtoRegW 
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
module mux_MemtoRegW(
	input wire [31:0]ReadDataW,
	input wire [31:0]ALUOutW,
	input wire MemtoRegW,
	output reg [31:0]ResultW
);
	 
always@(*)
begin
	if(MemtoRegW)
		ResultW <= ReadDataW;
	else
		ResultW <= ALUOutW;
end


endmodule