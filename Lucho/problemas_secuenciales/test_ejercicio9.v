`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:43:31 09/22/2015
// Design Name:   ejercicio_9
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/Lucho/problemas_secuenciales/test_ejercicio9.v
// Project Name:  problemas_secuenciales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ejercicio_9
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio9;

	// Inputs
	reg cont_enable;
	reg cont_reset;
	reg clock;

	// Outputs
	wire [7:0] cont_out;
	wire [7:0] cont_nout;
	wire cable0;
	wire cable1;
	wire cable2;

	// Instantiate the Unit Under Test (UUT)
	ejercicio_9 uut (
		.cont_out(cont_out), 
		.cont_nout(cont_nout), 
		.cont_enable(cont_enable), 
		.cont_reset(cont_reset), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		cont_enable = 0;
		cont_reset = 0;
		clock = 0;
//		cable0 = 0;
//		cable1 = 0;
//		cable2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #10
	clock = ~clock;
      
endmodule

