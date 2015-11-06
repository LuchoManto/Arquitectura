`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:50 10/17/2015 
// Design Name: 
// Module Name:    baudrate_gen 
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
module baudrate_gen(  // generador de ticks para un baudrate de 9600
		input wire clock,
		output reg baud
 );
 
reg [7:0]count=0;
reg init = 1;


always@(posedge clock)
begin
	//if(count == 163)
	if(count == 163)
	begin
		baud <= ~baud;
		count <= 0;
	end 
	else
		count <= count + 1;
end

always@(init)
begin
	if(init == 1)
	begin
		baud = 0;
	end
end

endmodule

