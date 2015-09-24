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
	 
	reg [7:0]contador;
	 
	 
	always@(posedge clock)
	begin
	
		if(i_signal)
			contador <= contador + 1;
		else
		begin
			contador <= 0;
			o_periodo <= contador;
		end
	
	end


endmodule
