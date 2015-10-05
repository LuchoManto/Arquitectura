`timescale 1ns / 1ps
/*
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:44:43 10/04/2015 
// Design Name: 
// Module Name:    problema10 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
10) Realizar una Unidad Aritmetica y Lógica (ALU) con las siguientes características:
? La ALU debe ser parametrizable (bus de datos) para poder ser utilizada posteriormente en el trabajo final.
? La ALU deberá realizar las siguientes operaciones:
Operacion 	Codigo
ADD			100000
SUB			100010
AND			100100
OR				100101
XOR			100110
SRA			000011
SRL			000010
NOR			100111

// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
*/
module problema10
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
