`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:36:38 09/07/2015 
// Design Name: 
// Module Name:    tres 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
/*
3.	Desarrolle un modelo en Verilog de un registro similar al del punto 1 
pero agregando "clock-enable" y reset síncrono. El registro debe poder almacenar
 enteros en complemento a 2.
*/
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tres
	# (parameter N_BITS =32)
	( 
	input signed [N_BITS-1:0] i_dato,
	input clk, clock_enable, reset,
	output reg signed [N_BITS-1:0] o_dato
    )	;

	always @ (posedge clk)	
	begin
		if(reset)
			o_dato <= {N_BITS{1'b0}};
		
		else
		begin
			if(clock_enable)
				o_dato <= i_dato;
			else
				o_dato <= o_dato;
		end
			
		
	end


endmodule
