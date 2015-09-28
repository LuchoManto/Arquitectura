`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:34:29 08/21/2015
// Design Name:   Multiplexor
// Module Name:   S:/ArquitecturaP/Multiplexor/test_multiplexor.v
// Project Name:  Multiplexor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multiplexor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_multiplexor;

	// Inputs
	reg i_a;
	reg i_b;
	reg i_c;
	reg i_d;
	reg [0:1] i_con;

	// Outputs
	wire o_a;

	// Instantiate the Unit Under Test (UUT)
	Multiplexor uut (
		.i_a(i_a), 
		.i_b(i_b), 
		.i_c(i_c), 
		.i_d(i_d), 
		.i_con(i_con), 
		.o_a(o_a)
	);

	initial begin
		// Initialize Inputs
		i_a = 1;
		i_b = 0;
		i_c = 1;
		i_d = 0;
		i_con = 00;
		// Wait 100 ns for global reset to finish
		#100;
      
		i_con = 01;
		// Wait 100 ns for global reset to finish
		#100;
		
		i_con = 10;
		// Wait 100 ns for global reset to finish
		#100;
		
		i_con = 11;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here

	end
      
endmodule

