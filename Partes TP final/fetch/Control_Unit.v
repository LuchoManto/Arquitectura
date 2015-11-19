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
	output reg [3:0]ALUControlID,
	output reg RegWriteD,
	output reg MemtoRegD,
	output reg MemWriteD,
	output reg BranchD,
	output reg ALUSrcD,
	output reg RegDstD,				  //Esta señal la uso para ver que señal es la qe voy a usar para el WB.
	output reg [3:0]ShiftD,
	output reg [3:0]MemReadByte, //esta bandera la voy a usar para un modulo que este despues de la memoria para enmascarar 
										 //la salida de 32bits, y usar solo los necesarios. Como en LB que necesito solo 1 byte.
	output reg [3:0] MemWriteByte
	 );

//ADD (0000), SUB(0001), AND(0010), OR(0011), XOR(0100), 
// NOR(0101), SLL(0110), SRL(0111), SRA(1000), SLT(1001)(SET ON LESS THAN, RESULTADO ES UNO SI EL A ES MENOR QUE B)

always @(*)
begin
	case(Op)
		6'b 000000:	//Operacion del tipo R
		begin				
						RegWriteD 		<= 1;
						RegDstD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<=	0;
						MemtoRegD 		<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
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
							ALUSrcD 			<= 1;	  //Deberia llegar el shift por el inmediato, bit del 6 al 10 de la instruccion..
						end
						if(Funct == 'b000010) //SRL SHIFT LOGICAL RIGHT
						begin
							ALUControlID 	<= 'b0111;
							ALUSrcD 			<= 1;	  //Deberia llegar el shift por el inmediato bit del 6 al 10 de la instruccion.	
						end
						if(Funct == 'b000011) //SRA SHIT ARITMETIC RIGHT
						begin
							ALUControlID 	<= 'b1000; 
							ALUSrcD 			<= 1;	  //Se hace el shift con los bits 6 al 10 de la instruccion.
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
						MemReadByte 	<= 'b0001;
						MemWriteByte	<= 'b1111;
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
						MemReadByte 	<= 'b0011;
						MemWriteByte	<= 'b1111;
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
						MemReadByte 	<= 'b1111; //tengo que cargar toda la linea. 32 bits.
						MemWriteByte	<= 'b1111;
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
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
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
						MemReadByte 	<= 'b0001;
						MemWriteByte	<= 'b1111;
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
						MemReadByte 	<= 'b0011;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0000;	//ADD
		end
		6'b 101000:								//Operacion SB.
		begin
						RegWriteD 		<= 0;
						RegDstD 			<= 1'bX;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 1;   //SOLO GRABARIA UN BYTE (1 DE 4 MEMORIAS)
						MemtoRegD 		<= 1'bX;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b0001;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0000;	//ADD
		end
		6'b 101001:								//Operacion SH STORE HALF
		begin
						RegWriteD 		<= 0;
						RegDstD 			<= 1'bX;
						ALUSrcD 			<= 1;
						BranchD 			<= 0;
						MemWriteD 		<= 1;   //SOLO GUARDARIA EN 2 DE 4 MEMORIAS
						MemtoRegD 		<= 1'bX;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b0011;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0000;	//ADD
		end
		6'b 101011: 							//Operacion del tipo Storage. SW
		begin
						RegWriteD 		<= 0;
						RegDstD 			<= 1'bX;
						ALUSrcD 			<= 1;
						BranchD 			<= 0; 
						MemWriteD 		<= 1;  //GUARDARIA EN LAS 4 MEMORIAS
						MemtoRegD 		<= 1'bX;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
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
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
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
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
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
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
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
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
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
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
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
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<=  16; 
						ALUControlID 	<= 'b0110; //SLL
		end
		
		/*
		6'b 000100: 							//Operacion del tipo BEQ
		begin
						RegWriteD 		<= 0;
						RegDstD 			<= 1'bX;
						ALUSrcD 			<= 0;
						BranchD 			<= 1;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 1'bX;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						ALUControlID 	<= 'b0001; //resto
		end		
		6'b 000101:								//Operacion BNE. 
		begin
						RegWriteD 		<= 0;
						RegDstD 			<= 1'bX;
						ALUSrcD 			<= 0;
						BranchD 			<= 1;
						MemWriteD 		<= 0;
						MemtoRegD 		<= 1'bX;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<=  0; 
						ALUControlID 	<= 'b0001; //RESTA	
		end
		*/
		
	endcase
end

endmodule
