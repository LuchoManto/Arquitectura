`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:08:31 09/17/2015
// Design Name:   ejercicio_4
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Workspace/ejercicios_secuenciales/test_ejercicio4.v
// Project Name:  ejercicios_secuenciales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ejercicio_4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio4;

	// Inputs
	reg [9:0] i_ent;
	reg i_rs;
	reg clk;

	// Outputs
	wire [7:0]o_res;

	// Instantiate the Unit Under Test (UUT)
	ejercicio_4 uut (
		.i_ent(i_ent), 
		.i_rs(i_rs), 
		.o_res(o_res), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		i_ent = 0;
		i_rs = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#50;
		
		i_ent = 4;
		#50;
        
		i_ent = 6;
		#50;
		
		i_ent = 10;
		#50;
		
		i_rs = 1;
		#50;
		i_rs = 0;
		
		#50;
		i_ent = 4;
		#50;
		// Add stimulus here

	end
	
		always #10
		clk = ~clk;
      
endmodule

