`timescale 1ns / 1ps
/*
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:31:36 09/14/2015 
// Design Name: 
// Module Name:    Ejercicio3 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
Desarrolle un modelo en Verilog de un registro de 32 bits 
parametrizable con "clock-enable" y reset síncrono.
 El registro debe poder almacenar enteros en complemento a 2.
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
*/
module Ejercicio3#(parameter N=32)
(
input wire [N-1:0] input_signal,
output reg [N-1:0] output_register,
input wire clock_enable,
input wire reset,
input clock
);

always@(posedge clock)
begin
	if(clock_enable)
		if(reset)
			output_register <= 0;
		else
			output_register <= input_signal;
end


endmodule
