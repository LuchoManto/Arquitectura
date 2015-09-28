`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:13:09 08/31/2015
// Design Name:   Clock
// Module Name:   S:/ArquitecturaP/Clock/test_clock.v
// Project Name:  Clock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Clock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_clock;

	// Inputs
	reg b;
	reg clk;

	// Outputs
	wire a;

	// Instantiate the Unit Under Test (UUT)
	Clock uut (
		.b(b), 
		.a(a), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		b = 1;
		clk = 0;

			
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		b=0;
		#100;
		// Add stimulus here
		b=1;
		#100;
		// Add stimulus here
		b=0;
		#100;
		// Add stimulus here
		b=1;
		end
			
	always  #20 clk =~clk;
endmodule

