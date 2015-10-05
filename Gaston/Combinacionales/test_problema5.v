`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:15:03 10/04/2015
// Design Name:   problema5
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Gaston/Combinacionales/test_problema5.v
// Project Name:  Combinacionales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: problema5
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_problema5;

	// Inputs
	reg [1:0] A;
	reg [1:0] B;
	reg cin;

	// Outputs
	wire [1:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	problema5 uut (
		.A(A), 
		.B(B), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	function check_sum(input [1:0] val_deseado);
	begin
		if(sum != val_deseado) 
		begin
			$display("Error en valor sum, deberia ser:",val_deseado,", y vale:",sum," -Tiempo:",$time);
			$finish;
		end
	end
	endfunction
	
	function check_cout(input val_deseado);
	begin
		if(cout != val_deseado) 
		begin
			$display("Error en valor cout, deberia ser:",val_deseado,", y vale:",cout," -Tiempo:",$time);
			$finish;
		end
	end
	endfunction

	initial begin
		$display("Comienza la simulacion");
		$monitor("A:",A," -B:",B," -cin:",cin," -sum:",sum," -cout:",cout," -Tiempo:",$time);

		cin = 0;
		A = 0;
		B = 0;
		#10;
		check_sum(0);
		check_cout(0);
        
		A = 0;
		B = 1;
		#10;
		check_sum(1);
		check_cout(0);
		
		A = 1;
		B = 0;
		#10;
		check_sum(1);
		check_cout(0);
		
		A = 1;
		B = 1;
		#10;
		check_sum(2);
		check_cout(0);
		
		A = 2;
		B = 1;
		#10;
		check_sum(3);
		check_cout(0);
		
		A = 1;
		B = 2;
		#10;
		check_sum(3);
		check_cout(0);
		
		A = 2;
		B = 2;
		#10;
		check_sum(0);
		check_cout(1);
		
		A = 3;
		B = 2;
		#10;
		check_sum(1);
		check_cout(1);

		A = 2;
		B = 3;
		#10;
		check_sum(1);
		check_cout(1);

		A = 3;
		B = 3;
		#10;
		check_sum(2);
		check_cout(1);
		
		cin = 1;
		
		A = 0;
		B = 0;
		#10;
		check_sum(1);
		check_cout(0);
        
		A = 0;
		B = 1;
		#10;
		check_sum(2);
		check_cout(0);
		
		A = 1;
		B = 0;
		#10;
		check_sum(2);
		check_cout(0);
		
		A = 1;
		B = 1;
		#10;
		check_sum(3);
		check_cout(0);
		
		A = 2;
		B = 1;
		#10;
		check_sum(0);
		check_cout(1);
		
		A = 1;
		B = 2;
		#10;
		check_sum(0);
		check_cout(1);
		
		A = 2;
		B = 2;
		#10;
		check_sum(1);
		check_cout(1);
		
		A = 3;
		B = 2;
		#10;
		check_sum(2);
		check_cout(1);

		A = 2;
		B = 3;
		#10;
		check_sum(2);
		check_cout(1);

		A = 3;
		B = 3;
		#10;
		check_sum(3);
		check_cout(1);
		
		
		$display("Termina la simulacion. -Tiempo:",$time);
		$finish;
	end
      
endmodule

