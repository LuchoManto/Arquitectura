`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:55:04 10/31/2015 
// Design Name: 
// Module Name:    registro 
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
module registro
#(parameter N=32)
(
input wire [N-1:0] input_data,
input chip_en,
output reg [N-1:0] output_data,
input clk
);


always@(posedge clk)
begin
	if(chip_en)
	begin
		output_data <= input_data;
	end
end

always@(negedge clk)
begin
	output_data <= output_data;
end

endmodule