`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:59:19 11/18/2015
// Design Name:   Pipe
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Partes TP final/fetch/testt.v
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

module testt;

	// Inputs
	reg clk;
	reg inicio;

	// Outputs
	wire Test;

	// Instantiate the Unit Under Test (UUT)
	Pipe uut (
		.clk(clk), 
		.inicio(inicio), 
		.Test(Test)
	);
		
		
	always #1
		clk = ~clk;

	reg [255:0] i=0;
	
	initial begin
		// Initialize Inputs
		$display("Comienza la simulacion");
		clk = 0;
		inicio = 1;
		
		#2;
		
		inicio = 0;
		
		
		for (i=0; i<40; i=i+1)
		begin
			#2;
			$finish;
		end
		
		
		

		#40;

		$display("Termina la simulacion. -Time: ",$time);
		$finish;
	end
      
endmodule

