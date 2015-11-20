`timescale 1ns / 1ps	
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:27 11/17/2015 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
	input wire [5:0]Op,
	input wire [5:0]Funct,
	input wire inicio,
	output reg [3:0]ALUControlID,
	output reg RegWriteD,
	output reg MemtoRegD,
	output reg [3:0]MemWriteD,		//NO Write 0000, Write Byte 0001, Write half 0011, Write ALL 1111
	output reg BranchD,
	output reg [1:0]ALUSrcD,  		//0 WriteDataE, 1 SignImmE, 2 SignImmE[10:6] para B y para A 2 WriteDataE y 0-1 SrcAE
	output reg RegDstD,				  
	output reg [3:0]ShiftD,
	output reg [1:0]MemReadD    //Read ALL 0, Read Byte 1, Read half 2
);

//ADD (0000), SUB(0001), AND(0010), OR(0011), XOR(0100), 
// NOR(0101), SLL(0110), SRL(0111), SRA(1000), SLT(1001)(SET ON LESS THAN, RESULTADO ES UNO SI EL A ES MENOR QUE B)

always @(*)
begin
	if(inicio)
	begin
		ALUControlID <= 0;
		RegWriteD <= 0;
		MemtoRegD <= 0;
		MemWriteD <= 0;
		BranchD <= 0;
		ALUSrcD <= 0;
		RegDstD <= 0;				 
		ShiftD <= 0;
		MemReadD <= 0;
	end
	else
	begin
	case(Op)
		6'b000000:	//Operacion del tipo R
		begin				
						RegWriteD 		<= 1;
						RegDstD 		<= 1;
						BranchD 		<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 0;
						MemReadD 		<= 0;
						ShiftD			<= 0;
						
						if(Funct == 'b100000) //ADD
						begin
							ALUControlID 	<= 'b0000; 
							ALUSrcD 			<= 0;
						end
						if(Funct == 'b100100) //AND
						begin
							ALUControlID 	<= 'b0010;
							ALUSrcD 			<= 0;
						end
						if(Funct == 'b000000) //SLL SHIFT LOGICAL LEFT
						begin
							ALUControlID 	<= 'b0110;
							ALUSrcD 			<= 2;	  //Deberia llegar el shift por el inmediato, bit del 6 al 10 de la instruccion..
						end
						if(Funct == 'b000010) //SRL SHIFT LOGICAL RIGHT
						begin
							ALUControlID 	<= 'b0111;
							ALUSrcD 			<= 2;	  //shift  bit del 6 al 10 de la instruccion. A SRC B	
						end
						if(Funct == 'b000011) //SRA SHIT ARITMETIC RIGHT
						begin
							ALUControlID 	<= 'b1000; 
							ALUSrcD 			<= 2;	  //Se hace el shift con los bits 6 al 10 de la instruccion.
						end
						if(Funct == 'b000110) //SRLV SHIFT LOGICAL RIGHT VARIABLE
						begin
							ALUControlID 	<= 'b0111;
							ALUSrcD 			<= 0;	 
						end
						if(Funct == 'b000111) //SRAV SHIFT ARITMETIC RIGHT VARIABLE
						begin
							ALUControlID 	<= 'b1000;
							ALUSrcD 			<= 0;	  
						end
						if(Funct == 'b000100) //SLLV SHIFT LEFT WORD BY VARIABLE
						begin
							ALUControlID 	<= 'b0110;
							ALUSrcD 			<= 0;	  
						end
						if(Funct == 'b100010) //SUB 
						begin
							ALUControlID 	<= 'b0001;
							ALUSrcD 			<= 0;	  
						end
						if(Funct == 'b100110) //XOR
						begin
							ALUControlID 	<= 'b0100;
							ALUSrcD 			<= 0;	  
						end
						if(Funct == 'b100101) //OR
						begin
							ALUControlID 	<= 'b0011;
							ALUSrcD 			<= 0;		
						end
						if(Funct == 'b100111) //NOR
						begin
							ALUControlID 	<= 'b0101;
							ALUSrcD 			<= 0;
						end
						if(Funct == 'b101010) //SLT
						begin
							ALUControlID 	<= 'b1001;
							ALUSrcD 			<= 0;
						end
		end
		6'b 100000:								//Operacion LB, Load a Byte
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 1;
						MemReadD 	<= 1;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0000;  //ADD
		end
		6'b 100001:								//Operacion LH, Load a 2 Byte
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 1;
						MemReadD 	<= 2;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0000;	//ADD
		end
		6'b 100011: 							//Operacion del tipo Load. LW
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 1;
						MemReadD 	<= 0; 
						ShiftD			<= 0; 
						ALUControlID 	<= 'b0000; //ADD
		end
		6'b 100111:								//Operacion LWU, Load Unsigned. Hay que tomarlo como el Load comun.
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 1;
						MemReadD 	<= 0;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0000;	//ADD
		end	
		6'b 100100:								//Operacion LBU, Load Unsigned. Hay que tomarlo como el Load comun.
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 1;
						MemReadD 	<= 1;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0000;	//ADD
		end		
		6'b 100101	:								//Operacion LHU, Load Unsigned. Hay que tomarlo como el Load comun.
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 1;
						MemReadD 	<= 2;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0000;	//ADD
		end
		6'b 101000:								//Operacion SB.
		begin
						RegWriteD 		<= 0;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 'b0001;   //SOLO GRABARIA UN BYTE (1 DE 4 MEMORIAS)
						MemtoRegD 		<= 0;
						MemReadD 	<= 0;
						ALUControlID 	<= 'b0000;	//ADD
		end
		6'b 101001:								//Operacion SH STORE HALF
		begin
						RegWriteD 		<= 0;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 'b0011;   //SOLO GUARDARIA EN 2 DE 4 MEMORIAS
						MemtoRegD 		<= 0;
						MemReadD 	<= 0;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0000;	//ADD
		end
		6'b 101011: 							//Operacion del tipo Storage. SW
		begin
						RegWriteD 		<= 0;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0; 
						MemWriteD 		<= 'b1111;  //GUARDARIA EN LAS 4 MEMORIAS
						MemtoRegD 		<= 0;
						MemReadD 	<= 0;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0000;	//ADD
		end
		6'b 001000:								//Operacion del tipo ADDI
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 0;
						MemReadD 	<= 0;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0000;	//ADD
		end
		6'b 001100:								//Operacion ANDI.
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 0;
						MemReadD 	<= 0;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0010;	//AND
		end
		6'b 001110:								//Operacion XORI.
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 0;
						MemReadD 	<= 0;
						ShiftD			<=	0;
						ALUControlID 	<= 'b0100;	//XOR
		end
		6'b 001101:								//Operacion ORI.
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 0;
						MemReadD 	<= 0;
						ShiftD			<=	0;
						ALUControlID 	<= 'b0011;	//OR
		end
		6'b 001010:								//Operacion SLTI. 
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 0;
						MemReadD 	<= 0;
						ShiftD			<=  0; 
						ALUControlID 	<= 'b1001; //SLT		
		end
		6'b 001111:								//Operacion LUI. 
		begin
						RegWriteD 		<= 1;
						RegDstD 			<= 0;
						ALUSrcD 			<= 1;   //VER QUE PONEN 16?¿?
						BranchD 			<= 0;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 0;
						MemReadD 	<= 0;
						ShiftD			<=  16; 
						ALUControlID 	<= 'b0110; //SLL
		end
		6'b 000100: 							//Operacion del tipo BEQ
		begin
						RegWriteD 		<= 0;
						RegDstD 			<= 0;
						ALUSrcD 			<= 0;
						BranchD 			<= 1;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 0;
						MemReadD 	<= 0;
						ShiftD			<= 0;
						ALUControlID 	<= 0; 
		end
		6'b 000101:								//Operacion BNE. 
		begin
						RegWriteD 		<= 0;
						RegDstD 			<= 0;
						ALUSrcD 			<= 0;
						BranchD 			<= 1;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 0;
						MemReadD 	<= 0;
						ShiftD			<=  0; 
						ALUControlID 	<= 0; 	
		end
		6'b 111111:								//Operacion END. 
		begin
			ALUControlID <= 0;
			RegWriteD <= 0;
			MemtoRegD <= 0;
			MemWriteD <= 0;
			BranchD <= 0;
			ALUSrcD <= 0;
			RegDstD <= 0;				 
			ShiftD <= 0;
			MemReadD <= 0;
		end	
		
		
	endcase
	end
end

endmodule
