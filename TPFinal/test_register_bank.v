`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:32:32 10/31/2015
// Design Name:   register_bank
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/TPFinal/test_register_bank.v
// Project Name:  TPFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_bank
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_register_bank;

	// Inputs
	reg [4:0] i_r1;
	reg [4:0] i_r2;
	reg [4:0] write_register;
	reg [31:0] write_data;
	reg regwrite;
	reg clk;

	// Outputs
	wire [31:0] d1;
	wire [31:0] d2;

	// Instantiate the Unit Under Test (UUT)
	register_bank uut (
		.i_r1(i_r1), 
		.i_r2(i_r2), 
		.write_register(write_register), 
		.write_data(write_data), 
		.regwrite(regwrite), 
		.d1(d1), 
		.d2(d2), 
		.clk(clk)
	);

	always #5
	begin
		clk = ~clk;
	end
	
	initial begin
		$display("Comienza la simulacion");
		$monitor("---------------------------------\n-i_r1: ",i_r1,"\n -i_r2: ",i_r2,"\n -d1: ",d1,
		"\n -d2: ",d2,"\n---------------------------------\n");
		// Initialize Inputs
		i_r1 = 0;
		i_r2 = 1;
		write_register = 0;
		write_data = 555;
		regwrite = 1;
		clk = 0;

		#10;
        
		write_register = 1;  
		regwrite = 1;
		write_data = 222;

		#10;
		
		write_register = 2;
		
		#10;
		
		$display("Termina la simulacion");
		$finish;
	end
      
endmodule

