`timescale 1ns / 1ps
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
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
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
