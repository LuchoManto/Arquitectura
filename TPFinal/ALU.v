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
module alu
#(parameter N=32)
(
	input signed [N-1:0] input1,
	input signed [N-1:0] input2,
	input wire [3:0]	operation,
	output reg	[N-1:0]	result
//	output reg zero
);

	

	always @(*)
	begin
		 case(operation)
		 4'b0000: 	result <= input1 + input2; // suma
		 4'b0001: 	result <= input1 - input2; //resta
		 4'b0010: 	result <= input1 & input2; //and
		 4'b0011: 	result <= input1 | input2; //or
		 4'b0100: 	result <= input1 ^ input2; //xor
		 4'b0101: 	result <= ~(input1 | input2); //nor
		 4'b0110: 	result <= input1 << input2; //shift logico izquierza 
		 4'b0111: 	result <= input1 >> input2;//shift logico derecha.
		 4'b1000: 	result <= input1 >>> input2; //shift aritmetico derecha
		 4'b1001:	begin
							if (input1 <= input2)
								result <= 1;
							else 
								result <= 0;
						end
		 default: 	result <= result;
		 endcase
		 
//		 if(result == 0)
//			zero <= 1;
//		 else
//			zero <= 0;
	end


endmodule
