`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:02:42 11/07/2015
// Design Name:   top
// Module Name:   F:/LUCHO/Facu/Quinto/ArquitecturaDeComputadora/Repo/Arquitectura/Lucho/register_bank/bank_test.v
// Project Name:  register_bank
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bank_test;

	// Inputs
	reg [4:0] r1;
	reg [4:0] r2;
	reg [4:0] write_reg;
	reg [31:0] write_data;
	reg reg_write_flag;
	reg clk;

	// Outputs
	wire [31:0] d1;
	wire [31:0] d2;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.r1(r1), 
		.r2(r2), 
		.write_reg(write_reg), 
		.write_data(write_data), 
		.reg_write_flag(reg_write_flag), 
		.d1(d1), 
		.d2(d2), 
		.clk(clk)
	);
	integer f;
	initial begin
	
	f = $fopen("test_salida.txt", "w");
		$fdisplay("Comienza la simulacion");
		$fmonitor(f,"---------------------------\n-r1:",r1,"\n-r2:",r2,"\n-d1:",d1,
		"\n-d2:",d2,"\n-bank[3]:",uut.bank[3],"\n-bank[5]:",uut.bank[5],"\n-reg_write_flag",reg_write_flag,"\n-write_reg",write_reg,"\n-write_data:",write_data,
		"\n-time:",$time,"\n---------------------------");		
		// Initialize Inputs
		r1 = 0;
		r2 = 0;
		write_reg = 3;
		write_data = 30;
		reg_write_flag = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#20;
		reg_write_flag = 1;
		#10;
		reg_write_flag = 0;
		#30;
		write_reg = 5;
		write_data = 40;
		#30;
		reg_write_flag = 1;
		#10;
		reg_write_flag = 0;
		#30;
		r1 = 3;
		#30;
		r2 = 5;
		#50;
		
		
		
		
		
        
		// Add stimulus here
      $fdisplay(f,"Termina la simulacion. -Time: ",$time);
		$fclose(f);
		$finish;
	end
	
	always #5
	clk <= ~clk;
      
endmodule

