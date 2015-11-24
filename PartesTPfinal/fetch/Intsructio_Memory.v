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
	input wire clk,
	input wire inicio,
	output reg Test
);

//--------------------------------------------------------------------------------
//Señales de control hardcode 
//--------------------------------------------------------------------------------
//AUX - Senal enable memoria datos
reg EN_Data_Mem = 1;


//--------------------------------------------------------------------------------
//Etapa fetch 
//--------------------------------------------------------------------------------

wire [8:0]PC1;
wire [8:0]PCF;
wire [8:0]PCPlus4F;
wire [31:0]Instr;


//--------------------------------------------------------------------------------
//Etapa ID
//--------------------------------------------------------------------------------

//Latchs entrada
wire [31:0]InstrD; 
wire [8:0]PCPlus4D;
//Unidad de control
wire RegWriteD;
wire MemtoRegD;
wire [3:0]MemWriteD;
wire [3:0]ALUControlID;
wire [1:0]ALUSrcD;
wire RegDstD;
wire BranchD;
wire [1:0]MemReadD; 
//Banco de registro
wire [31:0]RD1;
wire [31:0]RD2;
//Sign extend
wire[31:0]SignImmD;
//Left Shift 2
wire[31:0]out_left_shift2;
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


//--------------------------------------------------------------------------------
//Etapa EX
//--------------------------------------------------------------------------------
//Latch entrada
wire [1:0]MemReadE;
wire RegWriteE;
wire MemtoRegE;
wire [3:0]MemWriteE;
wire [3:0]ALUControlIE;
wire [1:0]ALUSrcE;
wire RegDstE;
wire [31:0]RD1E;
wire [31:0]RD2E;
wire [4:0]RsE;
wire [4:0]RtE;
wire [4:0]RdE;
wire [31:0]SignImmE;
//mux regdste
wire [4:0]WriteRegE;
//mux forwardAE
wire [31:0]SrcAE;
//mux forwardBE
wire [31:0]WriteDataE;
//mux ALUSrcE_A
wire [31:0]SrcAE1;
//mux ALUSrcE
wire [31:0]SrcBE;
//alu exec
wire [31:0]ALUOut;


//--------------------------------------------------------------------------------
//Etapa MEM
//--------------------------------------------------------------------------------
//Latch entrada Mem
wire [1:0]MemReadM;
wire RegWriteM;
wire MemtoRegM;
wire [3:0]MemWriteM;
wire [31:0]ALUOutM;
wire [31:0]WriteDataM;
wire [4:0]WriteRegM;
//SalidaMem
wire [31:0]ReadDataM;
//Salida maskMemReadM
wire [31:0]ReadData;


//--------------------------------------------------------------------------------
//Etapa Write Back
//--------------------------------------------------------------------------------
//Latch entrada Write Back
wire [1:0]MemReadW;
wire RegWriteW;
wire MemtoRegW;
wire [31:0]ReadDataW;
wire [31:0]ALUOutW;
wire [4:0]WriteRegW;
//Mux memtoregW
wire [31:0]ResultW;


//--------------------------------------------------------------------------------
//Wires unidad de riesgos 
//--------------------------------------------------------------------------------
wire StallF;
wire StallD;
wire [1:0]ForwardAD; 
wire [1:0]ForwardBD; 
wire FlushE;
wire [1:0]ForwardAE;
wire [1:0]ForwardBE;



//--------------------------------------------------------------------------------
//Fetch
//--------------------------------------------------------------------------------

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
	.en(StallF),
	.PC1(PC1),
	.inicio(inicio),
	.PCF(PCF)
);

//el IPCORE TIENE QUE SER RAM
ip_core ip_core1 (
  .clka(clk), // input clka
  .addra(PCF), // input [31 : 0] addra
  //.addra(PC1),
  .douta(Instr), // output [31 : 0] douta
  .ena(~StallF && ~inicio)
);	

//Sumador de etapa de fetch.
add_pc add_pc1(
	.PCF(PCF),
	.PCPlus4F(PCPlus4F)
);

//Latch fin etapa IF.
Latch_Fin_IF latchfinif
(
	.Instr(Instr),
	.PCPlus4F(PCPlus4F),
	.clk(clk),
	.en(StallD),
	.clr(PCSrcD),
	.inicio(inicio),
	.InstrD(InstrD),
	.PCPlus4D(PCPlus4D)
);

//--------------------------------------------------------------------------------
//Etapa ID
//--------------------------------------------------------------------------------

