`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:18:49 11/18/2015 
// Design Name: 
// Module Name:    alu_exec 
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
module alu_exec
(
	input signed [31:0]SrcAE,
	input signed [31:0]SrcBE,
	input wire [3:0]ALUControlIE,
	output reg	[31:0]ALUOut
//	output reg zero
);

	

	always @(*)
	begin
		 case(ALUControlIE)
			 4'b0000: 	ALUOut <= SrcAE + SrcBE; // suma
			 4'b0001: 	ALUOut <= SrcAE - SrcBE; //resta
			 4'b0010: 	ALUOut <= SrcAE & SrcBE; //and
			 4'b0011: 	ALUOut <= SrcAE | SrcBE; //or
			 4'b0100: 	ALUOut <= SrcAE ^ SrcBE; //xor
			 4'b0101: 	ALUOut <= ~(SrcAE | SrcBE); //nor
			 4'b0110: 	ALUOut <= SrcAE << SrcBE; //shift logico izquierza 
			 4'b0111: 	ALUOut <= SrcAE >> SrcBE;//shift logico derecha.
			 4'b1000: 	ALUOut <= SrcAE >>> SrcBE; //shift aritmetico derecha
			 4'b1001:	begin  //SLT
								if(SrcAE <= SrcBE)
									ALUOut <= 1;
								else 
									ALUOut <= 0;
							end
		 default: 	ALUOut <= ALUOut;
		 endcase
		 
//		 if(result == 0)
//			zero <= 1;
//		 else
//			zero <= 0;
	end


endmodule