`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:11:17 09/14/2015
// Design Name:   Ejercicio_2
// Module Name:   S:/ArquitecturaP/Ejercicios2/test_ejercicio_2.v
// Project Name:  Ejercicios2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ejercicio_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio_2;

	// Inputs
	reg [13:0] i_a;
	reg [13:0] i_b;
	reg [13:0] i_c;
	reg clk;

	// Outputs
	wire [13:0] o_1;

	// Instantiate the Unit Under Test (UUT)
	Ejercicio_2 uut (
		.i_a(i_a), 
		.i_b(i_b), 
		.i_c(i_c), 
		.o_1(o_1), 
		.clk(clk)
	);

	always #20
	clk =~clk;
	initial begin
		// Initialize Inputs
		i_a = 1;
		i_b = 4;
		i_c = 3;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		i_a = 4;
		i_b = 5;
		i_c = 9;
		clk = 0;
		
		#100;
        		
		// Add stimulus here

	end
      
endmodule

