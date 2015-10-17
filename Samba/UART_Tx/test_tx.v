`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:28:34 10/15/2015
// Design Name:   Tx
// Module Name:   S:/ArquitecturaP/Arquitectura/Samba/UART_Tx/test_tx.v
// Project Name:  UART_Tx
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Tx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_tx;

	// Inputs
	reg clk;
	reg [7:0] d_in;
	reg tx_start;

	// Outputs
	wire tx_done;
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	Tx uut (
		.clk(clk), 
		.d_in(d_in), 
		.tx_start(tx_start), 
		.tx_done(tx_done), 
		.tx(tx)
	);

	always #20
	clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		d_in = 11110000;
		tx_start = 1;
		/*
		// Wait 100 ns for global reset to finish
		#300;
        
		// Add stimulus here
		d_in = 01010101;
		tx_start = 1;

		#300;
        
		// Add stimulus here
		d_in = 10101010;
		tx_start = 1;

		// Wait 100 ns for global reset to finish
		#300;
      */

	end
      
endmodule

