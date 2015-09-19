`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:21:25 09/18/2015
// Design Name:   ejercicio_5
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Workspace/ejercicios_secuenciales/test_ejercicio5.v
// Project Name:  ejercicios_secuenciales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ejercicio_5
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio5;

	// Inputs
	reg [31:0] i_in;
	reg i_en;
	reg i_rs;
	reg i_se;
	reg clock;

	// Outputs
	wire [31:0] o_out;
	wire [31:0] o_nout;

	// Instantiate the Unit Under Test (UUT)
	ejercicio_5 uut (
		.i_in(i_in), 
		.o_out(o_out), 
		.o_nout(o_nout), 
		.i_en(i_en), 
		.i_rs(i_rs), 
		.i_se(i_se), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		i_in = 0;
		i_en = 0;
		i_rs = 0;
		i_se = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#50;
		
		i_in = 10;
		
		#50;
		
		i_en = 1;
      
		#50;
		
		i_en = 0;
		i_rs = 1;
		
		#50;
		
		i_rs = 0;
		i_se = 1;
		
		#50;
		
		i_se = 0;
		
		// Add stimulus here

	end
	
	always #20
	clock = ~clock;
      
endmodule

