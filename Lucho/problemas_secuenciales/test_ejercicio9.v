`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:30:28 09/24/2015
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
	reg D_in0;
	reg D_in1;
	reg D_in2;
	reg clock;

	// Outputs
	wire [7:0] cont_out;
	wire [7:0] cont_nout;

	// Instantiate the Unit Under Test (UUT)
	ejercicio_9 uut (
		.cont_out(cont_out), 
		.cont_nout(cont_nout), 
		.cont_enable(cont_enable), 
		.cont_reset(cont_reset), 
		.D_in0(D_in0), 
		.D_in1(D_in1), 
		.D_in2(D_in2), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		cont_enable = 1;
		cont_reset = 0;
		D_in0 = 0;
		D_in1 = 0;
		D_in2 = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#200;
        
		// Add stimulus here

	end
	
	always #10
	clock = ~clock;
      
endmodule

