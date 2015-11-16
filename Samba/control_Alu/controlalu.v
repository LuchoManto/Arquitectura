`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:20 11/16/2015 
// Design Name: 
// Module Name:    controlalu 
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
module controlalu(
	input wire [5:0]Opcode,
	input wire [5:0]Inst_op,
	input wire clk,
	output reg [3:0]AluControl,
	output reg regW,
	output reg MemReg,
	output reg memWritte,
	output reg Branch,
	output reg AluSrc,
	output reg RegD
	 );

always @(posedge clk)
begin
	case(Inst_op)
	6'b 000000: 							//Operacion del tipo R
					regW 			<= 1;
					RegD 			<= 1;
					AluSrc 		<= 0;
					Branch 		<= 0;
					memWritte 	<= 0;
					memReg 		<= 0;
					if(Opcode == 'b100000) //ADD
					AluControl <= 'b0001;
					if(Opcode == 'b100100) //AND
					AluControl <= 'b0000;
					if(Opcode == 'b000000) //SLL SHIFT LOGICAL LEFT
					AluControl <= 'b0100;
					if(Opcode == 'b000010) //SRL SHIFT LOGICAL RIGHT
					AluControl <= 'b0100;
					if(Opcode == 'b000011) //SRA SHIT ARITMETIC RIGHT
					AluControl <= 'b0011;
					if(Opcode == 'b000110) //SRLV SHIFT LOGICAL RIGHT VARIABLE
					AluControl <= //;
					if(Opcode == 'b000111) //SRAV SHIFT ARITMETIC RIGHT VARIABLE
					AluControl <= //;
					if(Opcode == 'b000100) //SLLV SHIFT LEFT WORD BY VARIABLE
					AluControl <= //;
					if(Opcode == 'b100010) //SUB 
					AluControl <= 'b0010;
					if(Opcode == 'b)
					
					
	6'b 100011: 							//Operacion del tipo Load.
					regW 			<= 1;
					RegD 			<= 0;
					AluSrc 		<= 1;
					Branch 		<= 0;
					memWritte 	<= 0;
					memReg 		<= 1;
					AluControl 	<= 0000;				
	6'b 101011: 							//Operacion del tipo Storage.
					regW 			<= 0;
					RegD 			<= 0;
					AluSrc 		<= 1;
					Branch 		<= 0;
					memWritte 	<= 1;
					memReg 		<= 0;
					AluControl 	<= 0000;
	6'b 000100: 							//Operacion del tipo BEQ
					regW 			<= 0;
					RegD 			<= 0;
					AluSrc 		<= 0;
					Branch 		<= 1;
					memWritte 	<= 0;
					memReg 		<= 0;
					AluControl 	<= 0001;
 	6'b 001000:								//Operacion del tipo ADDI
					regW 			<= 1;
					RegD 			<= 0;
					AluSrc 		<= 1;
					Branch 		<= 0;
					memWritte 	<= 0;
					memReg 		<= 0;
					AluControl 	<= 0000;
end


endmodule
