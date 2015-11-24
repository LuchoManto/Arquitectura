`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:31:28 11/23/2015 
// Design Name: 
// Module Name:    Buffer_out 
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
module Buffer_out#(parameter N = 1208)(
	
	// PC
	input wire [31:0]PCF,
	
	// Instruccion
	input wire [31:0]InstrD,
	
	// señales de control
	input wire [1:0]MemReadD,
	input wire RegWriteD,
	input wire MemtoRegD,
	input wire [3:0]MemWriteD,
	input wire [3:0]ALUControlID,
	input wire [1:0]ALUSrcD,
	input wire RegDstD,
	input wire BranchD, 
	
	//banco de registros
	input wire [31:0]out0,
	input wire [31:0]out1,
	input wire [31:0]out2,
	input wire [31:0]out3,
	input wire [31:0]out4,
	input wire [31:0]out5,
	input wire [31:0]out6,
	input wire [31:0]out7,
	input wire [31:0]out8,
	input wire [31:0]out9,
	input wire [31:0]out10,
	input wire [31:0]out11,
	input wire [31:0]out12,
	input wire [31:0]out13,
	input wire [31:0]out14,
	input wire [31:0]out15,
	input wire [31:0]out16,
	input wire [31:0]out17,
	input wire [31:0]out18,
	input wire [31:0]out19,
	input wire [31:0]out20,
	input wire [31:0]out21,
	input wire [31:0]out22,
	input wire [31:0]out23,
	input wire [31:0]out24,
	input wire [31:0]out25,
	input wire [31:0]out26,
	input wire [31:0]out27,
	input wire [31:0]out28,
	input wire [31:0]out29,
	input wire [31:0]out30,
	input wire [31:0]out31,
	
	// señales de salida de la unidad de riesgos
	input wire StallF,
	input wire StallD,
	input wire [1:0]ForwardAD,
	input wire [1:0]ForwardBD,
	input wire FlushE,
	input wire [1:0]ForwardAE,
	input wire [1:0]ForwardBE,
	
	// salida
	
	output reg buffer_envio[N-1:0]
	
    );
	 
	 
	 always@(*)
	 begin
	 

		// PC
		buffer_envio[31:0] <= PCF; // 32 bits

		//instruccion
		buffer_envio[63:32] <= InstrD; // 32 bits

		//señales de control
		buffer_envio[71:64] <= {6{'b0}, MemReadD}; // 8 bits
		buffer_envio[79:72] <= {7{'b0}, RegWriteD}; // 8 bits
		buffer_envio[87:80] <= {7{'b0}, MemtoRegD}; // 8 bits
		buffer_envio[95:88] <= {4{'b0}, MemWriteD}; // 8 bits
		buffer_envio[103:96] <= {4{'b0}, ALUControlD}; // 8 bits
		buffer_envio[111:104] <= {6{'b0}, ALUSrcD}; // 8 bits
		buffer_envio[119:112] <= {7{'b0}, RegDstD}; // 8 bits
		buffer_envio[127:120] <= {7{'b0}, BranchD}; // 8 bits

		//registros

		buffer_envio[159:128] <= out0; //32 bits
		buffer_envio[191:160] <= out1; // 32 bits
		buffer_envio[223:192] <= out2; // 32 bits
		buffer_envio[255:224] <= out3; // 32 bits
		buffer_envio[287:256] <= out4; // 32 bits
		buffer_envio[319:288] <= out5; // 32 bits
		buffer_envio[351:320] <= out6; // 32 bits
		buffer_envio[383:352] <= out7; // 32 bits
		buffer_envio[415:384] <= out8; // 32 bits
		buffer_envio[447:416] <= out9; // 32 bits
		buffer_envio[479:448] <= out10; // 32 bits
		buffer_envio[511:480] <= out11; // 32 bits
		buffer_envio[543:512] <= out12; // 32 bits
		buffer_envio[575:544] <= out13; // 32 bits
		buffer_envio[607:576] <= out14; // 32 bits
		buffer_envio[639:608] <= out15; // 32 bits
		buffer_envio[671:640] <= out16; // 32 bits
		buffer_envio[703:672] <= out17; // 32 bits
		buffer_envio[735:704] <= out18; // 32 bits
		buffer_envio[767:736] <= out19; // 32 bits
		buffer_envio[799:768] <= out20; // 32 bits
		buffer_envio[831:800] <= out21; // 32 bits
		buffer_envio[863:832] <= out22; // 32 bits
		buffer_envio[895:864] <= out23; // 32 bits
		buffer_envio[927:896] <= out24; // 32 bits
		buffer_envio[959:928] <= out25; // 32 bits
		buffer_envio[991:960] <= out26; // 32 bits
		buffer_envio[1023:992] <= out27; // 32 bits
		buffer_envio[1055:1024] <= out28; // 32 bits
		buffer_envio[1087:1056] <= out29; // 32 bits
		buffer_envio[1119:1088] <= out30; // 32 bits
		buffer_envio[1151:1120] <= out31; // 32 bits

		// señales de la unidad de riesgo
		buffer_envio[1159:1152] <= {7{'b0'}StallF}; // 8 bits
		buffer_envio[1167:1160] <= {7{'b0'}StallD}; // 8 bits
		buffer_envio[1175:1168] <= {6{'b0'}ForwardAD}; // 8 bits
		buffer_envio[1183:1176] <= {6{'b0'}ForwardBD}; // 8 bits
		buffer_envio[1191:1184] <= {7{'b0'}FlushE}; // 8 bits
		buffer_envio[1199:1192] <= {6{'b0'}ForwardAE}; // 8 bits
		buffer_envio[1207:1200] <= {6{'b0'}ForwardBE}; // 8 bits

	 end


endmodule
