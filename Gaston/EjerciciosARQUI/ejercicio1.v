`timescale 1ns / 1ps
/*
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:07 09/14/2015 
// Design Name: 
// Module Name:    Ejercicio1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
	1.	Escriba un modelo Verilog para un registro parametrizable. 
	En caso de no indicar ningún valor para el parámetro el registro debe ser de 32 bits.
	
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
*/
module Ejercicio1 

#(parameter N=32)
(
input wire [N-1:0] input_signal,
output reg [N-1:0] output_register,
input clock
);

always@(posedge clock)
begin
	output_register <= input_signal;
end

endmodule
