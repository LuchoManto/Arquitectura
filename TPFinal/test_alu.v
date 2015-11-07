`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:14:35 10/31/2015
// Design Name:   ALU
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/TPFinal/test_alu.v
// Project Name:  TPFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_alu;

	// Inputs
	reg [31:0] input1;
	reg [31:0] input2;
	reg [5:0] operation;
	reg clk;

	// Outputs
	wire [31:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.input1(input1), 
		.input2(input2), 
		.operation(operation), 
		.result(result), 
		.zero(zero), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		input1 = 32'hFFFFFF21;
		input2 = 32'hFFFFFF01;
		operation = 6'b100000;
		clk = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
		
		input1 = 32'hFFFFFFFF;
		input2 = 32'h1;
		operation = 6'b100000;
		
		#100;
        
		// Add stimulus here

	end
	
	always #20
	clk = ~clk;
      
endmodule