//Unidad de control en etapa ID
Control_Unit controlunit
(
	.Op(InstrD[31:26]),
	.Funct(InstrD[5:0]),
	.inicio(inicio),
	.ALUControlID(ALUControlID),
	.RegWriteD(RegWriteD),
	.MemtoRegD(MemtoRegD),
	.MemWriteD(MemWriteD),
	.BranchD(BranchD),
	.ALUSrcD(ALUSrcD),
	.RegDstD(RegDstD),	
	.MemReadD(MemReadD)
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
	.inicio(inicio),
	.RD1(RD1),
	.RD2(RD2)
);

//SignExtend etapa ID
Sign_Extend signextend
(
	.in(InstrD[15:0]),
	.SignImmD(SignImmD)
);

Left_Shift2 leftshift2
(
	.in(SignImmD),
	.out(out_left_shift2)
);


//Mux forwardAD etapa ID
mux_ForwardAD muxForwardAD
(
	.RD1(RD1),
	.ALUOutM(ALUOutM),
	.ALUOut(ALUOut),
	.ForwardAD(ForwardAD),
	.out(out_mux_forwardAD)
);

//Mux forwardBD etapa ID
mux_ForwardBD muxForwardBD
(
	.RD2(RD2),
	.ALUOutM(ALUOutM),
	.ALUOut(ALUOut),
	.ForwardBD(ForwardBD),
	.out(out_mux_forwardBD)
);

//Comparador de igualdad ID
Comparador_Igualdad comparador
(
	.Op(InstrD[31:26]),
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
	//.input1(SignImmD[8:0]),
	.input1(out_left_shift2[8:0]),
	.PCPlus4D(PCPlus4D),
	.PCBranchD(PCBranchD)
);

