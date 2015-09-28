`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:03:16 08/31/2015 
// Design Name: 
// Module Name:    Clock 
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
module Clock( 
	input wire i_b, 
	input wire i_a,
	input wire i_c,
	input wire i_d,
	input wire clk,
	output reg o_a,
	output reg o_b
	);
	 wire ab;
	 wire cd;
	 wire nab;
	 wire cd_cd;
	 wire	 ab_cd;
	 wire cd_cd_cd;
	 
	 reg i1;
	 reg i2;
	 reg i3;
	 reg i4;
	 
	 assign ab = i1 & i2;
	 assign cd = i3 & i4;
	 assign cd_cd_cd = cd & i3 & i4;
	 assign abc = ab | i4;
	 assign nabc = ~abc;
	 assign ab_cd = nabc | cd;
	 
	 always @(posedge clk)
		begin
			i1<=i_a;
			i2<=i_b;
			i3<=i_c;
			i4<=i_d;
		end

	always @(posedge clk)
		begin
			o_a<=ab_cd;
			o_b<=cd_cd_cd;
		end


endmodule
