`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:18:40 09/21/2015 
// Design Name: 
// Module Name:    Ejercicio_5 
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
module Ejercicio_5
	( input wire i_a,
	  input wire reset,
	  input wire clk,
	  input wire preset,
	  output reg o_a, //Q
	  output reg o_b  //notQ
    );

 // always @(negedge clk, reset, preset)
always @(negedge clk or posedge preset or posedge reset)
begin
	if(reset == 1)
	begin	
		o_a<= 0;
		o_b<= 0;
	end 
	else 
	begin
		o_a<= i_a;
		o_b<= ~i_a;
	end
	
	if(preset == 1)
	begin
		o_a<= 1;
		o_b<= 1;
	end
	else 
	begin
		o_a<= i_a;
		o_b<= ~i_a;
	end
end
		
endmodule
