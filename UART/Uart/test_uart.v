`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:14:30 10/17/2015
// Design Name:   uart
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/UART/Uart/test_uart.v
// Project Name:  Uart
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_uart;

	// Inputs
	reg rx;
	reg clock;

	// Outputs
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	uart uut (
		.rx(rx), 
		.tx(tx), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		rx = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

