`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:36:52 08/20/2015
// Design Name:   halfAdder
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Workspace/Problemas_Combinacionales/test_halfAdder.v
// Project Name:  Problemas_Combinacionales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: halfAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_halfAdder;

	// Inputs
	reg i_a;
	reg i_b;

	// Outputs
	wire o_res;
	wire o_carry;

	// Instantiate the Unit Under Test (UUT)
	halfAdder uut (
		.i_a(i_a), 
		.i_b(i_b), 
		.o_res(o_res), 
		.o_carry(o_carry)
	);

	initial begin
		// Initialize Inputs
		i_a = 0;
		i_b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		i_a = 0;
		i_b = 1;

		// Wait 100 ns for global reset to finish
		#100;
		i_a = 1;
		i_b = 0;

		// Wait 100 ns for global reset to finish
		#100;
		i_a = 1;
		i_b = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

