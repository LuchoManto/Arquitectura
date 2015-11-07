`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:38 11/06/2015 
// Design Name: 
// Module Name:    probando_entrada 
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
module probando_entrada
(
	input clk,
	input rx,
	output reg [7:0] datos
);

reg [3:0] n=0;
reg init = 1;


always@(posedge clk)
begin
	if(init == 1)
	begin
		init <= 0;
		datos <= 8'b00001111;
	end
	datos[n] <= rx;
	n <= n+1;
	if(n==8)
	begin
		n <= 0;
	end
end




endmodule
