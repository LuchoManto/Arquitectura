`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:35 09/07/2015 
// Design Name: 
// Module Name:    cinco 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
/*
5.	Escriba un modelo Verilog de un flip-flop con:
a.	Una señal de "Clock-enable" síncrona con lógica negativa
b.	2 entradas, una de reset y otra de preset asincrónicas y con lógica positiva.
c.	Y ambas salidas Q y ~Q (not Q).

*/
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cinco(
	input clk, clk_enable, reset, preset, i_d,
	output reg o_q, o_neg_q
    );
	
	always @ (posedge reset or posedge preset)
	begin
		if(reset)
		begin
			o_q	<= 0;
			o_neg_q <= 1;
		end
		else if (preset)
		begin
			o_q	<= 1;
			o_neg_q <= 0;
		end
	end
	
	always @ (posedge clk)
	begin
		if (!clk_enable)
		begin
			o_q	<= i_d;
			o_neg_q <= ~ i_d;
		end
		else
		begin
			o_q	<= o_q;
			o_neg_q <= o_neg_q;
		end
	end

endmodule
