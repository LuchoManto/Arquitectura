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
	output reg [1:0]ForwardAD,
	output reg [1:0]ForwardBD,
	output reg FlushE,
	output reg [1:0]ForwardAE,
	output reg [1:0]ForwardBE
    );

reg lwstall;
reg branchstall;
reg branchstall_memtoreg_e_a; //cuando hay un memtoreg en la etapa de ex que coincide con la comparacion del branch
reg branchstall_memtoreg_e_b;

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
	
		/*
			Cortocircuitos entrada alu
		*/
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
		

		if((RsD == WriteRegM) && RegWriteM)
		begin
			//Cortocircuito cuando branch utiliza un registro que una intruccion anterior todavia no escribio y se encuentra en 
			//etapa de mem pero el resultado se encuentra en aluoutm.
			ForwardAD <= 1;
		end
		else
		begin
			/*
			Cuando compara un valor de salida de alu a ser guardado en un registro que utiliza para hacer el branch 
			cortocircuito salida de alu a la de la comparacion. La instruccion que tiene que guardar en el registro
			se encuentra en este caso en la etapa de EX			(ForwardAD = 2)
			*/
			if(BranchD && RegWriteE && (WriteRegE == RsD))
			begin
				/*Si la que coincide tiene que leer de memoria y no es una operación de alu  y se encuentra en etapa de ex
				tengo que hacer stall para que lea la memoria*/
				if(MemtoRegE)
				begin
					branchstall_memtoreg_e_a = 1;
				end
				ForwardAD <= 2;
			end
			else
			begin
				ForwardAD <= 0;
				branchstall_memtoreg_e_a = 0;
			end
		end
		
		
		//ForwardBD <= (RtD == WriteRegM) && RegWriteM;
		
		if((RtD == WriteRegM) && RegWriteM)
		begin
			/*ALUOutM al comparador desde BD*/
			ForwardBD <= 1;
		end
		else
		begin
			if(BranchD && RegWriteE && (WriteRegE == RtD))
			begin
				/*Si la que coincide tiene que leer de memoria y no es una operación de alu*/
				if(MemtoRegE)
				begin
					branchstall_memtoreg_e_b = 1;
				end
				ForwardBD <= 2;
			end
			else
			begin
				ForwardBD <= 0;
				branchstall_memtoreg_e_b = 0;
			end
		end
		
		/*
			Detiene cuando hay un load en la etapa ex y el registro destino
			lo utiliza como parametro la instruccion que le sigue.
		*/
		lwstall <=((RsD == RtE) || (RtD == RtE)) && MemtoRegE;
		
		/*
		Para mi (BranchD && RegWriteE && (WriteRegE == RsD || WriteRegE == RtD))
		no es necesario que esto haga stall, puede hacer un cortocircuito con la salida de la alu en etapa de ex (ALUOut)
		*/
		//branchstall <= (BranchD && RegWriteE && (WriteRegE == RsD || WriteRegE == RtD)) || (BranchD && MemtoRegM && (WriteRegM == RsD || WriteRegM == RtD));
		/*
			Se hace stall cuando hay una operacion que tiene que leer de memoria y guardar en un registro que esta siendo comparado
			por un branch en la etapa de ID, si la operacion de lectura se encuentra en etapa de EX es detectada arriba
			si esta en la etapa de mem es la comparacion de aca (branchstall)
		*/
		branchstall <= (BranchD && MemtoRegM && (WriteRegM == RsD || WriteRegM == RtD));
		StallF <= (lwstall || branchstall || branchstall_memtoreg_e_a || branchstall_memtoreg_e_b);
		StallD <= (lwstall || branchstall || branchstall_memtoreg_e_a || branchstall_memtoreg_e_b);
		FlushE <= (lwstall || branchstall || branchstall_memtoreg_e_a || branchstall_memtoreg_e_b);
		
	end
end
endmodule
