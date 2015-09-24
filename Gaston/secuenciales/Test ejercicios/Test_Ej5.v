`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:07:25 09/24/2015
// Design Name:   Ej5
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/EjerciciosARQUI/Test_Ej5.v
// Project Name:  EjerciciosARQUI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ej5
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Ej5;

	// Inputs
	reg set;
	reg reset;
	reg clock_en;
	reg clk;

	// Outputs
	wire result;
	wire not_result;

	// Instantiate the Unit Under Test (UUT)
	Ej5 uut (
		.set(set), 
		.reset(reset), 
		.clock_en(clock_en),
		.result(result), 
		.not_result(not_result), 
		.clk(clk)
	);

	//Clock cada 10 us.
	always #10
	clk = ~clk;

	initial begin
		set = 1;
		reset = 0;
		clk = 0;
		clock_en = 0;

		#30;
		
		set = 0;
		reset = 1;
		
		#30;
		
		set = 0;
		reset = 0;
      
		#30;
		
		set = 1;
		reset = 0;
		
		#30;
		
      set = 1;
		reset = 1;
		
		#30;
		
		clock_en = 1;
		
		#30;
		
      set = 0;
		reset = 1;  
		
		#30;
		
      set = 1;
		reset = 0;  
		
	end
      
endmodule

