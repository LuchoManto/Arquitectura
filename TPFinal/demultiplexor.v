`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:12:47 10/31/2015 
// Design Name: 
// Module Name:    demultiplexor 
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
module demultiplexor
(
	input [4:0] selector,
	input entrada,
	output reg salida0,
	output reg salida1,
	output reg salida2,
	output reg salida3,
	output reg salida4,
	output reg salida5,
	output reg salida6,
	output reg salida7,
	output reg salida8,
	output reg salida9,
	output reg salida10,
	output reg salida11,
	output reg salida12,
	output reg salida13,
	output reg salida14,
	output reg salida15,
	output reg salida16,
	output reg salida17,
	output reg salida18,
	output reg salida19,
	output reg salida20,
	output reg salida21,
	output reg salida22,
	output reg salida23,
	output reg salida24,
	output reg salida25,
	output reg salida26,
	output reg salida27,
	output reg salida28,
	output reg salida29,
	output reg salida30,
	output reg salida31
);

always @(*)
begin
	case (selector)
5'b00000:
	begin
		salida0 = entrada;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
	end
5'b00001: 
	begin
		salida0 = 0;
		salida1 = entrada;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
	end
5'b00010:
	begin
		salida0 = 0;
		salida1 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida2 = entrada;
	end
5'b00011:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida3 = entrada;
	end
5'b00100:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida4 = entrada;
	end
5'b00101:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida5 = entrada;
	end
5'b00110:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida6 = entrada;
	end
5'b00111:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida7 = entrada;
	end
5'b01000:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida8 = entrada;
	end
5'b01001:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida9 = entrada;
	end
5'b01010:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida10 = entrada;
	end
5'b01011:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida11 = entrada;
	end
5'b01100:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida12 = entrada;
	end
5'b01101:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida13 = entrada;
	end
5'b01110:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida14 = entrada;
	end
5'b01111:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida15 = entrada;
	end
5'b10000:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida16 = entrada;
	end
5'b10001:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida17 = entrada;
	end
5'b10010:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida18 = entrada;
	end
5'b10011:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida19 = entrada;
	end
5'b10100:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida20 = entrada;
	end
5'b10101:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida21 = entrada;
	end
5'b10110:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida22 = entrada;
	end
5'b10111:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida23 = entrada;
	end
5'b11000:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida24 = entrada;
	end
5'b11001:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida25 = entrada;
	end
5'b11010:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida26 = entrada;
	end
5'b11011:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida27 = entrada;
	end
5'b11100:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = 0;
		salida28 = entrada;
	end
5'b11101:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida30 = 0;
		salida31 = 0;
		salida29 = entrada;
	end
5'b11110:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida31 = 0;
		salida30 = entrada;
	end
	5'b11111:
	begin
		salida0 = 0;
		salida1 =  0;
		salida2 =  0;
		salida3 =  0;
		salida4 =  0;
		salida5 =  0;
		salida6 =  0;
		salida7 =  0;
		salida8 =  0;
		salida9 =  0;
		salida10 = 0;
		salida11 = 0;
		salida12 = 0;
		salida13 = 0;
		salida14 = 0;
		salida15 = 0;
		salida16 = 0;
		salida17 = 0;
		salida18 = 0;
		salida19 = 0;
		salida20 = 0;
		salida21 = 0;
		salida22 = 0;
		salida23 = 0;
		salida24 = 0;
		salida25 = 0;
		salida26 = 0;
		salida27 = 0;
		salida28 = 0;
		salida29 = 0;
		salida30 = 0;
		salida31 = entrada;
	end

	endcase
end
 

endmodule
