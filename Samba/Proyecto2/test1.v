`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:44:40 08/10/2015
// Design Name:   modulo2
// Module Name:   S:/ArquitecturaP/Proyecto2/test1.v
// Project Name:  Proyecto2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: modulo2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test1;

	// Inputs
	reg a;
	reg b;
	reg c;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	modulo2 uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 1;
		b = 1;
		c = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

