`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:13:45 10/17/2015
// Design Name:   baudrate_gen
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/UART/Uart/test_baudrate_gen.v
// Project Name:  Uart
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: baudrate_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_baudrate_gen;

	// Inputs
	reg clock;

	// Outputs
	wire baud;

	// Instantiate the Unit Under Test (UUT)
	baudrate_gen uut (
		.clock(clock), 
		.baud(baud)
	);

	initial begin
		// Initialize Inputs
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #20
	clock = ~clock;
      
endmodule

