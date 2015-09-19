`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:27 09/14/2015 
// Design Name: 
// Module Name:    ejercicio_4 
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
module ejercicio_4(
	input wire [9:0]i_ent,
	input wire i_rs,
	output reg [7:0]o_res,
	
	input wire clk
    );
	 
	 reg [9:0]ff_ent;
	 reg [9:0]ff_aux = 0;
	 
	 always@(posedge clk)
	 begin
	 ff_ent <= i_ent;
	 end
	 
	 always@(posedge clk)
	 begin
	 if(ff_ent > ff_aux)
	 ff_aux <= ff_ent;
	 end
	 
	 always@(posedge clk)
	 begin
	 if(i_rs == 0)
	 o_res <= ff_aux;
	 else
	 begin
	 o_res <= 0;
	 ff_aux <= 0;
	 end
	 
	 end

endmodule
