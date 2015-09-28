`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:10 08/29/2015 
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
module alu(
	input wire [7:0]i_op,
	input wire [2:0]i_bot,
	output reg [6:0]o_sseg,
	input wire clk
    );	 
	
	 reg signed [7:0]i_in1 = 6'b000000;
	 reg signed [7:0]i_in2 = 6'b000000;
	 reg signed [7:0]o_res = 6'b000000;
	
	 always @(posedge clk)
	 begin		 
		 if(i_bot[0] == 1'b1)
			i_in1 <= i_op;
		 if(i_bot[1] == 1'b1)
			i_in2 <= i_op;
		
		 if(i_bot[2] == 1'b1)
		 begin	 
			 case(i_op)
			 8'b00000001: o_res <= i_in1 + i_in2;
			 8'b00100010: o_res <= i_in1 + ~i_in2 + 1; //resta
			 8'b00100100: o_res <= i_in1 & i_in2; //and
			 8'b00100101: o_res <= i_in1 | i_in2; //or
			 8'b00100110: o_res <= i_in1 ^ i_in2; //xor
			 8'b00000011: o_res <= i_in1 >> i_in2; //shift logico
			 8'b00000010: o_res <= i_in1 >>> i_in2; //shift aritmetico
			 8'b00100111: o_res <= ~(i_in1 | i_in2); //nor
			 default: o_res<=8'b00111111;
			 endcase
		 end
		 
		 case(o_res)
			 8'b00000000: o_sseg <= 7'b1000000; //0
			 8'b00000001: o_sseg <= 7'b1111001; //1
			 8'b00000010: o_sseg <= 7'b0100100; //2
			 8'b00000011: o_sseg <= 7'b0110000; //3
			 8'b00000100: o_sseg <= 7'b0011001; //4
			 8'b00000101: o_sseg <= 7'b0010010; //5
			 8'b00000110: o_sseg <= 7'b0000010; //6
			 8'b00000111: o_sseg <= 7'b1111000; //7
			 8'b00001000: o_sseg <= 7'b0000000; //8
			 8'b00001001: o_sseg <= 7'b0010000; //9
			 default:  o_sseg <= 7'b0001001; //H
		 endcase
	 end
	 
endmodule
