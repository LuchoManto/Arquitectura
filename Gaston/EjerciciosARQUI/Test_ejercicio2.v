`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:55:20 09/14/2015
// Design Name:   Ejercicio2
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/EjerciciosARQUI/Test_ejercicio2.v
// Project Name:  EjerciciosARQUI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ejercicio2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_ejercicio2;

	// Inputs
	reg [13:0] a;
	reg [13:0] b;
	reg [13:0] c;
	reg clock;

	// Outputs
	wire [13:0] result;

	// Instantiate the Unit Under Test (UUT)
	Ejercicio2 uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.result(result), 
		.clock(clock)
	);
	
	always #10
	clock = ~clock;

	initial begin
		a = 3;
		b = 4;
		c = 7;
		clock = 0;

		#20;
		
		a = 8;
		b = 12;
		c = 2;
		
      #20; 
		
		a = 32;
		b = 1;
		c = 7;
		
	end
      
endmodule

