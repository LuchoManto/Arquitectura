`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:33:43 11/16/2015
// Design Name:   reg_if_id
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/TPFinal/test_if_id.v
// Project Name:  TPFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_if_id
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_if_id;

	// Inputs
	reg [31:0] ir;
	reg clk;

	// Outputs
	wire [4:0] ir_25_21;
	wire [4:0] ir_20_16;
	wire [4:0] ir_15_11;
	wire [15:0] ir_15_0;
	wire [5:0] ir_5_0;

	// Instantiate the Unit Under Test (UUT)
	reg_if_id uut (
		.ir(ir), 
		.ir_25_21(ir_25_21), 
		.ir_20_16(ir_20_16), 
		.ir_15_11(ir_15_11), 
		.ir_15_0(ir_15_0), 
		.ir_5_0(ir_5_0), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		#40;
		ir = 3029302;
		

		// Wait 100 ns for global reset sto finish
		#100;
        
		// Add stimulus here

	end
	
	always #10
	clk=~clk;
      
endmodule

