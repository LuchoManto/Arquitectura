`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:24:29 09/14/2015 
// Design Name: 
// Module Name:    ejercicio_3 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 

//3.	Desarrolle un modelo en Verilog de un registro similar al del punto 1 pero agregando “clock-enable” y reset síncrono.
// El registro debe poder almacenar enteros en complemento a 2.
//
//////////////////////////////////////////////////////////////////////////////////
module ejercicio_3#(parameter N=32)(
	input wire [N-1:0]D,
	output reg [N-1:0]Q,
	output reg [N-1:0]notQ,
	input wire enable,
	input wire reset,
	input wire clock
    );
	 
	 always@(posedge clock or posedge reset)
	 begin
		if(reset)
		begin
			Q <= 0;
			notQ <= 1;
		end
		else if(enable)
		begin
			Q <= D;
			notQ <= ~D;
		end
	 end
	 
	 
endmodule
