`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:25:41 09/20/2015
// Design Name:   ejercicio_8
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/Lucho/problemas_secuenciales/test_ejercicio8.v
// Project Name:  problemas_secuenciales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ejercicio_8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio8;

	// Inputs
	reg [11:0] i_umbral;
	reg clock;

	// Outputs
	wire o_out;

	// Instantiate the Unit Under Test (UUT)
	ejercicio_8 uut (
		.i_umbral(i_umbral), 
		.o_out(o_out), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		i_umbral = 256;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#5000000;
		
		i_umbral = 3000;
		
		#5000000;
		
		
        
		// Add stimulus here

	end
	
	always #10
	clock = ~clock;
      
endmodule

