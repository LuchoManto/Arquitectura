`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:50:00 11/23/2015
// Design Name:   Buffer_out
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/PartesTPfinal/test_buffer_out.v
// Project Name:  TP_Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Buffer_out
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_buffer_out;

	// Inputs
	reg [31:0] PCF;
	reg [31:0] InstrD;
	reg [1:0] MemReadD;
	reg RegWriteD;
	reg MemtoRegD;
	reg [3:0] MemWriteD;
	reg [3:0] ALUControlID;
	reg [1:0] ALUSrcD;
	reg RegDstD;
	reg BranchD;
	reg [31:0] out0;
	reg [31:0] out1;
	reg [31:0] out2;
	reg [31:0] out3;
	reg [31:0] out4;
	reg [31:0] out5;
	reg [31:0] out6;
	reg [31:0] out7;
	reg [31:0] out8;
	reg [31:0] out9;
	reg [31:0] out10;
	reg [31:0] out11;
	reg [31:0] out12;
	reg [31:0] out13;
	reg [31:0] out14;
	reg [31:0] out15;
	reg [31:0] out16;
	reg [31:0] out17;
	reg [31:0] out18;
	reg [31:0] out19;
	reg [31:0] out20;
	reg [31:0] out21;
	reg [31:0] out22;
	reg [31:0] out23;
	reg [31:0] out24;
	reg [31:0] out25;
	reg [31:0] out26;
	reg [31:0] out27;
	reg [31:0] out28;
	reg [31:0] out29;
	reg [31:0] out30;
	reg [31:0] out31;
	reg StallF;
	reg StallD;
	reg [1:0] ForwardAD;
	reg [1:0] ForwardBD;
	reg FlushE;
	reg [1:0] ForwardAE;
	reg [1:0] ForwardBE;

	// Instantiate the Unit Under Test (UUT)
	Buffer_out uut (
		.PCF(PCF), 
		.InstrD(InstrD), 
		.MemReadD(MemReadD), 
		.RegWriteD(RegWriteD), 
		.MemtoRegD(MemtoRegD), 
		.MemWriteD(MemWriteD), 
		.ALUControlID(ALUControlID), 
		.ALUSrcD(ALUSrcD), 
		.RegDstD(RegDstD), 
		.BranchD(BranchD), 
		.out0(out0), 
		.out1(out1), 
		.out2(out2), 
		.out3(out3), 
		.out4(out4), 
		.out5(out5), 
		.out6(out6), 
		.out7(out7), 
		.out8(out8), 
		.out9(out9), 
		.out10(out10), 
		.out11(out11), 
		.out12(out12), 
		.out13(out13), 
		.out14(out14), 
		.out15(out15), 
		.out16(out16), 
		.out17(out17), 
		.out18(out18), 
		.out19(out19), 
		.out20(out20), 
		.out21(out21), 
		.out22(out22), 
		.out23(out23), 
		.out24(out24), 
		.out25(out25), 
		.out26(out26), 
		.out27(out27), 
		.out28(out28), 
		.out29(out29), 
		.out30(out30), 
		.out31(out31), 
		.StallF(StallF), 
		.StallD(StallD), 
		.ForwardAD(ForwardAD), 
		.ForwardBD(ForwardBD), 
		.FlushE(FlushE), 
		.ForwardAE(ForwardAE), 
		.ForwardBE(ForwardBE)
	);

	initial begin
		// Initialize Inputs
		PCF = 0;
		InstrD = 0;
		MemReadD = 0;
		RegWriteD = 0;
		MemtoRegD = 0;
		MemWriteD = 0;
		ALUControlID = 0;
		ALUSrcD = 0;
		RegDstD = 0;
		BranchD = 0;
		out0 = 0;
		out1 = 0;
		out2 = 0;
		out3 = 0;
		out4 = 0;
		out5 = 0;
		out6 = 0;
		out7 = 0;
		out8 = 0;
		out9 = 0;
		out10 = 0;
		out11 = 0;
		out12 = 0;
		out13 = 0;
		out14 = 0;
		out15 = 0;
		out16 = 0;
		out17 = 0;
		out18 = 0;
		out19 = 0;
		out20 = 0;
		out21 = 0;
		out22 = 0;
		out23 = 0;
		out24 = 0;
		out25 = 0;
		out26 = 0;
		out27 = 0;
		out28 = 0;
		out29 = 0;
		out30 = 0;
		out31 = 0;
		StallF = 0;
		StallD = 0;
		ForwardAD = 3;
		ForwardBD = 0;
		FlushE = 1;
		ForwardAE = 3;
		ForwardBE = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

