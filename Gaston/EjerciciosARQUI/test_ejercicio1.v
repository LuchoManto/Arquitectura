`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:02:28 10/05/2015
// Design Name:   Ejercicio1
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Gaston/EjerciciosARQUI/test_ejercicio1.v
// Project Name:  EjerciciosARQUI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ejercicio1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ejercicio1;

	// Inputs
	reg [31:0] input_signal;
	reg clock;

	// Outputs
	wire [31:0] output_register;

	// Instantiate the Unit Under Test (UUT)
	Ejercicio1 uut (
		.input_signal(input_signal), 
		.output_register(output_register), 
		.clock(clock)
	);

	function check_result(input [31:0] val_deseado);
	begin
		if(input_signal != output_register) 
		begin
			$display("Error en valor output, deberia ser:",input_signal,", y vale:",output_register," -Tiempo:",$time);
			$finish;
		end
	end
	endfunction

	always #5
		clock = ~clock;
		
	reg finish = 0;
 
	initial begin
		$display("Comienza la simulacion");
		//$monitor(" -Tiempo:",$time);

		input_signal = 0;
		clock = 0;
		
		while(finish == 0)
		begin
			#10;
			check_result(0);
			
			if(!(input_signal%1000000))
			begin
				$display("-input:",input_signal," -output:",output_register," -Tiempo:",$time);
			end
			
			input_signal = input_signal + 1;
			if(input_signal == 0)
				finish = 1;
		end
		

		$display("Finaliza la simulación. -Tiempo:",$time);
		$finish;
	end
      
endmodule

