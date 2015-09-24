`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:36:44 09/14/2015
// Design Name:   Ejercicio3
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/EjerciciosARQUI/Test_ejercicio3.v
// Project Name:  EjerciciosARQUI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ejercicio3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_ejercicio3;

	// Inputs
	reg [31:0] input_signal;
	reg clock_enable;
	reg reset;
	reg clock;

	// Outputs
	wire [31:0] output_register;

	// Instantiate the Unit Under Test (UUT)
	Ejercicio3 uut (
		.input_signal(input_signal), 
		.output_register(output_register), 
		.clock_enable(clock_enable), 
		.reset(reset), 
		.clock(clock)
	);
	
	always #10
	clock = ~clock;

	initial begin
		input_signal = 10'b1111111111;
		clock_enable = 0;
		reset = 0;
		clock = 0;

		#40;
        
		input_signal = 10'b1111111111;
		clock_enable = 1;
		reset = 0;
		
		#40;
		
		input_signal = 10'b1111111111;
		clock_enable = 1;
		reset = 1;
	end
      
endmodule

