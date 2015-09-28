`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:10 08/29/2015 
// Design Name: 
// Module Name:    alu 
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

module alu (
	input wire [7:0]i_op,
	input wire [2:0]i_bot,
	output wire [6:0]o_sseg,
	output wire [7:0]o_leds,
	input wire clk
    );	 
	
	 reg signed [7:0]ops = 8'b00000000;
	 reg signed [7:0]i_in1 = 8'b00000000;
	 reg signed [7:0]i_in2 = 8'b00000000;
	 reg signed [7:0]o_res = 8'b00000000;
	 wire signed [7:0] o_sseg_wire;
	 wire signed [7:0] inputs1;
	 wire signed [7:0] inputs2;
	 wire signed [7:0] operations;
	 wire signed [7:0] results;
	 wire [7:0]o_leds_aux;
	 
	 
	 
	 seg #(
			.N(7)
		 )deco(
			.o_ress(o_sseg_wire),
			.o_ssegg(o_sseg)
		 );
		 
	 alu_ope operadora (
		.input1(inputs1),
		.input2(inputs2),
		.operation(operations),
		.result(results)
	 );
		 
	 assign o_sseg_wire = results;
	 assign inputs1 = i_in1;
	 assign inputs2 = i_in2;
	 assign operations = ops;
	 assign o_leds = results;
	 
	 always @(posedge clk)
	 begin		 
		 if(i_bot[0] == 1'b1)
			i_in1 <= i_op;
		 if(i_bot[1] == 1'b1)
			i_in2 <= i_op;
		 if(i_bot[2] == 1'b1)
			ops <= i_op;
	 end
endmodule


