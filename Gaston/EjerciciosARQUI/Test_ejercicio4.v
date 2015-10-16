`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:07:25 09/23/2015
// Design Name:   Ejercicio4
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/EjerciciosARQUI/Test_ejercicio4.v
// Project Name:  EjerciciosARQUI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ejercicio4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_ejercicio4;

	// Inputs
	reg [9:0] i_numero;
	reg reset;
	reg clk;

	// Outputs
	wire [7:0] o_leds;

	// Instantiate the Unit Under Test (UUT)
	Ejercicio4 uut (
		.i_numero(i_numero), 
		.o_leds(o_leds), 
		.reset(reset), 
		.clk(clk)
	);

	function	check_out(input [7:0] val_deseado);
	begin
		if(o_deseada != o_leds)
		begin
			$display("Error output, valor deseado:",o_deseada,".Valor obtenido:",o_leds);
			$finish;
		end
	end
	endfunction
	
	//Clock cada 10 us.
	always #5
		clk = ~clk;
		
	
	reg [7:0] o_deseada;

	initial begin
		$display("Comienza la simulacion");
		$monitor("-input:",i_numero," -reset:",reset," -o_leds:",o_leds);
		i_numero = 10'b0000000001;
		reset = 0;
		clk = 0;
		
		
		#10;
		o_deseada = i_numero;
		check_out(0);
		
		
		
      i_numero = 10'b0000001111;
		#10;
		o_deseada = i_numero;
		check_out(0);

		
		i_numero = 10'b0000000011;
		#10;
		check_out(0);
		
		
		
		i_numero = 10'b1111111111;
		reset = 1;
		#10;
		o_deseada = 0;
		check_out(0);
		
		
		reset = 0;
		#10;
		o_deseada = i_numero;
		check_out(0);
		
		i_numero = 10'b0000111111;
		#10;
		check_out(0);
		
		reset = 1;
		#10;
		o_deseada = 0;
		check_out(0);
		
		$display("Termina la simulacion");
		$finish;
	end
      
endmodule