//Latch fin de etapa ID
Latch_Fin_ID latchfinid
(
	.MemReadD(MemReadD),
	.RegWriteD(RegWriteD),
	.MemtoRegD(MemtoRegD),
	.MemWriteD(MemWriteD),
	.ALUControlID(ALUControlID),
	.ALUSrcD(ALUSrcD),
	.RegDstD(RegDstD),
	.RD1(RD1),
	.RD2(RD2),
	.RsD(InstrD[25:21]),
	.RtD(InstrD[20:16]),
	.RdD(InstrD[15:11]),
	.SignImmD(SignImmD),
	.clk(clk),
	.FlushE(FlushE),
	.inicio(inicio),
	.MemReadE(MemReadE),
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

//--------------------------------------------------------------------------------
//Etapa EXEC
//--------------------------------------------------------------------------------

//mux regdste
mux_RegDstE muxregdste
(
	.RtE(RtE),
	.RdE(RdE),
	.RegDstE(RegDstE),
	.WriteRegE(WriteRegE)
);

//mux forwardAE
mux_ForwardAE muxforwardAE
(
	.RD1E(RD1E),
	.ResultW(ResultW),
	.ALUOutM(ALUOutM),
	.ForwardAE(ForwardAE),
	.SrcAE(SrcAE)
);

//mux forwardBE
mux_ForwardBE muxforwardBE
(
	.RD2E(RD2E),
	.ResultW(ResultW),
	.ALUOutM(ALUOutM),
	.ForwardBE(ForwardBE),
	.WriteDataE(WriteDataE)
);

//Mux AluSrcE a entrada ALU A.
mux_ALUSrcE_A muxalusrcE_A
(
	.SrcAE(SrcAE),
	.WriteDataE(WriteDataE),
	.SignImmE(SignImmE),
	.ALUSrcE(ALUSrcE),
	.SrcAE1(SrcAE1)
);

//mux ALUSrcE
mux_ALUSrcE muxalusrcE
(
	.WriteDataE(WriteDataE),
	.SignImmE(SignImmE),
	.ALUSrcE(ALUSrcE),
	.SrcBE(SrcBE)
);

//alu etapa exe
alu_exec aluexec
(
	.SrcAE(SrcAE1),
	.SrcBE(SrcBE),
	.ALUControlIE(ALUControlIE),
	.ALUOut(ALUOut)
);

//Latch fin de etapa EXEC
Latch_Fin_Exec latchfinEXEC
(
	.MemReadE(MemReadE),
	.RegWriteE(RegWriteE),
	.MemtoRegE(MemtoRegE),
	.MemWriteE(MemWriteE),
	.ALUOut(ALUOut),
	.WriteDataE(WriteDataE),
	.WriteRegE(WriteRegE),
	.clk(clk),
	.inicio(inicio),
	.MemReadM(MemReadM),
	.RegWriteM(RegWriteM),
	.MemtoRegM(MemtoRegM),
	.MemWriteM(MemWriteM),
	.ALUOutM(ALUOutM),
	.WriteDataM(WriteDataM),
	.WriteRegM(WriteRegM)
);


//--------------------------------------------------------------------------------
//Etapa MEM
//--------------------------------------------------------------------------------

memoria_de_datos memdatos
(  
  .clka(clk), // input clka
  .ena(EN_Data_Mem), // input ena
  .wea(MemWriteM), // input [3 : 0] wea
  .addra(ALUOutM[11:0]), // input [11 : 0] addra
  .dina(WriteDataM), // input [31 : 0] dina
  .douta(ReadDataM) // output [31 : 0] douta
);

mask_MemReadM maskmemreadM
(
	.ReadDataM(ReadDataM),
	.MemReadW(MemReadM), 
	.ReadData(ReadData)
);

/*
memoria_datos memdatos1
(
  .clka(clk), // input clka
  .ena(EN_Data_Mem), // input ena
  .wea(MemWriteM), // input [0 : 0] wea
  .addra(ALUOutM[11:0]), // input [11 : 0] addra
  .dina(WriteDataM[7:0]), // input [7 : 0] dina
  .douta(ReadDataM[7:0]) // output [7 : 0] douta
);
//ena i_read_en|i_write_en && i_clk_en

memoria_datos memdatos2
(
  .clka(clk), // input clka
  .ena(EN_Data_Mem), // input ena
  .wea(MemWriteM), // input [0 : 0] wea
  .addra(ALUOutM[11:0]), // input [11 : 0] addra
  .dina(WriteDataM[15:8]), // input [7 : 0] dina
  .douta(ReadDataM[15:8]) // output [7 : 0] douta
);

memoria_datos memdatos3
(
  .clka(clk), // input clka
  .ena(EN_Data_Mem), // input ena
  .wea(MemWriteM), // input [0 : 0] wea
  .addra(ALUOutM[11:0]), // input [11 : 0] addra
  .dina(WriteDataM[23:16]), // input [7 : 0] dina
  .douta(ReadDataM[23:16]) // output [7 : 0] douta
);

memoria_datos memdatos4
(
  .clka(clk), // input clka
  .ena(EN_Data_Mem), // input ena
  .wea(MemWriteM), // input [0 : 0] wea
  .addra(ALUOutM[11:0]), // input [11 : 0] addra
  .dina(WriteDataM[31:24]), // input [7 : 0] dina
  .douta(ReadDataM[31:24]) // output [7 : 0] douta
);
*/

//Latch fin mem
Latch_Fin_Mem latchfinMEM
(
	.MemReadM(MemReadM),
	.RegWriteM(RegWriteM),
	.MemtoRegM(MemtoRegM),
	.ReadData(ReadData),
	.ALUOutM(ALUOutM),
	.WriteRegM(WriteRegM),
	.clk(clk),
	.inicio(inicio),
	.MemReadW(MemReadW),
	.RegWriteW(RegWriteW),
	.MemtoRegW(MemtoRegW),
	.ReadDataW(ReadDataW),
	.ALUOutW(ALUOutW),
	.WriteRegW(WriteRegW)
);

//--------------------------------------------------------------------------------
//Etapa Write-Back
//--------------------------------------------------------------------------------

//mux MemtoRegW
mux_MemtoRegW muxmemtoregW
(
	.ReadDataW(ReadDataW),
	.ALUOutW(ALUOutW),
	.MemtoRegW(MemtoRegW),
	.ResultW(ResultW)
);



//--------------------------------------------------------------------------------
//Unidad de riesgos
//--------------------------------------------------------------------------------
unidad_riesgos unidadderiesgos
(
	.BranchD(BranchD),
	.RsD(InstrD[25:21]),
	.RtD(InstrD[20:16]),
	.RsE(RsE),
	.RtE(RtE),
	.WriteRegE(WriteRegE),
	.MemtoRegE(MemtoRegE),
	.RegWriteE(RegWriteE),
	.WriteRegM(WriteRegM),
	.RegWriteM(RegWriteM),
	.WriteRegW(WriteRegW),
	.RegWriteW(RegWriteW),
	.MemtoRegM(MemtoRegM),
	.inicio(inicio),
	.StallF(StallF),
	.StallD(StallD),
	.ForwardAD(ForwardAD),
	.ForwardBD(ForwardBD),
	.FlushE(FlushE),
	.ForwardAE(ForwardAE),
	.ForwardBE(ForwardBE)
);


always@(posedge clk)
begin
	Test<=ResultW;
end

endmodule
