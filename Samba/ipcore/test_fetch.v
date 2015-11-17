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
	wire [8:0] PCPlus4D;
	wire [31:0] InstrD;

	// Instantiate the Unit Under Test (UUT)
	fetch uut (
		.clk(clk), 
		.PCSrcD(PCSrcD), 
		.PCBranchD(PCBranchD), 
		.PCPlus4D(PCPlus4D), 
		.InstrD(InstrD)
	);
	
	always #1
	begin
		clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		$display("Comienza la simulacion");
		$monitor("\n ----------------------------- \n - PCSrcD: %b",PCSrcD,
		" \n - InstrD: %h",InstrD," \n -  PCPlus4D: %b",PCPlus4D,
		" \n - Time: ",$time, "\n ----------------------------------");
		clk = 0;
		PCSrcD = 0;
		PCBranchD = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		$display("Termina la simulacion. -Time: ",$time);
		$finish;
	end
      
endmodule

