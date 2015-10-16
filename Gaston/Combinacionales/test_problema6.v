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
	reg clk;
	
	// Outputs
	wire [6:0] seg;

	// Instantiate the Unit Under Test (UUT)
	problema6 uut (
		.val(val), 
		.seg(seg),
		.clk(clk)
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
	
	always #5
		clk = ~clk;

	reg finish=0;

	initial begin
		$display("Comienza la simulacion");
		$monitor("val:",val," -seg:%b",seg," -Tiempo:",$time);
		
		clk = 0;
		val = 0;
		
		while(finish == 0)
		begin
			#15;
			check_seg(0);
			val = val + 1;
			if(val == 0)
					finish = 1;
		end
	
		$display("Termina la simulacion. -Tiempo:",$time);
		$finish;
	end
      
endmodule

