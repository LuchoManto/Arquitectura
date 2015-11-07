`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:11 11/06/2015 
// Design Name: 
// Module Name:    baud_gen 
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
module baud_gen
#(
	parameter BAUD_RATE=9600,
	parameter CLOCK=50000000
)
(
	input clk,
	output reg baud
);
	 
localparam CONTADOR_ESPERA=CLOCK/(BAUD_RATE*16*2);//medio ciclo de espera

reg [9:0] contador;
reg init = 1;

always @(posedge clk)
begin
	if(init == 1)
	begin
		baud<=1'd0;
		contador<=10'd0;
		init <= 0;
	end
	else
	begin	
		if(contador==CONTADOR_ESPERA)
		begin
			baud<=~baud;
			contador<=10'd0;
		end
		else
			contador<=contador+1'b1;
	end
end

endmodule