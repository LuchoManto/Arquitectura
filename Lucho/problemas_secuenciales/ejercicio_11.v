`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:18:19 09/18/2015 
// Design Name: 
// Module Name:    ejercicio_11 
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
module ejercicio_11(
	input wire i_signal,
	output reg [7:0]o_periodo,
	
	input wire clock
    );
	 
	 reg [7:0]cont_clock;
	 reg [1:0]estado = 2'b01;
	 
	always@(posedge clock)
	begin
	 
	case(estado)
	0: begin 
			o_periodo = cont_clock;
			cont_clock = 0;
		end
	1: cont_clock = cont_clock + 1;
	endcase
	 
	if(i_signal == 1)
		estado <= 1;
	else if (i_signal == 0)
		estado <= 0;


	end


endmodule
