`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:10:22 11/17/2015 
// Design Name: 
// Module Name:    Instr_Lach 
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
module Instr_Lach(
	input wire clk,
	input wire en,
	input wire [31:0] Instr,
	output reg [31:0] InstrD
    );

always@(posedge clk)
begin
	if(en == 0)
	begin
		InstrD <= Instr;
	end
end


endmodule
