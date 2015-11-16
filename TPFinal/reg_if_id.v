`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:34:50 11/15/2015 
// Design Name: 
// Module Name:    reg_if_id 
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
module reg_if_id(
	input wire [31:0]ir,
	
	output reg [4:0]ir_25_21, // bits del 21 al 25 de IR para la entrada d1 del banco de registros
	output reg [4:0]ir_20_16, // bits del 16 al 20 de IR para la entrada d2 del banco de registros y del mux para el write reg
	output reg [4:0]ir_15_11, // bits del 15 al 11 como entrada del mux para el write reg
	output reg [15:0]ir_15_0, // bits del 15 al 0 para el sign extend
	output reg [5:0]ir_5_0, // bits del 5 al 0 para el ALU control
	output reg [5:0]ir_31_26, // bits del 31 al 26 para la unidad de control
	
	input wire clk
    );
	 
	 always @(posedge clk)
	 begin
	 
	 ir_25_21 <= ir[25:21];
	 ir_20_16 <= ir[20:16];
	 ir_15_11 <= ir[15:11];
	 ir_15_0 <= ir[15:0];
	 ir_5_0 <= ir[5:0];
	 ir_31_26 <= ir[31:26];
	 
	 end


endmodule
