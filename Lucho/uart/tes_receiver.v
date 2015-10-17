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
	wire [7:0] d_out;
	wire rx_done;

	// Instantiate the Unit Under Test (UUT)
	receiver uut (
		.rx(rx), 
		.clk(clk), 
		.d_out(d_out), 
		.rx_done(rx_done)
	);

	initial begin
		$monitor("---------------------------------\n-current_state: ",uut.current_state,"\n -d_out(salida): ",d_out,"\n -buffer: ",uut.buffer,"\n -s: ",uut.s,"\n -n: ",uut.n,"\n -rx: ",rx,"\n -rx_done: ",rx_done,"\n---------------------------------\n");
		// Initialize Inputs
		rx = 1;
		clk = 1;
		#20;
		rx = 0; // start bit
		// Wait 100 ns for global reset to finish
		#30;
		
		// byte: 11011100
		rx = 1;
		#30;
		rx = 0;
		#30;
		rx = 1;
		#30;
		rx = 0;
		#30;
		rx = 1;
		#30;
		rx = 0;
		#30;
		rx = 1;
		#30;
		rx = 0;
		#30;
		rx = 1; // stop bit
		#30;
		
        
		// Add stimulus here

	end
	
	
	always #1
	clk = ~clk;
      
endmodule

