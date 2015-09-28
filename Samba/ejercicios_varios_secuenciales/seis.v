`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:06 09/12/2015 
// Design Name: 
// Module Name:    seis 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
/*
6.	Describa en Verilog un contador del tipo “free-running” 
que cuente 32 ciclos de reloj y produzca una señal de control 
que valdrá ‘1’ cada 4, 20 y 24 ciclos


The general idea behind the counter is pretty simple:
Start at some initial count value and store it in a register.
Increment the counter.
Save the new count value back into the register.
*/
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seis
	# (parameter N_BITS = 5)
	(
	input clk, clk_enable, reset,
	output reg  o_control
    );
	
	reg [N_BITS-1:0] contador;

	
	always @ (posedge clk)
	begin
		if (reset)
		begin
			o_control <= 0;
			contador <= {N_BITS{1'b0}};
					
			if (clk_enable)
			begin
				contador <= contador +1;
				
				//if (contador == 4 || contador == 20 || contador == 24)  con esto es cuando sea 4 ó 20 ó 24 y debe ser CADA 4,20 y 24 ciclos
				if(()contador  % 4)  == 0 ) 
					o_control <= 1;
				else
					o_control <= 0;
			end
		end
	end
	
	
	
endmodule
