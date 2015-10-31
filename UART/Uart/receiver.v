`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:51 10/15/2015 
// Design Name: 
// Module Name:    receiver 
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
module receiver(
		input wire rx,
		input wire clk,
		output reg [7:0]d_out,
		output reg rx_done
);
		
//Estados
localparam [2:0] IDLE = 3'b000,
					  DESFASO = 3'b001,
					  ESPERO = 3'b010,
					  RECIBO = 3'b011,
					  FIN = 3'b100;
					  
//Variables internas
reg [2:0] current_state = 3'b000;
reg [2:0] next_state = 3'b000;
reg [3:0] n = 0;
reg [3:0] s = 0;
reg [7:0] buffer = 0;


always @(posedge clk)
begin
		current_state <= next_state;
end

		
always @(posedge clk) // always de logica de salida
begin
	case(current_state)
		IDLE: // estado inicial. Idle
				begin
					rx_done = 0;
					s = 0;
					n = 0;
				end
		DESFASO: // se recibe el bit de start
				begin
					s = s + 1;
					if(s == 7)
					begin
						n = n+1;
						s = 0;
					end
				end
		ESPERO: // se espera incrementando s
				begin
					s = s+1;
				end
		RECIBO: // se guarda el dato en el buffer
				begin
					buffer[n-1] = rx;
					n = n + 1;
					s = 1;
				end
		FIN: // se envia el buffer
				begin
					d_out = buffer;
					rx_done = 1;
					n = n+1;
					s = 0;
				end
	endcase
end//always de logica de salida
	
always @*
begin
	next_state = IDLE;
	case(current_state)
		IDLE:
			begin
				if(rx == 0)
					next_state = DESFASO;
				else
					next_state = IDLE;
			end
		DESFASO:
			begin
				if(n == 1)
					next_state = ESPERO;
				else
					next_state = DESFASO;
			end
		ESPERO:
			begin
			if (s == 15)
			begin
				if(n<9)
					next_state = RECIBO;
				if(n==9)
					next_state = FIN;
				//if(n==10)
					//next_state = IDLE;
			end
			else
			begin
				next_state = ESPERO;
			end
		end
		RECIBO:
			begin
				next_state = ESPERO;
			end
		FIN:
			begin
				//next_state = ESPERO;
				next_state = IDLE;
			end
	endcase
end //always de logica cambio de estado
	


endmodule
