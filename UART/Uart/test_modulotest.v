`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:11:08 10/19/2015
// Design Name:   test
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/UART/Uart/test_modulotest.v
// Project Name:  Uart
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_modulotest;

	// Inputs
	reg [7:0] r_data;
	reg rx_empty;
	reg tx_full;
	reg clk;

	// Outputs
	wire rd;
	wire [7:0] w_data;
	wire wr;

	// Instantiate the Unit Under Test (UUT)
	test uut (
		.r_data(r_data), 
		.rd(rd), 
		.rx_empty(rx_empty), 
		.w_data(w_data), 
		.wr(wr), 
		.tx_full(tx_full), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		r_data = 0;
		rx_empty = 0;
		tx_full = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		r_data = 11001001;
		#30;
		rx_empty = 0;
		#20;
		rx_empty = 1;
		#40;
		tx_full = 0;
		
		
		
		
        
		// Add stimulus here

	end
	
	always #5
	clk = ~clk;
      
endmodule

