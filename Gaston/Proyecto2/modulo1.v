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
	input wire [5:0]i_op,
	input wire [1:0]i_bot,
	output reg [6:0]o_sseg
    );	 

	 reg signed [5:0]i_in1;
	 reg signed [5:0]i_in2;
	 reg signed [5:0]o_res;
	 
	 always @(*)
	 begin
	 
		 if(i_bot[0])
		 begin
			assign i_in1 = i_op;
			assign i_in2 = i_op;
		 end
		 else
		 begin
			 		 
			 if(i_bot[1])
			 begin	 
					 case(i_op)
					 6'b100000: o_res = i_in1 + i_in2;
					 6'b100010: o_res = i_in1 + ~i_in2 + 1;
					 6'b100100: o_res = i_in1 & i_in2;
					 6'b100101: o_res = i_in1 | i_in2;
					 6'b100110: o_res = i_in1 ^ i_in2;
					 6'b000011: o_res = i_in1 >> i_in2;
					 6'b000010: o_res = i_in1 >>> i_in2;
					 6'b100111: o_res = ~(i_in1 | i_in2);
					 default: o_res=6'b111111;
					 endcase
					 
					 case(o_res)
					 4'b00000: o_sseg = 7'b1000000; //0
					 4'b00001: o_sseg = 7'b1111001; //1
					 4'b00010: o_sseg = 7'b0100100; //2
					 4'b00011: o_sseg = 7'b0110000; //3
					 4'b00100: o_sseg = 7'b0011001; //4
					 4'b00101: o_sseg = 7'b0010010; //5
					 4'b00110: o_sseg = 7'b0000010; //6
					 4'b00111: o_sseg = 7'b1111000; //7
					 4'b01000: o_sseg = 7'b0000000; //8
					 4'b01001: o_sseg = 7'b0010000; //9
					 default:  o_sseg = 7'b0001001; //H
					 endcase
					 
			 end
			 else
			 begin
					 o_res=6'b111111;
					 o_sseg = 7'b0001001; //H
			 end
			 
		end

	 end
endmodule
