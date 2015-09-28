`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:58:49 09/21/2015
// Design Name:   Ejercicio_6
// Module Name:   S:/ArquitecturaP/Ejercicios2/test_ejercicio_6.v
// Project Name:  Ejercicios2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ejercicio_6
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio_6;

	// Inputs
	reg clk;

	// Outputs
	wire control;

	// Instantiate the Unit Under Test (UUT)
	Ejercicio_6 uut (
		.clk(clk), 
		.control(control)
	);

	always #20
		clk = ~clk;
		
		
	initial begin
		// Initialize Inputs
		//contro = 00000;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

