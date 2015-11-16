`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:12:07 11/16/2015
// Design Name:   fetch
// Module Name:   S:/ArquitecturaP/Arquitectura/Samba/ipcore/test_fetch.v
// Project Name:  IpCore
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fetch;

	// Inputs
	reg clk;
	reg RegWriteW;
	reg [31:0] PCBranchD;

	// Outputs
	wire [31:0] PCPlus4D;
	wire InstrD;

	// Instantiate the Unit Under Test (UUT)
	fetch uut (
		.clk(clk), 
		.RegWriteW(RegWriteW), 
		.PCBranchD(PCBranchD), 
		.PCPlus4D(PCPlus4D), 
		.InstrD(InstrD)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		RegWriteW = 0;
		PCBranchD = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

