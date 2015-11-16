`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:45 11/07/2015 
// Design Name: 
// Module Name:    Intsructio_Memory 
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
module fetch
	(
		input wire clk,
		input wire RegWriteW,
		input wire [31:0]PCBranchD,
		output reg [31:0]PCPlus4D,
		output reg InstrD
    );

//reg [0:31] pc;
reg [31:0] PC;
 
wire o_ir;
wire PCPlus4F;
wire PC1;
wire PCF;

//el IPCORE TIENE QUE SER RAM
ip_core ip_core (
  .clka(clk), // input clka
  .addra(PCF), // input [31 : 0] addra
  .douta(o_ir) // output [31 : 0] douta
);	

add_pc add_pc(
	.pc(PCF),
	.o_pc(PCPlus4F)
);
	
mux_pc mux(
		.pc(PCPlus4F),
		.pc_alu(PCBranchD),
		.pcsrc(RegWriteW),
		.o_pc1(PC1)
);

always @(posedge clk)
begin
	PC <= PC1;
	InstrD <= o_ir;
end

endmodule
