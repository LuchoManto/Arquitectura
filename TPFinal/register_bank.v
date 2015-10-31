`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:17 10/31/2015 
// Design Name: 
// Module Name:    register_bank 
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
module register_bank(
	input [4:0]i_r1,
	input [4:0]i_r2,
	input [4:0]write_register,
	input [31:0]write_data,
	input regwrite,
	output reg [31:0]d1,
	output reg [31:0]d2,
	input clk
    );
	 
wire out_demux0;
wire out_demux1;
wire out_demux2;
wire out_demux3;
wire out_demux4;
wire out_demux6;
wire out_demux7;
wire out_demux8;
wire out_demux9;
wire out_demux10;
wire out_demux11;
wire out_demux12;
wire out_demux13;
wire out_demux14;
wire out_demux15;
wire out_demux16;
wire out_demux17;
wire out_demux18;
wire out_demux19;
wire out_demux20;
wire out_demux21;
wire out_demux22;
wire out_demux23;
wire out_demux24;
wire out_demux25;
wire out_demux26;
wire out_demux27;
wire out_demux28;
wire out_demux29;
wire out_demux30;
wire out_demux31;
	
wire [31:0] output_r0;
wire [31:0] output_r1;
wire [31:0] output_r2;
wire [31:0] output_r3;
wire [31:0] output_r4;
wire [31:0] output_r6;
wire [31:0] output_r7;
wire [31:0] output_r8;
wire [31:0] output_r9;
wire [31:0] output_r10;
wire [31:0] output_r11;
wire [31:0] output_r12;
wire [31:0] output_r13;
wire [31:0] output_r14;
wire [31:0] output_r15;
wire [31:0] output_r16;
wire [31:0] output_r17;
wire [31:0] output_r18;
wire [31:0] output_r19;
wire [31:0] output_r20;
wire [31:0] output_r21;
wire [31:0] output_r22;
wire [31:0] output_r23;
wire [31:0] output_r24;
wire [31:0] output_r25;
wire [31:0] output_r26;
wire [31:0] output_r27;
wire [31:0] output_r28;
wire [31:0] output_r29;
wire [31:0] output_r30;
wire [31:0] output_r31;

wire [31:0] output_d1;
wire [31:0] output_d2;
	
demultiplexor demultiplexor1(
.selector(write_register),
.entrada(regwrite),
.salida0(out_demux0),
.salida1(out_demux1),
.salida2(out_demux2),
.salida3(out_demux3),
.salida4(out_demux4),
.salida5(out_demux5),
.salida6(out_demux6),
.salida7(out_demux7),
.salida8(out_demux8),
.salida9(out_demux9),
.salida10(out_demux10),
.salida11(out_demux11),
.salida12(out_demux12),
.salida13(out_demux13),
.salida14(out_demux14),
.salida15(out_demux15),
.salida16(out_demux16),
.salida17(out_demux17),
.salida18(out_demux18),
.salida19(out_demux19),
.salida20(out_demux20),
.salida21(out_demux21),
.salida22(out_demux22),
.salida23(out_demux23),
.salida24(out_demux24),
.salida25(out_demux25),
.salida26(out_demux26),
.salida27(out_demux27),
.salida28(out_demux28),
.salida29(out_demux29),
.salida30(out_demux30),
.salida31(out_demux31)
);	

registro r0(.input_data(write_data), .chip_en(out_demux0), .output_data(output_r0), .clk(clk));
registro r1(.input_data(write_data), .chip_en(out_demux1), .output_data(output_r1), .clk(clk));
registro r2(.input_data(write_data), .chip_en(out_demux2), .output_data(output_r2), .clk(clk));
registro r3(.input_data(write_data), .chip_en(out_demux3), .output_data(output_r3), .clk(clk));
registro r4(.input_data(write_data), .chip_en(out_demux4), .output_data(output_r4), .clk(clk));
registro r5(.input_data(write_data), .chip_en(out_demux5), .output_data(output_r5), .clk(clk));
registro r6(.input_data(write_data), .chip_en(out_demux6), .output_data(output_r6), .clk(clk));
registro r7(.input_data(write_data), .chip_en(out_demux7), .output_data(output_r7), .clk(clk));
registro r8(.input_data(write_data), .chip_en(out_demux8), .output_data(output_r8), .clk(clk));
registro r9(.input_data(write_data), .chip_en(out_demux9), .output_data(output_r9), .clk(clk));
registro r10(.input_data(write_data), .chip_en(out_demux10), .output_data(output_r10), .clk(clk));
registro r11(.input_data(write_data), .chip_en(out_demux11), .output_data(output_r11), .clk(clk));
registro r12(.input_data(write_data), .chip_en(out_demux12), .output_data(output_r12), .clk(clk));
registro r13(.input_data(write_data), .chip_en(out_demux13), .output_data(output_r13), .clk(clk));
registro r14(.input_data(write_data), .chip_en(out_demux14), .output_data(output_r14), .clk(clk));
registro r15(.input_data(write_data), .chip_en(out_demux15), .output_data(output_r15), .clk(clk));
registro r16(.input_data(write_data), .chip_en(out_demux16), .output_data(output_r16), .clk(clk));
registro r17(.input_data(write_data), .chip_en(out_demux17), .output_data(output_r17), .clk(clk));
registro r18(.input_data(write_data), .chip_en(out_demux18), .output_data(output_r18), .clk(clk));
registro r19(.input_data(write_data), .chip_en(out_demux19), .output_data(output_r19), .clk(clk));
registro r20(.input_data(write_data), .chip_en(out_demux20), .output_data(output_r20), .clk(clk));
registro r21(.input_data(write_data), .chip_en(out_demux21), .output_data(output_r21), .clk(clk));
registro r22(.input_data(write_data), .chip_en(out_demux22), .output_data(output_r22), .clk(clk));
registro r23(.input_data(write_data), .chip_en(out_demux23), .output_data(output_r23), .clk(clk));
registro r24(.input_data(write_data), .chip_en(out_demux24), .output_data(output_r24), .clk(clk));
registro r25(.input_data(write_data), .chip_en(out_demux25), .output_data(output_r25), .clk(clk));
registro r26(.input_data(write_data), .chip_en(out_demux26), .output_data(output_r26), .clk(clk));
registro r27(.input_data(write_data), .chip_en(out_demux27), .output_data(output_r27), .clk(clk));
registro r28(.input_data(write_data), .chip_en(out_demux28), .output_data(output_r28), .clk(clk));
registro r29(.input_data(write_data), .chip_en(out_demux29), .output_data(output_r29), .clk(clk));
registro r30(.input_data(write_data), .chip_en(out_demux30), .output_data(output_r30), .clk(clk));
registro r31(.input_data(write_data), .chip_en(out_demux31), .output_data(output_r31), .clk(clk));


multiplexor multiplexor1(
.selector(i_r1),
.entrada0(output_r0),
.entrada1(output_r1),
.entrada2(output_r2),
.entrada3(output_r3),
.entrada4(output_r4),
.entrada5(output_r5),
.entrada6(output_r6),
.entrada7(output_r7),
.entrada8(output_r8),
.entrada9(output_r9),
.entrada10(output_r10),
.entrada11(output_r11),
.entrada12(output_r12),
.entrada13(output_r13),
.entrada14(output_r14),
.entrada15(output_r15),
.entrada16(output_r16),
.entrada17(output_r17),
.entrada18(output_r18),
.entrada19(output_r19),
.entrada20(output_r20),
.entrada21(output_r21),
.entrada22(output_r22),
.entrada23(output_r23),
.entrada24(output_r24),
.entrada25(output_r25),
.entrada26(output_r26),
.entrada27(output_r27),
.entrada28(output_r28),
.entrada29(output_r29),
.entrada30(output_r30),
.entrada31(output_r31),
.salida(output_d1)
);	

multiplexor multiplexor2(
.selector(i_r2),
.entrada0(output_r0),
.entrada1(output_r1),
.entrada2(output_r2),
.entrada3(output_r3),
.entrada4(output_r4),
.entrada5(output_r5),
.entrada6(output_r6),
.entrada7(output_r7),
.entrada8(output_r8),
.entrada9(output_r9),
.entrada10(output_r10),
.entrada11(output_r11),
.entrada12(output_r12),
.entrada13(output_r13),
.entrada14(output_r14),
.entrada15(output_r15),
.entrada16(output_r16),
.entrada17(output_r17),
.entrada18(output_r18),
.entrada19(output_r19),
.entrada20(output_r20),
.entrada21(output_r21),
.entrada22(output_r22),
.entrada23(output_r23),
.entrada24(output_r24),
.entrada25(output_r25),
.entrada26(output_r26),
.entrada27(output_r27),
.entrada28(output_r28),
.entrada29(output_r29),
.entrada30(output_r30),
.entrada31(output_r31),
.salida(output_d2)
);	


always@(*)
begin
	d1 = output_d1;
	d2 = output_d2;
end

endmodule
