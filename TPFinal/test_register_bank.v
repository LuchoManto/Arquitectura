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

module test_register_bank;

	// Inputs
	reg [4:0] r1;
	reg [4:0] r2;
	reg [4:0] write_reg;
	reg [31:0] write_data;	
	reg all_registers;
	reg clk;	
	reg reg_write_flag;

	// Outputs
	wire [31:0] d1;
	wire [31:0] d2;
	wire [31:0]out0;
	wire [31:0]out1;
	wire [31:0]out2;
	wire [31:0]out3;
	wire [31:0]out4;
	wire [31:0]out5;
	wire [31:0]out6;
	wire [31:0]out7;
	wire [31:0]out8;
	wire [31:0]out9;
	wire [31:0]out10;
	wire [31:0]out11;
	wire [31:0]out12;
	wire [31:0]out13;
	wire [31:0]out14;
	wire [31:0]out15;
	wire [31:0]out16;
	wire [31:0]out17;
	wire [31:0]out18;
	wire [31:0]out19;
	wire [31:0]out20;
	wire [31:0]out21;
	wire [31:0]out22;
	wire [31:0]out23;
	wire [31:0]out24;
	wire [31:0]out25;
	wire [31:0]out26;
	wire [31:0]out27;
	wire [31:0]out28;
	wire [31:0]out29;
	wire [31:0]out30;
	wire [31:0]out31;

	// Instantiate the Unit Under Test (UUT)
	register_bank uut (
		.r1(r1), 
		.r2(r2), 
		.write_reg(write_reg), 
		.write_data(write_data),
		.all_registers(all_registers),
		.d1(d1), 
		.d2(d2),
		.clk(clk),
		.reg_write_flag(reg_write_flag),
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
		.out31(out31)
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
		all_registers = 0;

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
		
		all_registers = 1;
		#10;
		all_registers = 0;
		
		#100;

		$fdisplay(f,"------------REGISTROS---------------\n");
		$fmonitor(f,"out0: ",out0,
						"out1: ",out1,
						"out2: ",out2,
						"out3: ",out3,
						"out4: ",out4,
						"out5: ",out5,
						"out6: ",out6,
						"out7: ",out7,
						"out8: ",out8,
						"out9: ",out9,
						"out10: ",out10,
						"out11: ",out11,
						"out12: ",out12,
						"out13: ",out13,
						"out14: ",out14,
						"out15: ",out15,
						"out16: ",out16,
						"out17: ",out17,
						"out18: ",out18,
						"out19: ",out19,
						"out20: ",out20,
						"out21: ",out21,
						"out22: ",out22,
						"out23: ",out23,
						"out24: ",out24,
						"out25: ",out25,
						"out26: ",out26,
						"out27: ",out27,
						"out28: ",out28,
						"out29: ",out29,
						"out30: ",out30,
						"out31: ",out31);
		$fdisplay(f,"---------------------------\n");
		
		
		
		
        
		// Add stimulus here
      $fdisplay(f,"Termina la simulacion. -Time: ",$time);
		$fclose(f);
		$finish;
	end
	
	always #5
	clk <= ~clk;
      
endmodule

