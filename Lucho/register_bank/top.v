`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:36 11/07/2015 
// Design Name: 
// Module Name:    top 
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
module top(
	input [4:0]r1,
	input [4:0]r2,
	input [4:0]write_reg,
	input [31:0]write_data,
	input reg_write_flag,
	output reg [31:0]d1,
	output reg [31:0]d2,
	input clk
    );
	 
	 
	 reg [31:0] bank [31:0];
	 
	 always@(posedge clk)
	 begin
	 
	 d1 <= bank[r1];
	 d2 <= bank[r2];
	 
	 bank[write_reg] <= (reg_write_flag == 1) ? write_data : bank[write_reg];
	 
	 end
	 
	 


endmodule
