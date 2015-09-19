`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:01 09/18/2015 
// Design Name: 
// Module Name:    ejercicio_5 
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
module ejercicio_5#(parameter N=32)(
	input wire [N-1:0]i_in,
	output reg [N-1:0]o_out,
	output reg [N-1:0]o_nout,
	input wire i_en,
	input wire i_rs,
	input wire i_se,
	
	input wire clock
    );
	 
	 always@(posedge clock or posedge i_rs or posedge i_se)
	 begin
	 if(i_en)
	 begin
	 	o_out <= 0;
		o_nout <= 0;
	 end
	 else
	 begin
		o_out <= i_in;
		o_nout <= ~i_in;
	 end
		
	 if(i_rs)
		begin
		o_out <= 0;
		o_nout <= 'hFFFFFFFF;
		end
		
	 if(i_se)
		begin
		o_out <= 'hFFFFFFFF;
		o_nout <= 0;
		end
		
	 end
	 
	 
endmodule
