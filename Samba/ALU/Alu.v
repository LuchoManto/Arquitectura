`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:26:36 08/24/2015 
// Design Name: 
// Module Name:    Alu 
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
module Alu 
#(
	parameter MSB_bus = 7,
	parameter LSB_bus = 0,
	parameter MSB_code = 5,
	parameter LSB_code = 0
 )

( 
	input wire [MSB_bus:0]reg_a,
	input wire [MSB_bus:0]reg_b,
	input wire [MSB_bus:0]op_code,
	output reg [MSB_code:0]res
	);
always @(*)
begin 
	case (op_code)
		 6'b100000 : res = reg_a + reg_b;
		 6'b100010 : res = reg_a - reg_b;
		 6'b100100 : res = reg_a & reg_b;
		 6'b100101 : res = reg_a | reg_b;
		 6'b100110 : res = reg_a ^ reg_b;
		 6'b000011 : res = reg_a >>> reg_b;
		 6'b000010 : res = reg_a >> reg_b;
		 6'b100111 : res = ~| reg_b;
		 default : res = 0;
		 endcase 
end


endmodule
