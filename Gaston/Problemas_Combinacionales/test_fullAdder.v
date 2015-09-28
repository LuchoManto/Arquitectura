`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:30:02 08/21/2015
// Design Name:   fullAdder
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Workspace/Problemas_Combinacionales/test_fullAdder.v
// Project Name:  Problemas_Combinacionales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fullAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fullAdder;

	// Inputs
	reg i_a;
	reg i_b;
	reg i_cin;

	// Outputs
	wire o_res;
	wire o_cout;

	// Instantiate the Unit Under Test (UUT)
	fullAdder uut (
		.i_a(i_a), 
		.i_b(i_b), 
		.i_cin(i_cin), 
		.o_res(o_res), 
		.o_cout(o_cout)
	);

	initial begin
		// Initialize Inputs
		i_a = 0;
		i_b = 0;
		i_cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		  
		i_a = 0;
		i_b = 0;
		i_cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		i_a = 0;
		i_b = 1;
		i_cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		i_a = 0;
		i_b = 1;
		i_cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		i_a = 1;
		i_b = 0;
		i_cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		i_a = 1;
		i_b = 0;
		i_cin = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		i_a = 1;
		i_b = 1;
		i_cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		i_a = 1;
		i_b = 1;
		i_cin = 1;

		// Wait 100 ns for global reset to finish
		#100;

	end
      
endmodule

