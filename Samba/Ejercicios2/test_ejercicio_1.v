`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:38:59 09/14/2015
// Design Name:   Ejercicio_1
// Module Name:   S:/ArquitecturaP/Ejercicios2/test_ejercicio_1.v
// Project Name:  Ejercicios2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ejercicio_1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio_1;

	// Inputs
	reg [31:0] i_a;
	reg clk;

	// Outputs
	wire [31:0] o_a;

	// Instantiate the Unit Under Test (UUT)
	Ejercicio_1 uut (
		.i_a(i_a), 
		.o_a(o_a), 
		.clk(clk)
	);

	always #20
			clk=~clk;
	initial begin
		// Initialize Inputs
		i_a = 0;
		clk = 0;
		// Wait 100 ns for global reset to finish
		
		
		#100;
      i_a = 1;  
		// Add stimulus here

	end
      
endmodule

