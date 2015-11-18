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
module Pipe
(
	input wire clk
);

//AUX - Senal entrante a enable de memoria en Fetch
reg PE_MEM = 1;

//AUX - Senales de control de latch en fetch
reg StalIF = 1;
reg StalID = 1;
 
//AUX - Senal A3-WD3 de banco de registro
reg [4:0]WriteRegW 	= 'b0000; 
reg [31:0]ResultW 	= 0; 

//AUX - Senal de control WE3 banco de registros ID
reg RegWriteW = 0; 

//AUX - Senal ALUOutM entrada a muxForwardAD/muxForwardBD
reg [31:0]ALUOutM = 0; 

//AUX - Senal de control ForwardAD mux
reg ForwardAD = 0; 

//AUX - Senal de control ForwardBD mux
reg ForwardBD = 0; 

//AUX - Senal de control latch fin de etapa ID
reg FlushE = 0;

//------------------------------------------------------
//Etapa fetch 
wire [8:0]PC1;
wire [8:0]PCF;
wire [8:0]PCPlus4F;
wire [31:0]Instr;


//------------------------------------------------------
//Etapa ID
//Latchs entrada
wire [31:0]InstrD; 
wire [8:0]PCPlus4D;
//Unidad de control
wire RegWriteD;
wire MemtoRegD;
wire MemWriteD;
wire [3:0]ALUControlID;
wire ALUSrcD;
wire RegDstD;
wire BranchD;
wire [3:0]ShiftD;
wire [3:0]MemReadByte; 
wire [3:0]MemWriteByte;
//Banco de registro
wire [31:0]RD1;
wire [31:0]RD2;
//Sign extend
wire[31:0]SignImmD;
//Left Shift 2
//wire[31:0]out_left_shift2;
//Mux ForwardAD
wire [31:0]out_mux_forwardAD;
//Mux ForwardBD
wire [31:0]out_mux_forwardBD;
//EqualD  etapa ID
wire EqualD;
//Compuerta AND PCSrcD
wire PCSrcD;
//Sumador de PCBranchD etapa ID
wire [8:0]PCBranchD;


//------------------------------------------------------
//Etapa EX
//Latch entrada
wire RegWriteE;
wire MemtoRegE;
wire MemWriteE;
wire [3:0]ALUControlIE;
wire ALUSrcE;
wire RegDstE;
wire [31:0]RD1E;
wire [31:0]RD2E;
wire [0:4]RsE;
wire [0:4]RtE;
wire [0:4]RdE;
wire [31:0]SignImmE;


//------------------------------------------------------
//Fetch

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
	.clr(PCSrcD),
	.Instr(Instr),
	.InstrD(InstrD)
);

//Latch de PC terminando etapa de fetch.
PC_Latch pclach
(
	.clk(clk),
	.en(StalID),
	.clr(PCSrcD),
	.PCPlus4F(PCPlus4F),
	.PCPlus4D(PCPlus4D)
);

//------------------------------------------------------
//Etapa ID

//Unidad de control en etapa ID
Control_Unit controlunit
(
	.Op(InstrD[31:26]),
	.Funct(InstrD[5:0]),
	.ALUControlID(ALUControlID),
	.RegWriteD(RegWriteD),
	.MemtoRegD(MemtoRegD),
	.MemWriteD(MemWriteD),
	.BranchD(BranchD),
	.ALUSrcD(ALUSrcD),
	.RegDstD(RegDstD),	
	.ShiftD(ShiftD),
	.MemReadByte(MemReadByte), 
	.MemWriteByte(MemWriteByte)
);

//Banco de registros etapa ID
Register_File bancoregistros
(
	.clk(clk),
	.A1(InstrD[25:21]),
	.A2(InstrD[20:16]),
	.A3(WriteRegW),
	.WD3(ResultW),
	.WE3(RegWriteW),
	.RD1(RD1),
	.RD2(RD2)
);

//SignExtend etapa ID
Sign_Extend signextend
(
	.in(InstrD[15:0]),
	.SignImmD(SignImmD)
);

//NO VA YA QUE VAN DE A 1 LOS PC Left shift 2 etapa ID
/*
Left_Shift2 leftshift2
(
	.in(SignImmD),
	.out(out_left_shift2)
);
*/

//Mux forwardAD etapa ID
mux_ForwardAD muxForwardAD
(
	.RD1(RD1),
	.ALUOutM(ALUOutM),
	.ForwardAD(ForwardAD),
	.out(out_mux_forwardAD)
);

//Mux forwardBD etapa ID
mux_ForwardBD muxForwardBD
(
	.RD2(RD2),
	.ALUOutM(ALUOutM),
	.ForwardBD(ForwardBD),
	.out(out_mux_forwardBD)
);

//Comparador de igualdad ID
Comparador_Igualdad comparador
(
	.input1(out_mux_forwardAD),
	.input2(out_mux_forwardBD),
	.EqualD(EqualD)
);

//Compuerta AND etapada ID
And_PCSrcD andpcsrcd
(
	.BranchD(BranchD),
	.EqualD(EqualD),
	.PCSrcD(PCSrcD)
);

//Sumador para PCBranchD en etapa ID
Sumador_EID sumadoreid
(
	.input1(SignImmD[8:0]),
	.PCPlus4D(PCPlus4D),
	.PCBranchD(PCBranchD)
);

//Latch fin de etapa ID
Latch_Fin_ID latchfinid
(
	.RegWriteD(RegWriteD),
	.MemtoRegD(MemtoRegD),
	.MemWriteD(MemWriteD),
	.ALUControlID(ALUControlID),
	.ALUSrcD(ALUSrcD),
	.RegDstD(RegDstD),
	.RD1(RD1),
	.RD2(RD1),
	.RsD(InstrD[25:21]),
	.RtD(InstrD[20:16]),
	.RdD(InstrD[15:11]),
	.SignImmD(SignImmD),
	.clk(clk),
	.FlushE(FlushE),
	.RegWriteE(RegWriteE),
	.MemtoRegE(MemtoRegE),
	.MemWriteE(MemWriteE),
	.ALUControlIE(ALUControlIE),
	.ALUSrcE(ALUSrcE),
	.RegDstE(RegDstE),
	.RD1E(RD1E),
	.RD2E(RD2E),
	.RsE(RsE),
	.RtE(RtE),
	.RdE(RdE),
	.SignImmE(SignImmE)
);



endmodule
