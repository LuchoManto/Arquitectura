`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:55:13 09/14/2015
// Design Name:   ejercicio_2
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Workspace/ejercicios_secuenciales/test_ejercicio2.v
// Project Name:  ejercicios_secuenciales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ejercicio_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio2;

	// Inputs
	reg [13:0] i_a;
	reg [13:0] i_b;
	reg [13:0] i_c;
	reg clock;

	// Outputs
	wire [13:0] result;

	// Instantiate the Unit Under Test (UUT)
	ejercicio_2 uut (
		.i_a(i_a), 
		.i_b(i_b), 
		.i_c(i_c), 
		.result(result), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		i_a = 3;
		i_b = 4;
		i_c = 5;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		
		i_a = 6;
		i_b = 3;
		i_c = 4;
		
		#100;
        
		i_a = 3;
		i_b = 7;
		i_c = 4;
		
		#100;
		// Add stimulus here

	end
	
		always #10
		clock = ~clock;
      
endmodule

