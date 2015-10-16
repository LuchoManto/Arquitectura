`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:55:20 09/14/2015
// Design Name:   Ejercicio2
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/EjerciciosARQUI/Test_ejercicio2.v
// Project Name:  EjerciciosARQUI
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Ejercicio2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define N 4

module Test_ejercicio2;

	// Inputs
	reg signed [`N-1:0] a;
	reg signed [`N-1:0] b;
	reg signed [`N-1:0] c;
	reg clock;

	// Outputs
	wire signed [`N-1:0] result;

	// Instantiate the Unit Under Test (UUT)
	Ejercicio2#( .N(`N) ) uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.result(result), 
		.clock(clock)
	);
	
	always #5
		clock = ~clock;
	
	reg signed [`N-1:0] aux;

	function check_result(input [`N-1:0] val_deseado);
	begin
		if(a > b)
			aux = a;
		else
			aux = b;
		
		if(aux  > c)
			val_deseado = aux;
		else
			val_deseado = c;
			
		if(result != val_deseado)
		begin
			$display("Error resultado, valor deseado es:",val_deseado,".Valor result es:",result);
			$finish;
		end
	end
	endfunction
	
	reg finish1=0;
	reg finish2=0;
	reg finish3=0;

	initial begin
		$display("Comienza la simulacion");
		$monitor("-a:",a," -b:",b," -c:",c," -result:",result);
		
		clock = 0;
		a=0;
		b=0;
		c=0;
		
		while(finish1==0)
		begin
			while(finish2==0)
			begin	
				while(finish3==0)
				begin
					#20;
					check_result(0);
					
					c=c+1;

					if(c==0)
					begin
						finish3=1;
						c=0;
					end
				end
				
				b=b+1;
				finish3=0;
				
				if(b==0)
				begin
					finish2=1;
					b=0;
				end
			end
			
			a=a+1;	
			finish2=0;

			if(a==0)
			begin
				finish1=1;
				a=0;
			end
		end
		
		$display("Termino la simulación");
		$finish;
	end
      
endmodule

