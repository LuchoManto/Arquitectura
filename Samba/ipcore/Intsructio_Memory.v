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
		input wire PCSrcD,
		input wire [8:0]PCBranchD,
		output reg [8:0]PCPlus4D,
		output reg [31:0]InstrD
    );

//reg [0:31] pc;
reg PE_MEM = 1;
 
wire [31:0]o_ir;
wire [8:0]PCPlus4F;
wire [8:0]PC1;
wire [8:0]PCF;

//el IPCORE TIENE QUE SER RAM
ip_core ip_core (
  .clka(clk), // input clka
  .addra(PCF), // input [31 : 0] addra
  .douta(o_ir), // output [31 : 0] douta
  .ena(PE_MEM)
);	

add_pc add_pc(
	.pc(PCF),
	.o_pc(PCPlus4F)
);
	
mux_pc mux(
		.pc(PCPlus4F),
		.pc_alu(PCBranchD),
		.pcsrc(PCSrcD),
		.o_pc1(PC1)
);

PC_REG pcreg
(
	.clk(clk),
	.PC1(PC1),
	.PCF(PCF)
);

always @(posedge clk)
begin
	PCPlus4D <= PCPlus4F;
	InstrD <= o_ir;
end

endmodule
