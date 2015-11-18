`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:41:07 11/16/2015 
// Design Name: 
// Module Name:    PC_REG 
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
module PC_REG(
	input clk,
	input wire en,
	input wire [8:0]PC1,
	output reg [8:0]PCF
    );
	
reg reset = 1;	
	
always@(posedge clk)
begin
	if(en == 1)
	begin
		if(reset == 1)
		begin
			PCF 	<= 0;
			reset <= 0;
		end	
		else
		begin
			PCF <= PC1;
		end
	end
end



endmodule
