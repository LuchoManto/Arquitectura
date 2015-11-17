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
	output reg [8:0]T_PCPlus4D,
	output reg [31:0]T_InstrD
 );


reg PE_MEM = 1;
reg StalIF = 0;
reg StalID = 0;
 
 
wire [8:0]PC1;
wire [8:0]PCF;
wire [8:0]PCPlus4F;
wire [31:0]Instr;
wire [31:0]InstrD; 
wire [8:0]PCPlus4D;


//Mux para pc de etapa de fetch	
mux_pc mux_pc1(
		.PCPlus4F(PCPlus4F),
		.PCBranchD(PCBranchD),
		.PCSrcD(PCSrcD),
		.PC1(PC1)
);

//Primer latch de PC en etapa de fetch
PC_REG pcreg
(
	.clk(clk),
	.en(StalIF),
	.PC1(PC1),
	.PCF(PCF)
);

//el IPCORE TIENE QUE SER RAM
ip_core ip_core1 (
  .clka(clk), // input clka
  .addra(PCF), // input [31 : 0] addra
  .douta(Instr), // output [31 : 0] douta
  .ena(PE_MEM)
);	

//Sumador de etapa de fetch.
add_pc add_pc1(
	.PCF(PCF),
	.PCPlus4F(PCPlus4F)
);

//Latch de instr terminando etapa de fetch
Instr_Lach instrlach
(
	.clk(clk),
	.en(StalID),
	.Instr(Instr),
	.InstrD(InstrD)
);

//Latch de PC terminando etapa de fetch.
PC_Latch pclach
(
	.clk(clk),
	.en(StalID),
	.PCPlus4F(PCPlus4F),
	.PCPlus4D(PCPlus4D)
);

always @(*)
begin
	T_InstrD <= InstrD;
	T_PCPlus4D <= PCPlus4D;
end

endmodule
