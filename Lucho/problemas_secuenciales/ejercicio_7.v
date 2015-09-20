`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:58 09/20/2015 
// Design Name: 
// Module Name:    ejercicio_7 
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
module ejercicio_7(
	output reg o_signal = 0,

	input wire clock
    );
	 
	 reg [10:0]cont_clk = 0;
	 
	 always@(posedge clock)
	 begin
	 
		 cont_clk <= cont_clk + 1;
		 if(cont_clk == 0) // 20,48Mhz/5KHz/2 = tiempo de ciclo de trabajo al 50% = 2048
		 begin	
			o_signal <= ~o_signal;
		 end
	 
	 end
	 


endmodule
