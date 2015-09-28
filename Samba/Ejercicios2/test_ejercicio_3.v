`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:36:47 09/14/2015
// Design Name:   Ejercicio_3
// Module Name:   S:/ArquitecturaP/Ejercicios2/test_ejercicio_3.v
// Project Name:  Ejercicios2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ejercicio_3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio_3;

	// Inputs
	reg [31:0] i_a;
	reg enable;
	reg reset;
	reg clk;

	// Outputs
	wire [31:0] o_a;

	// Instantiate the Unit Under Test (UUT)
	Ejercicio_3 uut (
		.i_a(i_a), 
		.o_a(o_a), 
		.enable(enable), 
		.reset(reset), 
		.clk(clk)
	);

	always #20
	clk =~ clk;
	
	initial begin
		// Initialize Inputs
		i_a = 5;
		enable = 0;
		reset = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#40;
        
		i_a = 2;
		enable = 1;
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#40;
		
		i_a = 9;
		enable = 1;
		reset = 0;
		clk = 1;

		// Wait 100 ns for global reset to finish
		#40;
		// Add stimulus here

	end
      
endmodule

