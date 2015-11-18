`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:20 11/16/2015 
// Design Name: 
// Module Name:    controlalu 
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
module controlalu(
	input wire [5:0]Opcode,
	input wire [5:0]Inst_op,
	input wire clk,
	output reg [3:0]AluControl,
	output reg regW,
	output reg MemReg,
	output reg memWritte,
	output reg Branch,
	output reg [1:0]AluSrcD,
	output reg RegD,				  //Esta señal la uso para ver que señal es la qe voy a usar para el WB.
	output reg [3:0]ShiftD,
	output reg [3:0]MemReadByte, //esta bandera la voy a usar para un modulo que este despues de la memoria para enmascarar 
										 //la salida de 32bits, y usar solo los necesarios. Como en LB que necesito solo 1 byte.
	output reg [3:0] MemWriteByte
	 );

//ADD (0000), SUB(0001), AND(0010), OR(0011), XOR(0100), NOR(0101), SLL(0110), SRL(0111), SRA(1000), SLT(1001)(SET ON LESS THAN, RESULTADO ES UNO SI EL A ES MENOR QUE B)

always @(*)
begin
	case(Inst_op)
		6'b 000000:							   //Operacion del tipo R
		begin				
						regW 				<= 0;
						RegD 				<= 0;
						Branch 			<= 0;
						memWritte 		<=	0;
						MemReg 			<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						
						if(Opcode == 'b100000) //ADD
						begin
							AluControl 	<= 'b0000;
							AluSrcD 		<= 'b00;
						end
						if(Opcode == 'b100100) //AND
						begin
							AluControl 	<= 'b0010;
							AluSrcD 		<= 'b00;
						end
						if(Opcode == 'b000000) //SLL SHIFT LOGICAL LEFT
						begin
							AluControl <= 'b0110;
							AluSrcD <= 'b01;	  //Deberia llegar el shift por el inmediato, bit del 6 al 10 de la instruccion..
						end
						if(Opcode == 'b000010) //SRL SHIFT LOGICAL RIGHT
						begin
							AluControl 	<= 'b0111;
							AluSrcD 		<= 'b01;	  //Deberia llegar el shift por el inmediato bit del 6 al 10 de la instruccion.	
						end
						if(Opcode == 'b000011) //SRA SHIT ARITMETIC RIGHT
						begin
							AluControl 	<= 'b1000; 
							AluSrcD 		<= 'b01;	  //Se hace el shift con los bits 6 al 10 de la instruccion.
						end
						if(Opcode == 'b000110) //SRLV SHIFT LOGICAL RIGHT VARIABLE
						begin
							AluControl 	<= 'b0111;
							AluSrcD 		<= 'b00;	  //El shift se hace con el registro B
						end
						if(Opcode == 'b000111) //SRAV SHIFT ARITMETIC RIGHT VARIABLE
						begin
							AluControl 	<= 1000;
							AluSrcD 		<= 'b00;	  //El shift se hace con el registro B	
						end
						if(Opcode == 'b000100) //SLLV SHIFT LEFT WORD BY VARIABLE
						begin
							AluControl 	<= 0110;
							AluSrcD 		<= 'b00;	  //El shift se hace con el registro B.	
						end
						if(Opcode == 'b100010) //SUB 
						begin
							AluControl 	<= 'b0001;
							AluSrcD 		<= 'b00;	  //Con el registro B.	
						end
						if(Opcode == 'b100110) //XOR
						begin
							AluControl 	<= 'b0100;
							AluSrcD 		<= 'b00;	  //Con el registro B.
						end
						if(Opcode == 'b100101) //OR
						begin
							AluControl 	<= 'b0011;
							AluSrcD 		<= 'b00;		//Con el registro B
						end
						if(Opcode == 'b100111) //NOR
						begin
							AluControl 	<= 'b0101;
							AluSrcD 		<= 'b00;
						end
						if(Opcode == 'b100111) //SLT
						begin
							RegD		  	<= 1;
							AluControl 	<= 'b1001;
							AluSrcD 		<= 'b00;
						end
		end
		6'b 100011: 							//Operacion del tipo Load.
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 1;
						MemReadByte 	<= 'b1111; //tengo que cargar toda la linea. 32 bits.
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0; 
						AluControl 		<= 'b0000; //sumo
		end
		6'b 101011: 							//Operacion del tipo Storage.
		begin
						regW 				<= 0;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 1;
						MemReg 			<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						AluControl 		<= 'b0000;
		end
		6'b 000100: 							//Operacion del tipo BEQ
		begin
						regW 				<= 0;
						RegD 				<= 1;
						AluSrcD 			<= 'b01;
						Branch 			<= 1;
						memWritte 		<= 0;
						MemReg 			<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						AluControl 		<= 'b0001; //resto
		end
		6'b 001000:								//Operacion del tipo ADDI
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						AluControl 		<= 0000;
		end
		6'b 100000:								//Operacion LB, Load a Byte
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 1;
						MemReadByte 	<= 'b0001;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						AluControl 		<= 0000;
		end
		6'b 100100:								//Operacion LBU, Load Unsigned. Hay que tomarlo como el Load comun.
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 1;
						MemReadByte 	<= 'b0001;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						AluControl 		<= 0000;
		end
		6'b 100001:								//Operacion LH, Load a 2 Byte
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 1;
						MemReadByte 	<= 'b0011;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						AluControl 		<= 0000;
		end
		6'b 100101	:								//Operacion LHU, Load Unsigned. Hay que tomarlo como el Load comun.
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 1;
						MemReadByte 	<= 'b0011;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						AluControl 		<= 0000;
		end
		6'b 100111:								//Operacion LWU, Load Unsigned. Hay que tomarlo como el Load comun.
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 1;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						AluControl 		<= 0000;
		end
		6'b 101000:								//Operacion SU.
		begin
						regW 				<= 0;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 1;
						MemReg 			<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b0001;
						ShiftF			<= 0;
						AluControl 		<= 0000;
		end
		6'b 101001:								//Operacion SH
		begin
						regW 				<= 0;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 1;
						MemReg 			<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b0011;
						ShiftF			<= 0;
						AluControl 		<= 0000;
		end
		6'b 001100:								//Operacion ANDI.
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<= 0;
						AluControl 		<= 0010;
		end
		6'b 001101:								//Operacion ORI.
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<=	0;
						AluControl 		<= 0011;
		end		
		6'b 001110:								//Operacion XORI.
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftF			<=	0;
						AluControl 		<= 0100;
		end
		6'b 001100:								//Operacion LUI. 
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 1;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<=  16; 
						AluControl 		<= 0110; //SLL
		end
		6'b 001010:								//Operacion SLTI. 
		begin
						regW 				<= 1;
						RegD 				<= 0;
						AluSrcD 			<= 'b01;
						Branch 			<= 0;
						memWritte 		<= 0;
						MemReg 			<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<=  0; 
						AluControl 		<= 1001; //SLT		
		end
		6'b 001010:								//Operacion BNE. 
		begin
						regW 				<= 0;
						RegD 				<= 1;
						AluSrcD 			<= 'b01;
						Branch 			<= 1;
						memWritte 		<= 0;
						MemReg 			<= 0;
						MemReadByte 	<= 'b1111;
						MemWriteByte	<= 'b1111;
						ShiftD			<=  0; 
						AluControl 		<= 0001; //SLT		
		end
		
	endcase
end


endmodule
