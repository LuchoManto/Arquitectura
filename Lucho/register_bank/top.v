`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:41:36 11/07/2015 
// Design Name: 
// Module Name:    top 
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
module top(
	input [4:0]r1,
	input [4:0]r2,
	input [4:0]write_reg,
	input [31:0]write_data,
	output reg [31:0] reg_toprint,
	output reg [31:0]d1,
	output reg [31:0]d2,
	input clk,
	
	input reg_write_flag,
	input print_all_flag,
	output reg finish_print
    );
	 
	 
	 reg [31:0] bank [31:0];
	 reg [4:0]counter;
	 reg printing;
	 
	 always@(posedge clk)
	 begin
	 
	 d1 <= bank[r1];
	 d2 <= bank[r2];
	 
	 bank[write_reg] <= reg_write_flag ? write_data : bank[write_reg];
	 
	 if(print_all_flag)
	 begin
		printing <= 1;
		counter <= 0;
	 end
	 
	 if(printing)
	 begin
		if(counter < 31)
		begin
			counter <= counter + 1;		
			reg_toprint <= bank[counter];
			printing <= 1;
		end
		else
		begin
			counter <= 0;
			reg_toprint <= reg_toprint;
			printing <= 0;
			finish_print <= 1;
		end
		
	 end
	 
	 
	 
	 end
	 
	 


endmodule
