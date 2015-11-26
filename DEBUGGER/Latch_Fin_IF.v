`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:21:45 11/20/2015 
// Design Name: 
// Module Name:    Latch_Fin_IF 
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
module Latch_Fin_IF(
	input wire [31:0] Instr,
	input wire [8:0] PCPlus4F,
	input wire clk,
	input wire en,
	input wire clr,
	input wire inicio,
	output reg [31:0] InstrD,
	output reg [8:0] PCPlus4D
);

reg espera_clr = 0;
reg reset_clr = 0;
wire reset_clrw;
wire espera_clrw;

always@(negedge clk)
begin
	if(en == 0)
	begin
		if(clr || inicio)
		begin
			PCPlus4D <= 0;
			InstrD <= 32'hF800_0000;
		end
		else
		begin
			PCPlus4D <= PCPlus4F;
			InstrD <= Instr;
		end
	end
end

endmodule