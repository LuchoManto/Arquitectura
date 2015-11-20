`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:21:03 11/17/2015
// Design Name:   Pipe
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Partes TP final/fetch/test_pipe.v
// Project Name:  ipcore
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipe
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_pipe;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	Pipe uut (
		.clk(clk)
	);
	
	always #1
	begin
		clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		$display("Comienza la simulacion");
		clk = 0;

		#20;

		$display("Termina la simulacion. -Time: ",$time);
		$finish;
	end
      
endmodule

