`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:41:35 11/10/2015
// Design Name:   signExtend
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/Lucho/SignExtend/test_signextend.v
// Project Name:  SignExtend
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: signExtend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_signextend;

	// Inputs
	reg [15:0] in;
	reg clk;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	signExtend uut (
		.in(in), 
		.out(out), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		in = 10000;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#50;
		
		in = 65530;
		
		#50;
        
		// Add stimulus here

	end
	
	
	always #10
	clk = ~clk;
      
endmodule

