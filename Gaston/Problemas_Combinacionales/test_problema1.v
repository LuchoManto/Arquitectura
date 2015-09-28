`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:41:45 08/13/2015
// Design Name:   problema1
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Workspace/Problemas_Combinacionales/test_problema1.v
// Project Name:  Problemas_Combinacionales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: problema1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_problema1;

	// Inputs
	reg i_a;
	reg i_b;
	reg i_c;
	reg i_d;
	reg rs;
	reg [0:1] i_con;

	// Outputs
	wire o_y;

	// Instantiate the Unit Under Test (UUT)
	problema1 uut (
		.i_a(i_a), 
		.i_b(i_b), 
		.i_c(i_c), 
		.i_d(i_d), 
		.i_con(i_con), 
		.rs(rs),
		.o_y(o_y)
	);

	initial begin
		// Initialize Inputs
		i_a = 1;
		i_b = 0;
		i_c = 1;
		i_d = 1;
		rs = 0;
		
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
		
		
		rs = 1;
		
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

