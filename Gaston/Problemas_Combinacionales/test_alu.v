`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:41:39 08/23/2015
// Design Name:   alu
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Workspace/Problemas_Combinacionales/test_alu.v
// Project Name:  Problemas_Combinacionales
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

module test_alu;

	// Inputs
	reg [5:0] i_op;
	reg [7:0] i_in1;
	reg [7:0] i_in2;

	// Outputs
	wire [7:0] o_res;
	wire o_cout;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.i_op(i_op), 
		.i_in1(i_in1), 
		.i_in2(i_in2), 
		.o_res(o_res), 
		.o_cout(o_cout)
	);

	initial begin
		// Initialize Inputs
		i_in1 = 8'b00001101;
		i_in2 = 8'b00110110;
		i_op = 6'b100000;
		
		// op: suma
		//resultado: 01000011

		// Wait 100 ns for global reset to finish
		#100;
		
		
		i_in1 = 8'b10000000;
		i_in2 = 8'b10000000;
		i_op = 6'b100000;
		
		// op: suma
		//resultado: 00000000 con carry 1

		// Wait 100 ns for global reset to finish
		#100;
		i_in1 = 8'b00110010;
		i_in2 = 8'b11011001;
		i_op = 6'b100010;
		
		// op: substact
		//resultado: 01010101

		// Wait 100 ns for global reset to finish
		#100;
		i_in1 = 8'b00110010;
		i_in2 = 8'b11011001;
		i_op = 6'b100101;
		
		// op: or
		//resultado: 11111011

		// Wait 100 ns for global reset to finish
		#100;
		i_in1 = 8'b00110010;
		i_in2 = 8'b11011001;
		i_op = 6'b100100;
		
		// op: and
		//resultado: 00010000

		// Wait 100 ns for global reset to finish
		#100;
		i_in1 = 8'b00110010;
		i_in2 = 8'b11011001;
		i_op = 6'b100111;
		
		// op: nor
		//resultado: 00000100

		// Wait 100 ns for global reset to finish
		#100;
		i_in1 = 8'b00110010;
		i_in2 = 8'b11011001;
		i_op = 6'b100110;
		
		// op: xor
		//resultado: 11101011

		// Wait 100 ns for global reset to finish
		#100;
		i_in1 = 8'b10110010;
		i_in2 = 8'b00000010;
		i_op = 6'b000010;
		
		// op: shift logico derecha
		//resultado: 00101100

		// Wait 100 ns for global reset to finish
		#100;
		i_in1 = 8'b10110010;
		i_in2 = 8'b00000010;
		i_op = 6'b000011;
		
		// op: shift aritmetico derecha
		//resultado: 11101100

		// Wait 100 ns for global reset to finish
		#100;		
		
		
		i_in1 = 8'b10110010;
		i_in2 = 8'b00000000;
		i_op = 6'b000010;
		
		// op: shift logico derecha
		//resultado: 10110010

		// Wait 100 ns for global reset to finish
		#100;
		i_in1 = 8'b10110010;
		i_in2 = 8'b00000000;
		i_op = 6'b000011;
		
		// op: shift aritmetico derecha
		//resultado: 10110010

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

