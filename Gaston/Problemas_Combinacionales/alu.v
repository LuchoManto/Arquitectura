`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:06:09 08/21/2015 
// Design Name: 
// Module Name:    alu 
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
module alu#(parameter N = 8)(
	input wire [6:0]i_op,
	input wire [2:0]i_bot,
	output reg[7:0]o_leds,
	output reg [6:0]o_res,
	output reg o_cout
    );	 
	 
	 reg signed [6:0]i_in1;
	 reg signed [6:0]i_in2;
	
	 always @(i_op, i_bot)
	 begin
	 
		 if(i_bot[0])
			assign i_in1 = i_op;
		 if(i_bot[1])
			assign i_in2 = i_op;
		 
		 if(i_bot[2])
		 begin
			 case(i_op)
			 6'b100000: {o_cout,o_res} = i_in1 + i_in2;
			 6'b100010: o_res = i_in1 + ~i_in2 + 1;
			 6'b100100: o_res = i_in1 & i_in2;
			 6'b100101: o_res = i_in1 | i_in2;
			 6'b100110: o_res = i_in1 ^ i_in2;
			 6'b000011: o_res = i_in1 >> i_in2;
			 6'b000010: o_res = i_in1 >>> i_in2;
			 6'b100111: o_res = ~(i_in1 | i_in2);
			 endcase
			 o_leds=o_res;
		 end

	 end
endmodule
