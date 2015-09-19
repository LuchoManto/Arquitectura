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
//
//////////////////////////////////////////////////////////////////////////////////
module ejercicio_3#(parameter N=32)(
	input wire [N-1:0]i_in,
	output reg [N-1:0]o_out,
	input wire i_en,
	input wire i_rs,
	input wire clock
    );
	 
	 always@(posedge clock)
	 begin
	 if(i_en)
		begin
		o_out <= i_in;
		end
	 if(i_rs)
		begin
		o_out <= 0;
		end
	 end
	 
	 
endmodule
