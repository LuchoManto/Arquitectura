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
	reg PCSrcD;
	reg [8:0] PCBranchD;

	// Outputs
	wire [8:0] T_PCPlus4D;
	wire [31:0] T_InstrD;

	// Instantiate the Unit Under Test (UUT)
	fetch uut (
		.clk(clk), 
		.PCSrcD(PCSrcD), 
		.PCBranchD(PCBranchD), 
		.T_PCPlus4D(T_PCPlus4D), 
		.T_InstrD(T_InstrD)
	);
	
	always #1
	begin
		clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		$display("Comienza la simulacion");
		clk = 0;
		PCSrcD = 0;
		PCBranchD = 0;

		// Wait 100 ns for global reset to finish
		#20;
        
		// Add stimulus here
		$display("Termina la simulacion. -Time: ",$time);
		$finish;
	end
      
endmodule

