`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:56 09/07/2015 
// Design Name: 
// Module Name:    alu_ope 
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
module alu_ope
	(	 
	input signed [7:0]input1,
	input signed [7:0]input2,
	input wire [7:0]operation,
	output reg [7:0]result
    );
	 
	always @(*)
	begin
		 case(operation)
		 8'b00000001: result <= input1 + input2;
		 8'b00100010: result <= input1 + ~input2 + 1; //resta
		 8'b00100100: result <= input1 & input2; //and
		 8'b00100101: result <= input1 | input2; //or
		 8'b00100110: result <= input1 ^ input2; //xor
		 8'b00000011: result <= input1 >> input2; //shift logico
		 8'b00000010: result <= input1 >>> input2; //shift aritmetico
		 8'b00100111: result <= ~(input1 | input2); //nor
		 default: result<=8'b11111111;
		 endcase
	end

endmodule
