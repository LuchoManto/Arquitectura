`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:52:26 08/21/2015
// Design Name:   Multiplexor_reset
// Module Name:   S:/ArquitecturaP/Multiplexor_reset/test_multiplexor_rst.v
// Project Name:  Multiplexor_reset
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Multiplexor_reset
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_multiplexor_rst;

	// Inputs
	reg i_a;
	reg i_b;
	reg i_c;
	reg i_d;
	reg [0:1] i_con;
	reg rs;

	// Outputs
	wire o_a;

	// Instantiate the Unit Under Test (UUT)
	Multiplexor_reset uut (
		.i_a(i_a), 
		.i_b(i_b), 
		.i_c(i_c), 
		.i_d(i_d), 
		.i_con(i_con), 
		.o_a(o_a), 
		.rs(rs)
	);

	initial begin
		// Initialize Inputs
		i_a = 1;
		i_b = 0;
		i_c = 0;
		i_d = 1;
		
		i_con = 01;
		rs = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		i_con = 00;
		rs = 0;
		// Wait 100 ns for global reset to finish
		#100;
		
		i_con = 11;
		rs = 0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here

		i_con = 11;
		rs = 1; 

		// Wait 100 ns for global reset to finish
		#100;
	end
      
endmodule

