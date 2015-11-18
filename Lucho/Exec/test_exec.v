`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:38:49 11/18/2015
// Design Name:   exec
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/Lucho/Exec/test_exec.v
// Project Name:  Exec
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: exec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_exec;

	// Inputs
	reg [31:0] RD1;
	reg [31:0] RD2;
	reg [31:0] ResultW;
	reg [31:0] ALUoutM;
	reg [4:0] RtE;
	reg [4:0] RdE;
	reg RegDstE;
	reg [31:0] SignImmE;
	reg ALUSrcE;
	reg [1:0] ForwardAE;
	reg [1:0] ForwardBE;
	reg [3:0]ALUControlE;
	reg clk;

	// Outputs
	wire [31:0] ALUOutM;
	wire [31:0] WriteDataM;
	wire [4:0] WriteRegM;

	// Instantiate the Unit Under Test (UUT)
	exec uut (
		.RD1(RD1), 
		.RD2(RD2), 
		.ResultW(ResultW), 
		.ALUoutM(ALUoutM), 
		.RtE(RtE), 
		.RdE(RdE), 
		.RegDstE(RegDstE), 
		.SignImmE(SignImmE), 
		.ALUSrcE(ALUSrcE), 
		.ForwardAE(ForwardAE), 
		.ForwardBE(ForwardBE), 
		.ALUControlE(ALUControlE), 
		.ALUOutM(ALUOutM), 
		.WriteDataM(WriteDataM), 
		.WriteRegM(WriteRegM), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		RD1 = 1000;
		RD2 = 2000;
		ResultW = 0;
		ALUoutM = 0;
		RtE = 8;
		RdE = 0;
		RegDstE = 0;
		SignImmE = 0;
		ALUSrcE = 0;
		ForwardAE = 0;
		ForwardBE = 0;
		ALUControlE = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #10
	clk =~clk;
      
endmodule

