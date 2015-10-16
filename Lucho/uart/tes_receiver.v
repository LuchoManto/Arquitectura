`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:09:22 10/15/2015
// Design Name:   receiver
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/Lucho/uart/tes_receiver.v
// Project Name:  uart
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: receiver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tes_receiver;

	// Inputs
	reg rx;
	reg clk;

	// Outputs
	wire [8:0] d_out;
	wire rx_done;

	// Instantiate the Unit Under Test (UUT)
	receiver uut (
		.rx(rx), 
		.clk(clk), 
		.d_out(d_out), 
		.rx_done(rx_done)
	);

	initial begin
		// Initialize Inputs
		rx = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#20;
		
		// byte: 01100110
		rx = 0;
		#2;
		rx = 0;
		#2;
		rx = 1;
		#2;
		rx = 1;
		#2;
		rx = 0;
		#2;
		rx = 0;
		#2;
		rx = 1;
		#2;
		rx = 1;
		#2;
		rx = 0;
		#2;
		rx = 1;
		#2;
		
        
		// Add stimulus here

	end
	
	
	always #20
	clk = ~clk;
      
endmodule

