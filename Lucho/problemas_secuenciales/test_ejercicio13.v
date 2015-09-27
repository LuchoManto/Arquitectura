`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:16:42 09/27/2015
// Design Name:   ejercicio_13
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/Lucho/problemas_secuenciales/test_ejercicio13.v
// Project Name:  problemas_secuenciales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ejercicio_13
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio13;

	// Inputs
	reg i_signal;
	reg i_boton;
	reg [3:0] valor_pwm;
	reg clock;

	// Outputs
	wire o_pwm;

	// Instantiate the Unit Under Test (UUT)
	ejercicio_13 uut (
		.i_signal(i_signal), 
		.i_boton(i_boton), 
		.valor_pwm(valor_pwm), 
		.o_pwm(o_pwm), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		i_signal = 0;
		i_boton = 0;
		valor_pwm = 13;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		i_boton = 1;
			
		#100;
        
		// Add stimulus here

	end
	
	always #1
	clock = ~clock;
		
	always #80
	i_signal = ~i_signal;
      
endmodule

