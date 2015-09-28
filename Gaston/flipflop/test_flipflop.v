`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:17:27 08/31/2015
// Design Name:   flipflop
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/flipflop/test_flipflop.v
// Project Name:  flipflop
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: flipflop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_flipflop;

	// Inputs
	reg clk;
	reg i_valor;
	reg [2:0]contador;

	// Outputs
	wire o_valor;

	// Instantiate the Unit Under Test (UUT)
	flipflop uut (
		.clk(clk), 
		.i_valor(i_valor), 
		.o_valor(o_valor)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		i_valor = 0;
		#20;
		i_valor = 1;
		contador = 0;
	end
	
	always begin
		clk = ~clk;
		#20;
		contador = contador + 1;
		if(contador == 7)
		begin
			i_valor = ~i_valor;
			contador = 0;
		end
	end
      
endmodule

