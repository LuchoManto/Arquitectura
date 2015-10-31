`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:38:56 10/19/2015
// Design Name:   uart
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/UART/Uart/test_de_uart.v
// Project Name:  Uart
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_de_uart;

	// Inputs
	reg rx;
	reg clock;
	
	// Outputs
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	uart uut (
		.tx(tx), 
		.rx(rx), 
		.clock(clock)
	);


	reg [7:0] enviar=8'b00000000;
	reg [7:0] n=0;
	
	always #1
	begin
		clock = ~clock;
	end
	
	task send_value(input [7:0] valor);
	begin
		n=0;
		
		/*Envio bit de start y espero.*/
		rx = 0;
		while(uut.r.current_state == 0)
		begin
			#1;
		end
		while(uut.r.current_state == 1)
		begin
			rx = 0;
			#1;
		end
		
		/*8 bits de valor*/
		while(n<8)
		begin
			rx = valor[n];
			while(uut.r.current_state == 2)
			begin
				#1;
			end	
			while(uut.r.current_state == 3)
			begin
				#1;
			end		
			n = n+1;
		end
		
		/*Bit de stop*/
		while(uut.r.current_state == 2 || uut.r.current_state == 4)
		begin
			rx = 1;
			#1;
		end
		
		/*Espero que rx lo termine de enviar.*/
		while(uut.t.current_state != 4)
		begin
			#1;
		end
		while(uut.t.current_state != 0)
		begin
			#1;
		end
	end
	endtask

	initial begin
		$display("Comienza la simulacion");
		// Initialize Inputs
		clock = 0;
		rx = 0;
		send_value(8'b10101000);
		
		/*
		while(uut.r.current_state == 0)
		begin
			#1;
		end
		
		while(uut.r.current_state == 1)
		begin
			rx = 0;
			#1;
		end
		
		while(uut.r.current_state == 2 || uut.r.current_state == 3)
		begin
			rx = 1;
			#1;
		end
		
		while(uut.r.current_state == 2 || uut.r.current_state == 4)
		begin
			rx = 1;
			#1;
		end
		
		while(uut.t.current_state != 4)
		begin
			#1;
		end
		
		while(uut.t.current_state != 0)
		begin
			#1;
		end
		*/


		//send_value(8'b00001111);
		
		#10000;
		
		$finish;

		$display("Termina la simulacion");
		$finish;
	end
      
endmodule

