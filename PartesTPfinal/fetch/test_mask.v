`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:06:00 11/20/2015
// Design Name:   mask_MemReadM
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Partes TP final/fetch/test_mask.v
// Project Name:  ipcore
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mask_MemReadM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mask;

	// Inputs
	reg [31:0] ReadDataM;
	reg [1:0] MemReadM;

	// Outputs
	wire [31:0] ReadData;

	// Instantiate the Unit Under Test (UUT)
	mask_MemReadM uut (
		.ReadDataM(ReadDataM), 
		.MemReadM(MemReadM), 
		.ReadData(ReadData)
	);

	initial begin
		// Initialize Inputs
		ReadDataM = 'hFFFFFFFF;
		MemReadM = 0;

		#2;
        
		MemReadM = 1; 
		#2;

		MemReadM = 2; 
		#2;
		
		MemReadM = 3; 
		#2;
		
		$finish;

	end
      
endmodule

