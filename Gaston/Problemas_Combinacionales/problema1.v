`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:01:13 08/13/2015 
// Design Name: 
// Module Name:    problema1 
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
module problema1(
	input wire i_a,
	input wire i_b,
	input wire i_c,
	input wire i_d,
	input wire [0:1]i_con,
	input wire rs, //problema 2
	output reg o_y
    );

	always @(i_con, rs)
	begin
	
	if(rs == 0) // problema 2
	begin
	case(i_con)
	'b00: o_y = i_a;
	'b01: o_y = i_b;
	'b10: o_y = i_c;
	'b11: o_y = i_d;
	endcase
	end
	else o_y = 0;
	end

endmodule
