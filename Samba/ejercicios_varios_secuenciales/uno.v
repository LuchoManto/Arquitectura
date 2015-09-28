`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:34 09/07/2015 
// Design Name: 
// Module Name:    uno 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//	Escriba un modelo Verilog para un registro parametrizable.
// En caso de no indicar ningún valor para el parámetro el registro debe ser de 32 bits.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module uno 
	# (parameter N_BITS =32)
	( 
	input [N_BITS-1:0] i_dato,
	input clk,
	output reg [N_BITS-1:0] o_dato
    )	;

	always @ (posedge clk)	
	begin
		o_dato <= i_dato;
	end

endmodule
