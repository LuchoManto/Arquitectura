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
module register_bank(
	input [4:0]r1,
	input [4:0]r2,
	input [4:0]write_reg,
	input [31:0]write_data,
	input all_registers,
	output reg [31:0]d1,
	output reg [31:0]d2,
	input clk,
	input reg_write_flag,
	
	output reg [31:0]out0,
	output reg [31:0]out1,
	output reg [31:0]out2,
	output reg [31:0]out3,
	output reg [31:0]out4,
	output reg [31:0]out5,
	output reg [31:0]out6,
	output reg [31:0]out7,
	output reg [31:0]out8,
	output reg [31:0]out9,
	output reg [31:0]out10,
	output reg [31:0]out11,
	output reg [31:0]out12,
	output reg [31:0]out13,
	output reg [31:0]out14,
	output reg [31:0]out15,
	output reg [31:0]out16,
	output reg [31:0]out17,
	output reg [31:0]out18,
	output reg [31:0]out19,
	output reg [31:0]out20,
	output reg [31:0]out21,
	output reg [31:0]out22,
	output reg [31:0]out23,
	output reg [31:0]out24,
	output reg [31:0]out25,
	output reg [31:0]out26,
	output reg [31:0]out27,
	output reg [31:0]out28,
	output reg [31:0]out29,
	output reg [31:0]out30,
	output reg [31:0]out31
    );
	 
	 
	 reg [31:0] bank [31:0];
	 
	 always@(posedge clk)
	 begin
	 
	 d1 <= bank[r1];
	 d2 <= bank[r2];
	 
	 bank[write_reg] <= reg_write_flag ? write_data : bank[write_reg];
	 
	 if(all_registers)
	 begin
		out0 <= bank[0];
		out1 <= bank[1];
		out2 <= bank[2];
		out3 <= bank[3];
		out4 <= bank[4];
		out5 <= bank[5];
		out6 <= bank[6];
		out7 <= bank[7];
		out8 <= bank[8];
		out9 <= bank[9];
		out10 <= bank[10];
		out11 <= bank[11];
		out12 <= bank[12];
		out13 <= bank[13];
		out14 <= bank[14];
		out15 <= bank[15];
		out16 <= bank[16];
		out17 <= bank[17];
		out18 <= bank[18];
		out19 <= bank[19];
		out20 <= bank[20];
		out21 <= bank[21];
		out22 <= bank[22];
		out23 <= bank[23];
		out24 <= bank[24];
		out25 <= bank[25];
		out26 <= bank[26];
		out27 <= bank[27];
		out28 <= bank[28];
		out29 <= bank[29];
		out30 <= bank[30];
		out31 <= bank[31];
	 end
	 
	 
	 end
	 
	 


endmodule
