`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:24 11/07/2015 
// Design Name: 
// Module Name:    modulo_test 
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
module modulo_test
(
	input wire [7:0]r_data,
	input wire clk,
	input wire rx_empty,
	input wire tx_full,
	output reg [7:0]w_data,
	output reg rd,
	output reg wr,
	output reg [3:0]current_state_o
);

	
//Estados
localparam [3:0] START = 4'b0000,
					  IDLE = 4'b0001,
					  RECIBO = 4'b0010,
					  PASO	= 4'b0011,
					  CONTINUO = 4'b0100,
					  ENVIAR = 4'b0101,
					  ESPERO = 4'b0110;
					  
					  
					  
//Variables internas
reg [7:0] buffer = 1;
reg [3:0] current_state = 4'b0000;
reg [3:0] next_state = 4'b0000;

//Variables para el pipe.
reg inicio = 0; //variable que reinicia todo el pipe a 0.
reg activo = 0; //Variable que habilita los clk del pipe.
reg [2:0]s = 0;
reg signed [14:0]indice = 0; //variable utilizada para enviar el buffer
reg [7:0]bytes = 148; //cantidad de bytes a enviar en buffer envio

//Cables para el pipe
// PC
wire [8:0]PCF;
//Instruccion
wire [31:0]InstrD;

// señales de control
wire [1:0]MemReadD;
wire RegWriteD;
wire MemtoRegD;
wire [3:0]MemWriteD;
wire [3:0]ALUControlID;
wire [1:0]ALUSrcD;
wire RegDstD;
wire BranchD; 

//banco de registros
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

// señales de salida de la unidad de riesgos
wire StallF;
wire StallD;
wire [1:0]ForwardAD;
wire [1:0]ForwardBD;
wire FlushE;
wire [1:0]ForwardAE;
wire [1:0]ForwardBE;

wire finalW;

Pipe pipeline
(
	.clk(clk),
	.inicio(inicio),
	.activo(activo),
	.PCF_o(PCF),
	.InstrD_o(InstrD),
	.MemReadD_o(MemReadD),
	.RegWriteD_o(RegWriteD),
	.MemtoRegD_o(MemtoRegD),
	.MemWriteD_o(MemWriteD),
	.ALUControlID_o(ALUControlID),
	.ALUSrcD_o(ALUSrcD),
	.RegDstD_o(RegDstD),
	.BranchD_o(BranchD), 
	.out0_o(out0),
	.out1_o(out1),
	.out2_o(out2),
	.out3_o(out3),
	.out4_o(out4),
	.out5_o(out5),
	.out6_o(out6),
	.out7_o(out7),
	.out8_o(out8),
	.out9_o(out9),
	.out10_o(out10),
	.out11_o(out11),
	.out12_o(out12),
	.out13_o(out13),
	.out14_o(out14),
	.out15_o(out15),
	.out16_o(out16),
	.out17_o(out17),
	.out18_o(out18),
	.out19_o(out19),
	.out20_o(out20),
	.out21_o(out21),
	.out22_o(out22),
	.out23_o(out23),
	.out24_o(out24),
	.out25_o(out25),
	.out26_o(out26),
	.out27_o(out27),
	.out28_o(out28),
	.out29_o(out29),
	.out30_o(out30),
	.out31_o(out31),
	.StallF_o(StallF),
	.StallD_o(StallD),
	.ForwardAD_o(ForwardAD),
	.ForwardBD_o(ForwardBD),
	.FlushE_o(FlushE),
	.ForwardAE_o(ForwardAE),
	.ForwardBE_o(ForwardBE),
	.finalW_o(finalW)
);

wire [1183:0]buffer_envio;

Buffer_out #(1184) superbuffer
(
	.PCF(PCF),
	.InstrD(InstrD),
	.MemReadD(MemReadD),
	.RegWriteD(RegWriteD),
	.MemtoRegD(MemtoRegD),
	.MemWriteD(MemWriteD),
	.ALUControlID(ALUControlID),
	.ALUSrcD(ALUSrcD),
	.RegDstD(RegDstD),
	.BranchD(BranchD), 
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
	.out31(out31),
	.StallF(StallF),
	.StallD(StallD),
	.ForwardAD(ForwardAD),
	.ForwardBD(ForwardBD),
	.FlushE(FlushE),
	.ForwardAE(ForwardAE),
	.ForwardBE(ForwardBE),
	.buffer_envio(buffer_envio)
);


always @(posedge clk)
begin
		current_state <= next_state;
		current_state_o <= next_state;
end

		
always @(posedge clk) // always de logica de salida
begin
	case(current_state)
		START:
			begin
				w_data=buffer;
				rd = 0;
				wr = 0;
				//Inicializo el pipe
				inicio = 1;
				activo = 1;
				if(s == 3)
				begin
					s = 0;
					next_state = IDLE;
				end
				else
				begin
					s = s+1;
					next_state = START;
				end
			end
		IDLE: // estado inicial. Idle
				begin
					activo = 0;
					inicio = -1;
					if(rx_empty == 0)
					begin
						rd=1;
						next_state = RECIBO;
					end
					else
					begin
						rd=0;
						next_state = IDLE;
					end
				end
		RECIBO: 
				begin
					//Espero que rx empty vuelva a 1
					if(rx_empty == 1)
					begin
						buffer = r_data;
						rd = 0;
						/*
							si buffer es p voy a paso
							si buffer es c voy a cont
						*/
						next_state = CONTINUO;
					end
					else
					begin
						next_state = RECIBO;
					end
				end
		CONTINUO:
				begin
					activo = 1;
					indice = -1;
					if(finalW == 1)
					begin
						next_state = ENVIAR;
					end
					else
					begin
						next_state = CONTINUO;
					end
				end
		ENVIAR:
				begin
					indice = indice+1;
					case(indice)
							0:
							begin
								w_data = 99;
							end
							1:
							begin
								w_data = buffer_envio[(1*8)-1 : (1*8)-8];
							end
							2:
							begin
								w_data = buffer_envio[(	2*8)-1 : (	2*8)-8];
							end
							3:
							begin
								w_data = buffer_envio[(	3*8)-1 : (	3*8)-8];
							end
							4:
							begin
								w_data = buffer_envio[(	4*8)-1 : (	4*8)-8];
							end
							5:
							begin
								w_data = buffer_envio[(	5*8)-1 : (	5*8)-8];
							end
							6:
							begin
								w_data = buffer_envio[(	6*8)-1 : (	6*8)-8];
							end
							7:
							begin
								w_data = buffer_envio[(	7*8)-1 : (	7*8)-8];
							end
							8:
							begin
								w_data = buffer_envio[(	8*8)-1 : (	8*8)-8];
							end
							9:
							begin
								w_data = buffer_envio[(	9*8)-1 : (	9*8)-8];
							end
							10:
							begin
								w_data = buffer_envio[(	10*8)-1 : (	10*8)-8];
							end
							11:
							begin
								w_data = buffer_envio[(	11*8)-1 : (	11*8)-8];
							end
							12:
							begin
								w_data = buffer_envio[(	12*8)-1 : (	12*8)-8];
							end
							13:
							begin
								w_data = buffer_envio[(	13*8)-1 : (	13*8)-8];
							end
							14:
							begin
								w_data = buffer_envio[(	14*8)-1 : (	14*8)-8];
							end
							15:
							begin
								w_data = buffer_envio[(	15*8)-1 : (	15*8)-8];
							end
							16:
							begin
								w_data = buffer_envio[(	16*8)-1 : (	16*8)-8];
							end
							17:
							begin
								w_data = buffer_envio[(	17*8)-1 : (	17*8)-8];
							end
							18:
							begin
								w_data = buffer_envio[(	18*8)-1 : (	18*8)-8];
							end
							19:
							begin
								w_data = buffer_envio[(	19*8)-1 : (	19*8)-8];
							end
							20:
							begin
								w_data = buffer_envio[(	20*8)-1 : (	20*8)-8];
							end
							21:
							begin
								w_data = buffer_envio[(	21*8)-1 : (	21*8)-8];
							end
							22:
							begin
								w_data = buffer_envio[(	22*8)-1 : (	22*8)-8];
							end
							23:
							begin
								w_data = buffer_envio[(	23*8)-1 : (	23*8)-8];
							end
							24:
							begin
								w_data = buffer_envio[(	24*8)-1 : (	24*8)-8];
							end
							25:
							begin
								w_data = buffer_envio[(	25*8)-1 : (	25*8)-8];
							end
							26:
							begin
								w_data = buffer_envio[(	26*8)-1 : (	26*8)-8];
							end
							27:
							begin
								w_data = buffer_envio[(	27*8)-1 : (	27*8)-8];
							end
							28:
							begin
								w_data = buffer_envio[(	28*8)-1 : (	28*8)-8];
							end
							29:
							begin
								w_data = buffer_envio[(	29*8)-1 : (	29*8)-8];
							end
							30:
							begin
								w_data = buffer_envio[(	30*8)-1 : (	30*8)-8];
							end
							31:
							begin
								w_data = buffer_envio[(	31*8)-1 : (	31*8)-8];
							end
							32:
							begin
								w_data = buffer_envio[(	32*8)-1 : (	32*8)-8];
							end
							33:
							begin
								w_data = buffer_envio[(	33*8)-1 : (	33*8)-8];
							end
							34:
							begin
								w_data = buffer_envio[(	34*8)-1 : (	34*8)-8];
							end
							35:
							begin
								w_data = buffer_envio[(	35*8)-1 : (	35*8)-8];
							end
							36:
							begin
								w_data = buffer_envio[(	36*8)-1 : (	36*8)-8];
							end
							37:
							begin
								w_data = buffer_envio[(	37*8)-1 : (	37*8)-8];
							end
							38:
							begin
								w_data = buffer_envio[(	38*8)-1 : (	38*8)-8];
							end
							39:
							begin
								w_data = buffer_envio[(	39*8)-1 : (	39*8)-8];
							end
							40:
							begin
								w_data = buffer_envio[(	40*8)-1 : (	40*8)-8];
							end
							41:
							begin
								w_data = buffer_envio[(	41*8)-1 : (	41*8)-8];
							end
							42:
							begin
								w_data = buffer_envio[(	42*8)-1 : (	42*8)-8];
							end
							43:
							begin
								w_data = buffer_envio[(	43*8)-1 : (	43*8)-8];
							end
							44:
							begin
								w_data = buffer_envio[(	44*8)-1 : (	44*8)-8];
							end
							45:
							begin
								w_data = buffer_envio[(	45*8)-1 : (	45*8)-8];
							end
							46:
							begin
								w_data = buffer_envio[(	46*8)-1 : (	46*8)-8];
							end
							47:
							begin
								w_data = buffer_envio[(	47*8)-1 : (	47*8)-8];
							end
							48:
							begin
								w_data = buffer_envio[(	48*8)-1 : (	48*8)-8];
							end
							49:
							begin
								w_data = buffer_envio[(	49*8)-1 : (	49*8)-8];
							end
							50:
							begin
								w_data = buffer_envio[(	50*8)-1 : (	50*8)-8];
							end
							51:
							begin
								w_data = buffer_envio[(	51*8)-1 : (	51*8)-8];
							end
							52:
							begin
								w_data = buffer_envio[(	52*8)-1 : (	52*8)-8];
							end
							53:
							begin
								w_data = buffer_envio[(	53*8)-1 : (	53*8)-8];
							end
							54:
							begin
								w_data = buffer_envio[(	54*8)-1 : (	54*8)-8];
							end
							55:
							begin
								w_data = buffer_envio[(	55*8)-1 : (	55*8)-8];
							end
							56:
							begin
								w_data = buffer_envio[(	56*8)-1 : (	56*8)-8];
							end
							57:
							begin
								w_data = buffer_envio[(	57*8)-1 : (	57*8)-8];
							end
							58:
							begin
								w_data = buffer_envio[(	58*8)-1 : (	58*8)-8];
							end
							59:
							begin
								w_data = buffer_envio[(	59*8)-1 : (	59*8)-8];
							end
							60:
							begin
								w_data = buffer_envio[(	60*8)-1 : (	60*8)-8];
							end
							61:
							begin
								w_data = buffer_envio[(	61*8)-1 : (	61*8)-8];
							end
							62:
							begin
								w_data = buffer_envio[(	62*8)-1 : (	62*8)-8];
							end
							63:
							begin
								w_data = buffer_envio[(	63*8)-1 : (	63*8)-8];
							end
							64:
							begin
								w_data = buffer_envio[(	64*8)-1 : (	64*8)-8];
							end
							65:
							begin
								w_data = buffer_envio[(	65*8)-1 : (	65*8)-8];
							end
							66:
							begin
								w_data = buffer_envio[(	66*8)-1 : (	66*8)-8];
							end
							67:
							begin
								w_data = buffer_envio[(	67*8)-1 : (	67*8)-8];
							end
							68:
							begin
								w_data = buffer_envio[(	68*8)-1 : (	68*8)-8];
							end
							69:
							begin
								w_data = buffer_envio[(	69*8)-1 : (	69*8)-8];
							end
							70:
							begin
								w_data = buffer_envio[(	70*8)-1 : (	70*8)-8];
							end
							71:
							begin
								w_data = buffer_envio[(	71*8)-1 : (	71*8)-8];
							end
							72:
							begin
								w_data = buffer_envio[(	72*8)-1 : (	72*8)-8];
							end
							73:
							begin
								w_data = buffer_envio[(	73*8)-1 : (	73*8)-8];
							end
							74:
							begin
								w_data = buffer_envio[(	74*8)-1 : (	74*8)-8];
							end
							75:
							begin
								w_data = buffer_envio[(	75*8)-1 : (	75*8)-8];
							end
							76:
							begin
								w_data = buffer_envio[(	76*8)-1 : (	76*8)-8];
							end
							77:
							begin
								w_data = buffer_envio[(	77*8)-1 : (	77*8)-8];
							end
							78:
							begin
								w_data = buffer_envio[(	78*8)-1 : (	78*8)-8];
							end
							79:
							begin
								w_data = buffer_envio[(	79*8)-1 : (	79*8)-8];
							end
							80:
							begin
								w_data = buffer_envio[(	80*8)-1 : (	80*8)-8];
							end
							81:
							begin
								w_data = buffer_envio[(	81*8)-1 : (	81*8)-8];
							end
							82:
							begin
								w_data = buffer_envio[(	82*8)-1 : (	82*8)-8];
							end
							83:
							begin
								w_data = buffer_envio[(	83*8)-1 : (	83*8)-8];
							end
							84:
							begin
								w_data = buffer_envio[(	84*8)-1 : (	84*8)-8];
							end
							85:
							begin
								w_data = buffer_envio[(	85*8)-1 : (	85*8)-8];
							end
							86:
							begin
								w_data = buffer_envio[(	86*8)-1 : (	86*8)-8];
							end
							87:
							begin
								w_data = buffer_envio[(	87*8)-1 : (	87*8)-8];
							end
							88:
							begin
								w_data = buffer_envio[(	88*8)-1 : (	88*8)-8];
							end
							89:
							begin
								w_data = buffer_envio[(	89*8)-1 : (	89*8)-8];
							end
							90:
							begin
								w_data = buffer_envio[(	90*8)-1 : (	90*8)-8];
							end
							91:
							begin
								w_data = buffer_envio[(	91*8)-1 : (	91*8)-8];
							end
							92:
							begin
								w_data = buffer_envio[(	92*8)-1 : (	92*8)-8];
							end
							93:
							begin
								w_data = buffer_envio[(	93*8)-1 : (	93*8)-8];
							end
							94:
							begin
								w_data = buffer_envio[(	94*8)-1 : (	94*8)-8];
							end
							95:
							begin
								w_data = buffer_envio[(	95*8)-1 : (	95*8)-8];
							end
							96:
							begin
								w_data = buffer_envio[(	96*8)-1 : (	96*8)-8];
							end
							97:
							begin
								w_data = buffer_envio[(	97*8)-1 : (	97*8)-8];
							end
							98:
							begin
								w_data = buffer_envio[(	98*8)-1 : (	98*8)-8];
							end
							99:
							begin
								w_data = buffer_envio[(	99*8)-1 : (	99*8)-8];
							end
							100:
							begin
								w_data = buffer_envio[(	100*8)-1 : (	100*8)-8];
							end
							101:
							begin
								w_data = buffer_envio[(	101*8)-1 : (	101*8)-8];
							end
							102:
							begin
								w_data = buffer_envio[(	102*8)-1 : (	102*8)-8];
							end
							103:
							begin
								w_data = buffer_envio[(	103*8)-1 : (	103*8)-8];
							end
							104:
							begin
								w_data = buffer_envio[(	104*8)-1 : (	104*8)-8];
							end
							105:
							begin
								w_data = buffer_envio[(	105*8)-1 : (	105*8)-8];
							end
							106:
							begin
								w_data = buffer_envio[(	106*8)-1 : (	106*8)-8];
							end
							107:
							begin
								w_data = buffer_envio[(	107*8)-1 : (	107*8)-8];
							end
							108:
							begin
								w_data = buffer_envio[(	108*8)-1 : (	108*8)-8];
							end
							109:
							begin
								w_data = buffer_envio[(	109*8)-1 : (	109*8)-8];
							end
							110:
							begin
								w_data = buffer_envio[(	110*8)-1 : (	110*8)-8];
							end
							111:
							begin
								w_data = buffer_envio[(	111*8)-1 : (	111*8)-8];
							end
							112:
							begin
								w_data = buffer_envio[(	112*8)-1 : (	112*8)-8];
							end
							113:
							begin
								w_data = buffer_envio[(	113*8)-1 : (	113*8)-8];
							end
							114:
							begin
								w_data = buffer_envio[(	114*8)-1 : (	114*8)-8];
							end
							115:
							begin
								w_data = buffer_envio[(	115*8)-1 : (	115*8)-8];
							end
							116:
							begin
								w_data = buffer_envio[(	116*8)-1 : (	116*8)-8];
							end
							117:
							begin
								w_data = buffer_envio[(	117*8)-1 : (	117*8)-8];
							end
							118:
							begin
								w_data = buffer_envio[(	118*8)-1 : (	118*8)-8];
							end
							119:
							begin
								w_data = buffer_envio[(	119*8)-1 : (	119*8)-8];
							end
							120:
							begin
								w_data = buffer_envio[(	120*8)-1 : (	120*8)-8];
							end
							121:
							begin
								w_data = buffer_envio[(	121*8)-1 : (	121*8)-8];
							end
							122:
							begin
								w_data = buffer_envio[(	122*8)-1 : (	122*8)-8];
							end
							123:
							begin
								w_data = buffer_envio[(	123*8)-1 : (	123*8)-8];
							end
							124:
							begin
								w_data = buffer_envio[(	124*8)-1 : (	124*8)-8];
							end
							125:
							begin
								w_data = buffer_envio[(	125*8)-1 : (	125*8)-8];
							end
							126:
							begin
								w_data = buffer_envio[(	126*8)-1 : (	126*8)-8];
							end
							127:
							begin
								w_data = buffer_envio[(	127*8)-1 : (	127*8)-8];
							end
							128:
							begin
								w_data = buffer_envio[(	128*8)-1 : (	128*8)-8];
							end
							129:
							begin
								w_data = buffer_envio[(	129*8)-1 : (	129*8)-8];
							end
							130:
							begin
								w_data = buffer_envio[(	130*8)-1 : (	130*8)-8];
							end
							131:
							begin
								w_data = buffer_envio[(	131*8)-1 : (	131*8)-8];
							end
							132:
							begin
								w_data = buffer_envio[(	132*8)-1 : (	132*8)-8];
							end
							133:
							begin
								w_data = buffer_envio[(	133*8)-1 : (	133*8)-8];
							end
							134:
							begin
								w_data = buffer_envio[(	134*8)-1 : (	134*8)-8];
							end
							135:
							begin
								w_data = buffer_envio[(	135*8)-1 : (	135*8)-8];
							end
							136:
							begin
								w_data = buffer_envio[(	136*8)-1 : (	136*8)-8];
							end
							137:
							begin
								w_data = buffer_envio[(	137*8)-1 : (	137*8)-8];
							end
							138:
							begin
								w_data = buffer_envio[(	138*8)-1 : (	138*8)-8];
							end
							139:
							begin
								w_data = buffer_envio[(	139*8)-1 : (	139*8)-8];
							end
							140:
							begin
								w_data = buffer_envio[(	140*8)-1 : (	140*8)-8];
							end
							141:
							begin
								w_data = buffer_envio[(	141*8)-1 : (	141*8)-8];
							end
							142:
							begin
								w_data = buffer_envio[(	142*8)-1 : (	142*8)-8];
							end
							143:
							begin
								w_data = buffer_envio[(	143*8)-1 : (	143*8)-8];
							end
							144:
							begin
								w_data = buffer_envio[(	144*8)-1 : (	144*8)-8];
							end
							145:
							begin
								w_data = buffer_envio[(	145*8)-1 : (	145*8)-8];
							end
							146:
							begin
								w_data = buffer_envio[(	146*8)-1 : (	146*8)-8];
							end
							147:
							begin
								w_data = buffer_envio[(	147*8)-1 : (	147*8)-8];
							end
							148:
							begin
								w_data = buffer_envio[(	148*8)-1 : (	148*8)-8];
							end
							149:
							begin
								w_data = 102;
							end
					endcase
					//w_data = buffer_envio[(indice*8)-1:(indice*8)-8];
					//w_data = buffer_envio_aux[indice-1];
					wr = 1;
					next_state = ESPERO;
				end
		ESPERO: 
				begin
					if(tx_full == 1)
					begin
						wr = 0;
						if(indice == bytes+1)
						begin
							next_state = IDLE;
						end
						else
						begin
							next_state = ENVIAR;
						end
					end
					else
					begin
						next_state = ESPERO;
					end
				end
	endcase
end//always de logica de salida
	


endmodule



