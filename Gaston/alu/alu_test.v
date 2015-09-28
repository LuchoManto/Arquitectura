`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:27:52 09/07/2015
// Design Name:   alu
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/alu/alu_test.v
// Project Name:  alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [7:0] i_op;
	reg [2:0] i_bot;
	reg clk;

	// Outputs
	wire [6:0] o_sseg;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.i_op(i_op), 
		.i_bot(i_bot), 
		.o_sseg(o_sseg), 
		.clk(clk)
	);

	initial begin

		clk = 0;
		i_bot[0] = 0;
		i_bot[1] = 0;
		i_bot[2] = 0;
		
		// Initialize Inputs
		i_op = 8'b00001101;
		#50;
		i_bot[0] = 1;
		#50;
		i_bot[0] = 0;
		#50;
		i_op = 8'b00110110;
		#50;
		i_bot[1] = 1;
		#50;
		i_bot[1] = 0;
		#50;
		i_op = 8'b00000001;
		#50;
		i_bot[2] = 1;
		#50;
		i_bot[2] = 0;
		#50;
		
		// op: suma
		//resultado: 01000011

		// Wait 100 ns for global reset to finish
		#100;
		i_op = 8'b00110010;
		#50;
		i_bot[0] = 1;
		#50;
		i_bot[0] = 0;
		#50;
		i_op = 8'b11011001;
		#50;
		i_bot[1] = 1;
		#50;
		i_bot[1] = 0;
		#50;
		i_op = 8'b00100010;
		#50;
		i_bot[2] = 1;
		#50;
		i_bot[2] = 0;
		#50;
		
		// op: resta
		//resultado: 01010101

		// Wait 100 ns for global reset to finish
		#100;
		i_op = 8'b00110010;
		#50;
		i_bot[0] = 1;
		#50;
		i_bot[0] = 0;
		#50;
		i_op = 8'b11011001;
		#50;
		i_bot[1] = 1;
		#50;
		i_bot[1] = 0;
		#50;
		i_op = 8'b00100101;
		#50;
		i_bot[2] = 1;
		#50;
		i_bot[2] = 0;
		#50;
		
		// op: or
		//resultado: 11111011

		// Wait 100 ns for global reset to finish
		#100;
		i_op = 8'b00110010;
		#50;
		i_bot[0] = 1;
		#50;
		i_bot[0] = 0;
		#50;
		i_op = 8'b11011001;
		#50;
		i_bot[1] = 1;
		#50;
		i_bot[1] = 0;
		#50;
		i_op = 8'b00100100;
		#50;
		i_bot[2] = 1;
		#50;
		i_bot[2] = 0;
		#50;
		
		// op: and
		//resultado: 00010000

		// Wait 100 ns for global reset to finish
		#100;
		i_op = 8'b00110010;
		#50;
		i_bot[0] = 1;
		#50;
		i_bot[0] = 0;
		#50;
		i_op = 8'b11011001;
		#50;
		i_bot[1] = 1;
		#50;
		i_bot[1] = 0;
		#50;
		i_op = 8'b00100111;
		#50;
		i_bot[2] = 1;
		#50;
		i_bot[2] = 0;
		#50;
		
		// op: nor
		//resultado: 00000100

		// Wait 100 ns for global reset to finish
		#100;
		i_op = 8'b00110010;
		#50;
		i_bot[0] = 1;
		#50;
		i_bot[0] = 0;
		#50;
		i_op = 8'b11011001;
		#50;
		i_bot[1] = 1;
		#50;
		i_bot[1] = 0;
		#50;
		i_op = 8'b00100110;
		#50;
		i_bot[2] = 1;
		#50;
		i_bot[2] = 0;
		#50;
		
		// op: xor
		//resultado: 11101011

		// Wait 100 ns for global reset to finish
		#100;
		i_op = 8'b10110010;
		#50;
		i_bot[0] = 1;
		#50;
		i_bot[0] = 0;
		#50;
		i_op = 8'b00000010;
		#50;
		i_bot[1] = 1;
		#50;
		i_bot[1] = 0;
		#50;
		i_op = 8'b00000010;
		#50;
		i_bot[2] = 1;
		#50;
		i_bot[2] = 0;
		#50;
		
		// op: shift aritmetico derecha
		//resultado: 00101100

		// Wait 100 ns for global reset to finish
		#100;
		i_op = 8'b10110010;
		#50;
		i_bot[0] = 1;
		#50;
		i_bot[0] = 0;
		#50;
		i_op = 8'b00000010;
		#50;
		i_bot[1] = 1;
		#50;
		i_bot[1] = 0;
		#50;
		i_op = 8'b00000011;
		#50;
		i_bot[2] = 1;
		#50;
		i_bot[2] = 0;
		#50;
		
		// op: shift logico derecha
		//resultado: 11101100

		// Wait 100 ns for global reset to finish
		#100;		
		i_op = 8'b10110010;
		#50;
		i_bot[0] = 1;
		#50;
		i_bot[0] = 0;
		#50;
		i_op = 8'b00000000;
		#50;
		i_bot[1] = 1;
		#50;
		i_bot[1] = 0;
		#50;
		i_op = 8'b00000010;
		#50;
		i_bot[2] = 1;
		#50;
		i_bot[2] = 0;
		#50;
		
		// op: shift aritmetico derecha
		//resultado: 10110010

		// Wait 100 ns for global reset to finish
		#100;
		i_op = 8'b10110010;
		#50;
		i_bot[0] = 1;
		#50;
		i_bot[0] = 0;
		#50;
		i_op = 8'b00000000;
		#50;
		i_bot[1] = 1;
		#50;
		i_bot[1] = 0;
		#50;
		i_op = 8'b00000011;
		#50;
		i_bot[2] = 1;
		#50;
		i_bot[2] = 0;
		#50;
		
		// op: shift logico derecha
		//resultado: 10110010

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// Add stimulus here
	end		
      		// Add stimulus here
		always 
		begin
		#20
		clk = ~clk;
		end
      
endmodule
