`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:53:38 10/04/2015
// Design Name:   problema10
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Gaston/Combinacionales/test_problema10.v
// Project Name:  Combinacionales
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: problema10
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_problema10;

	// Inputs
	reg signed [7:0] input1;
	reg signed [7:0] input2;
	reg [5:0] operation;
	reg clk;

	// Outputs
	wire signed [7:0] result;

	// Instantiate the Unit Under Test (UUT)
	problema10 uut (
		.input1(input1), 
		.input2(input2), 
		.operation(operation), 
		.result(result), 
		.clk(clk)
	);

	function check_result(input [7:0] val_deseado);
	begin
		case(operation)
			6'b100000: val_deseado = input1 + input2;
			6'b100010: val_deseado = input1 - input2; //resta
			6'b100100: val_deseado = input1 & input2; //and
			6'b100101: val_deseado = input1 | input2; //or
			6'b100110: val_deseado = input1 ^ input2; //xor
			6'b000011: val_deseado = input1 >>> input2; //shift aritmetico
			6'b000010: val_deseado = input1 >> input2; //shift logico
			6'b100111: val_deseado = ~(input1 | input2); //nor
			default: val_deseado = 8'b11111111;
		endcase
		if(result != val_deseado) 
		begin
			$display("Error en valor result, deberia ser:",val_deseado,", y vale:",result," -Tiempo:",$time);
			$display("Error en valor result, deberia ser:%b",val_deseado,", y vale:%b",result," -Tiempo:",$time);
			$finish;
		end
	end
	endfunction
	
	always #5
		clk = ~clk;
		
	reg finish;
	
	initial begin
		$display("Comienza la simulacion");
		$monitor("input1:",input1," -input2:",input2," -result:",result," -operation:",operation," -Tiempo:",$time);
		//$monitor("input1:%b",input1," -input2:%b",input2," -result:%b",result," -operation:%b",operation," -Tiempo:",$time);
		clk = 0;
		input1 = 50;
		input2 = 35;
		finish = 0;
		operation=0;
		
		while(finish == 0)
		begin
			operation=operation+1;
			#20;
			check_result(0);
			if(operation==6'b111111)
			begin
				finish = 1;
			end
		end
		
		input1 = -50;
		input2 = -35;
		finish = 0;
		operation=0;
		
		while(finish == 0)
		begin
			operation=operation+1;
			#20;
			check_result(0);
			if(operation==6'b111111)
			begin
				finish = 1;
			end
		end
		
		$display("Termina la simulacion. -Tiempo:",$time);
		$finish;
	end
	

	
endmodule

