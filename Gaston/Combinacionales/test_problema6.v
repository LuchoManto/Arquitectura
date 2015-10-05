`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:07:02 10/04/2015
// Design Name:   problema6
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Gaston/Combinacionales/test_problema6.v
// Project Name:  Combinacionales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: problema6
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_problema6;

	// Inputs
	reg [3:0] val;

	// Outputs
	wire [6:0] seg;

	// Instantiate the Unit Under Test (UUT)
	problema6 uut (
		.val(val), 
		.seg(seg)
	);
	
	function check_seg(input [6:0] val_deseado);
	begin
		case(val)
			4'b0000:	val_deseado=7'b0000001;
			4'b0001:	val_deseado=7'b1001111;
			4'b0010:	val_deseado=7'b0010010;
			4'b0011:	val_deseado=7'b0000110;
			4'b0100:	val_deseado=7'b1001100;
			4'b0101:	val_deseado=7'b0100100;
			4'b0110:	val_deseado=7'b0100000;
			4'b0111:	val_deseado=7'b0001111;
			4'b1000:	val_deseado=7'b0000000;
			4'b1001:	val_deseado=7'b0001100;
			default: val_deseado=7'b1001000;
		endcase
		if(seg != val_deseado) 
		begin
			$display("Error en valor seg, deberia ser:%b",val_deseado,", y vale:%b",seg," -Tiempo:",$time);
			$finish;
		end
	end
	endfunction


	initial begin
		$display("Comienza la simulacion");
		$monitor("val:",val," -seg:%b",seg," -Tiempo:",$time);
		
		val = 0;
		#10;
		check_seg(0);
		
		val = 1;
		#10;
		check_seg(0);
		
		val = 2;
		#10;
		check_seg(0);
		
		val = 3;
		#10;
		check_seg(0);
	
		val = 4;
		#10;
		check_seg(0);
	
		val = 5;
		#10;
		check_seg(0);
		
		val = 6;
		#10;
		check_seg(0);
		
		val = 7;
		#10;
		check_seg(0);
		
		val = 8;
		#10;
		check_seg(0);
		
		val = 9;
		#10;
		check_seg(0);
		
		val = 10;
		#10;
		check_seg(0);
		
		val = 11;
		#10;
		check_seg(0);
		
		val = 12;
		#10;
		check_seg(0);
		
		val = 13;
		#10;
		check_seg(0);
		
		val = 14;
		#10;
		check_seg(0);
		
		val = 15;
		#10;
		check_seg(0);
		$display("Termina la simulacion. -Tiempo:",$time);
		$finish;
	end
      
endmodule

