`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:36:56 09/20/2015
// Design Name:   ejercicio_7
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/Lucho/problemas_secuenciales/test_ejercicio7.v
// Project Name:  problemas_secuenciales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ejercicio_7
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio7;

	// Inputs
	reg clock;

	// Outputs
	wire o_signal;

	// Instantiate the Unit Under Test (UUT)
	ejercicio_7 uut (
		.o_signal(o_signal), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		clock = 0;

		// Wait 100 ns for global reset to finish
		#1000000000;
        
		// Add stimulus here

	end
	
	always #24 // 24 ns cambio de ciclo = 1/(48 ns) = 20,48MHz
	clock = ~clock;
      
endmodule

