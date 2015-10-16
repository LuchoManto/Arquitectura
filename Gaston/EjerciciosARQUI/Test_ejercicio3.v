`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:36:44 09/14/2015
// Design Name:   Ejercicio3
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/EjerciciosARQUI/Test_ejercicio3.v
// Project Name:  EjerciciosARQUI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ejercicio3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`define N 4
module Test_ejercicio3;

	// Inputs
	reg [`N-1:0] input_signal;
	reg clock_enable;
	reg reset;
	reg clock;

	// Outputs
	wire [`N-1:0] output_register;

	// Instantiate the Unit Under Test (UUT)
	Ejercicio3 #( .N(`N) ) uut 
	(
		.input_signal(input_signal), 
		.output_register(output_register), 
		.clock_enable(clock_enable), 
		.reset(reset), 
		.clock(clock)
	); 
	

	reg [`N-1:0] output_deseada;
	
	function	check_out(input [`N-1:0] val_deseado);
	begin
		if(val_deseado != output_register)
		begin
			$display("Error output, valor deseado:",val_deseado,".Valor obtenido:",output_register);
			$finish;
		end
	end
	endfunction
	
	
	always #5
		clock = ~clock;
		
	always #50
		reset = ~reset;
		
	always #100
		clock_enable = ~clock_enable;
		
	reg finish = 0;
	
	initial begin
		$display("Comienza la simulacion");
		$monitor("-input:",input_signal," -output:",output_register," -reset:",reset, " -clock_en:",clock_enable);
		input_signal = 0;
		clock_enable = 1;
		reset = 0;
		clock = 0;
		output_deseada = input_signal;

		while(finish == 0)
		begin
			#10;
			check_out(output_deseada);
			if(clock_enable)
			begin
				if(reset)
				begin
					output_deseada=0;
				end
				else
				begin
					input_signal = input_signal+1;
					output_deseada = input_signal;
					
					if(input_signal == 0)
						finish = 1;
				end
			end
		end
		
		$display("Termino la simulación");
		$finish;
	end
      
endmodule

