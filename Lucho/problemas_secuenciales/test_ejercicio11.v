`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:15:56 09/21/2015
// Design Name:   ejercicio_11
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/Lucho/problemas_secuenciales/test_ejercicio11.v
// Project Name:  problemas_secuenciales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ejercicio_11
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio11;

	// Inputs
	reg i_signal;
	reg clock;

	// Outputs
	wire [7:0] o_periodo;

	// Instantiate the Unit Under Test (UUT)
	ejercicio_11 uut (
		.i_signal(i_signal), 
		.o_periodo(o_periodo), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		i_signal = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #20
	clock = ~clock;
	
	always #1000000
	i_signal = ~i_signal;
      
endmodule

