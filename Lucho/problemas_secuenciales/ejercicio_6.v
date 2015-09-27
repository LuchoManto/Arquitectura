`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:01:58 09/18/2015 
// Design Name: 
// Module Name:    ejercicio_6 
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

//6.	Describa en Verilog un contador del tipo “free-running” que cuente 32 ciclos de reloj y produzca una señal de control
// que valdrá ‘1’ cada 4, 20 y 24 ciclos.
//
//////////////////////////////////////////////////////////////////////////////////
module ejercicio_6(
	output reg o_ctrl,
	
	input wire clock
    );
	 
	 reg [4:0]cont_clk = 0;
	 
	 
	 always@(posedge clock)
	 begin
		cont_clk <= cont_clk + 1;
		
		if(cont_clk == 4 || cont_clk == 20 || cont_clk == 24)
		begin
			o_ctrl <= 1;
		end
		
		else
		begin
			o_ctrl <= 0;
		end
		
	 end

endmodule
