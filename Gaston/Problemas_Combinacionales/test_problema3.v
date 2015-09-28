`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:55:08 08/20/2015
// Design Name:   problema3
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Workspace/Problemas_Combinacionales/test_problema3.v
// Project Name:  Problemas_Combinacionales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: problema3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_problema3;

	// Inputs
	reg [3:0] i_in;
	reg [1:0] i_con;

	// Outputs
	wire o_y;

	// Instantiate the Unit Under Test (UUT)
	problema3 uut (
		.i_in(i_in), 
		.i_con(i_con), 
		.o_y(o_y)
	);

	initial begin
		// Initialize Inputs
		i_in[0] = 0;
		i_in[1] = 1;
		i_in[2] = 0;
		i_in[3] = 1;

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

