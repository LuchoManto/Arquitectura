`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:10:27 11/18/2015
// Design Name:   unidad_riesgos
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Partes TP final/fetch/test_riesgos.v
// Project Name:  ipcore
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: unidad_riesgos
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_riesgos;

	// Inputs
	reg BranchD;
	reg [4:0] RsD;
	reg [4:0] RtD;
	reg [4:0] RsE;
	reg [4:0] RtE;
	reg [4:0] WriteRegE;
	reg MemtoRegE;
	reg RegWriteE;
	reg [4:0] WriteRegM;
	reg RegWriteM;
	reg [4:0] WriteRegW;
	reg RegWriteW;

	// Outputs
	wire StallF;
	wire StallD;
	wire ForwardAD;
	wire ForwardBD;
	wire FlushE;
	wire [1:0] ForwardAE;
	wire [1:0] ForwardBE;

	// Instantiate the Unit Under Test (UUT)
	unidad_riesgos uut (
		.BranchD(BranchD), 
		.RsD(RsD), 
		.RtD(RtD), 
		.RsE(RsE), 
		.RtE(RtE), 
		.WriteRegE(WriteRegE), 
		.MemtoRegE(MemtoRegE), 
		.RegWriteE(RegWriteE), 
		.WriteRegM(WriteRegM), 
		.RegWriteM(RegWriteM), 
		.WriteRegW(WriteRegW), 
		.RegWriteW(RegWriteW), 
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
		BranchD = 0;
		RsD = 0;
		RtD = 0;
		RsE = 0;
		RtE = 0;
		WriteRegE = 0;
		MemtoRegE = 1;
		RegWriteE = 0;
		WriteRegM = 0;
		RegWriteM = 0;
		WriteRegW = 0;
		RegWriteW = 0;
		

		// Wait 100 ns for global reset to finish
		#10;
        
		MemtoRegE = 0;  
		
		#10;
		// Add stimulus here

	end
      
endmodule

