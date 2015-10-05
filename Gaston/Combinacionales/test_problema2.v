`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:24:46 10/04/2015
// Design Name:   problema2
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Gaston/Combinacionales/test_problema2.v
// Project Name:  Combinacionales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: problema2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_problema2;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg [7:0] c;
	reg [7:0] d;
	reg [1:0] selector;
	reg rs;
	reg set;
	
	// Outputs
	wire [7:0] salida;
	

	// Instantiate the Unit Under Test (UUT)
	problema2#( .N(7)) uut 
	(
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.selector(selector), 
		.rs(rs), 
		.set(set),
		.salida(salida)
	);

	function check_val(input [7:0] val_deseado, input [7:0] val_act);
	begin
		if(val_act != val_deseado) 
		begin
			$display("Error en valor, deberia ser:",val_deseado,", y vale:",val_act," -Tiempo:",$time);
			$finish;
		end
	end
	endfunction

	initial begin
		$display("Comienza la simulacion");
		$monitor("Salida:",salida," -selector:",selector," -a:",a," -b:",b," -c:",c," -d:",d," -rs:",rs," -set:",set," -Tiempo:",$time);
		
		// Initialize Inputs
		a = 1;
		b = 2;
		c = 3;
		d = 4;
		rs = 0;
		set = 0;
		
		selector = 0;
		#10;
		check_val(a, salida);
		
		selector = 1;
		#10;
		check_val(b, salida);
		
		selector = 2;
		#10;
		check_val(c, salida);
		
		selector = 3;
		#10;
		check_val(d, salida);
		
		a = 5;
		rs = 1;
		#10;
		check_val(0, salida);
		
		
		set = 1;
		b = 6;
		#10;
		check_val(0, salida);
		
		set = 0;
		c = 7;
		rs = 0;
		#10;
		check_val(d, salida);
		
		d = 8;
		#10;
		check_val(d, salida);
		
		selector = 1;
		#10;
		check_val(b, salida);
		
		selector = 2;
		#10;
		check_val(c, salida);
		
		selector = 3;  
		#10;
		check_val(d, salida);
		
		selector = 0; 
		#10;
		check_val(a, salida);
		
		set = 1;
		#10;
		check_val((2**8)-1, salida);
		
		$display("Termina la simulacion. -Tiempo:",$time);
		$finish;
	end
      
endmodule


