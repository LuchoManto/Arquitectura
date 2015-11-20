`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:13:38 11/17/2015 
// Design Name: 
// Module Name:    PC_Latch 
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
module PC_Latch(
	input wire clk,
	input wire en,
	input wire clr,
	input wire [8:0] PCPlus4F,
	output reg [8:0] PCPlus4D
    );

always@(posedge clk)
begin
	if(en == 0)
	begin
		if(clr)
		begin
			PCPlus4D <= 0;
		end
		else
		begin
			PCPlus4D <= PCPlus4F;
		end
	end
end


endmodule
