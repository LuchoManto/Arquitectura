`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:17 11/17/2015 
// Design Name: 
// Module Name:    mux_3 
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
module mux_ForwardBE(
	input wire [31:0]RD2,
	input wire [31:0]ResultW,
	input wire [31:0]ALUOutM,
	
	input [1:0]ForwardBE,
	
	output reg [31:0]WriteDataE
    );
	 
	 always@(*)
	 begin
	 
	 case(ForwardBE)
	 
	 2'b 00: WriteDataE <= RD2;
	 2'b 01: WriteDataE <= ResultW;
	 2'b 10: WriteDataE <= ALUOutM;
	 2'b 11: WriteDataE <= WriteDataE;
	 
	 endcase
	 end


endmodule
