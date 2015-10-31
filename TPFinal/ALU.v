`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:42:13 10/31/2015 
// Design Name: 
// Module Name:    ALU 
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
module ALU
#(parameter N=7)
(
	input signed [N:0] input1,
	input signed [N:0] input2,
	input wire [5:0]	operation,
	output reg	[N:0]	result,
	input clk
);

	always @(posedge clk)
	begin
		 case(operation)
		 6'b100000: result <= input1 + input2;
		 6'b100010: result <= input1 - input2; //resta
		 6'b100100: result <= input1 & input2; //and
		 6'b100101: result <= input1 | input2; //or
		 6'b100110: result <= input1 ^ input2; //xor
		 6'b000011: result <= input1 >>> input2; //shift aritmetico
		 6'b000010: result <= input1 >> input2; //shift logico
		 6'b100111: result <= ~(input1 | input2); //nor
		 default: result<=8'b11111111;
		 endcase
	end


endmodule
