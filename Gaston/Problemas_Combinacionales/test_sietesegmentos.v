`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:06:40 08/21/2015
// Design Name:   sietesegmentos
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Workspace/Problemas_Combinacionales/test_sietesegmentos.v
// Project Name:  Problemas_Combinacionales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sietesegmentos
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_sietesegmentos;

	// Inputs
	reg [3:0] i_in;

	// Outputs
	wire [6:0] o_sseg;

	// Instantiate the Unit Under Test (UUT)
	sietesegmentos uut (
		.i_in(i_in), 
		.o_sseg(o_sseg)
	);

	initial begin
		// Initialize Inputs
		i_in = 0000;
		#50;
		i_in = 0001;
		#50;
		i_in = 0010;
		#50;
		i_in = 0011;
		#50;
		i_in = 0100;
		#50;
		i_in = 0101;
		#50;
		i_in = 0110;
		#50;
		i_in = 0111;
		#50;
		i_in = 1000;
		#50;
		i_in = 1001;
		#50;
		i_in = 1010;
		#50;
		i_in = 1011;
		#50;
		i_in = 1100;
		#50;
		i_in = 1101;
		#50;
		i_in = 1110;
		#50;
		i_in = 1111;
		#50;
        
		// Add stimulus here

	end
      
endmodule

