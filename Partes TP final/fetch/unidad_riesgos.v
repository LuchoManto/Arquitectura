`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:26 11/18/2015 
// Design Name: 
// Module Name:    unidad_riesgos 
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
module unidad_riesgos(
	input wire BranchD,
	input wire [4:0]RsD,
	input wire [4:0]RtD,
	input wire [4:0]RsE,
	input wire [4:0]RtE,
	input wire [4:0]WriteRegE,
	input wire MemtoRegE,
	input wire RegWriteE,
	input wire [4:0]WriteRegM,
	input wire RegWriteM,
	input wire [4:0]WriteRegW,
	input wire RegWriteW,
	input wire MemtoRegM,
	input wire inicio,
	output reg StallF,
	output reg StallD,
	output reg ForwardAD,
	output reg ForwardBD,
	output reg FlushE,
	output reg [1:0]ForwardAE,
	output reg [1:0]ForwardBE
    );

reg lwstall;
reg branchstall;

always@(*)
begin
	if(inicio)
	begin
		StallF <= 0;
		StallD <= 0;
		ForwardAD <= 0;
		ForwardBD <= 0;
		FlushE <= 0;
		ForwardAE <= 'b00;
		ForwardBE <= 'b00;
	end
	else
	begin
		if ((RsE == WriteRegM) && RegWriteM)
		begin
			ForwardAE <= 'b10;
		end
		else 
		begin
			if ((RsE == WriteRegW) && RegWriteW) 
			begin
				ForwardAE <= 'b01;
			end
			else 
			begin
				ForwardAE <= 'b00;
			end
		end
		
		if ((RtE == WriteRegM) && RegWriteM)
		begin
			ForwardBE <= 'b10;
		end
		else 
		begin
			if ((RtE == WriteRegW) && RegWriteW) 
			begin
				ForwardBE <= 'b01;
			end
			else 
			begin
				ForwardBE <= 'b00;
			end
		end
		
		lwstall <=((RsD == RtE) || (RtD == RtE)) && MemtoRegE;
		StallF <= lwstall;
		StallD <= lwstall;
		FlushE <= lwstall;	
		
		ForwardAD <= (RsD != 0) && (RsD == WriteRegM) && RegWriteM;
		ForwardBD <= (RtD != 0) && (RtD == WriteRegM) && RegWriteM;
		
		
		branchstall <= (BranchD && RegWriteE && (WriteRegE == RsD || WriteRegE == RtD)) || (BranchD && MemtoRegM && (WriteRegM == RsD || WriteRegM == RtD));
		StallF <= (lwstall || branchstall);
		StallD <= (lwstall || branchstall);
		FlushE <= (lwstall || branchstall);
	end
end
endmodule