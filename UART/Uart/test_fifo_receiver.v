`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:02:43 10/16/2015
// Design Name:   UARTFIFORX
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Gaston/FIFO-UART/TEST_UARTFIFORX.v
// Project Name:  FIFO-UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UARTFIFORX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fifo_receiver;

	// Inputs
	reg [7:0] d_out;
	reg rx_done;
	reg rd;
	reg clk;

	// Outputs
	wire [7:0] r_data;
	wire rx_empty;

	// Instantiate the Unit Under Test (UUT)
	UARTFIFORX uut (
		.d_out(d_out), 
		.rx_done(rx_done), 
		.rd(rd), 
		.r_data(r_data), 
		.rx_empty(rx_empty), 
		.clk(clk)
	);

	/*
		Funciones y variables para test
	*/
	reg[10*8:0] string;
	
	function check_state(input [3:0] state);
	begin
		$display("---------------------------------\n-current_state: %s",string,"\n -d_out(entrada): ",d_out,"\n -stack: ",uut.stack,"\n -r_data(salida): ",r_data,"\n -rx_empty: ",rx_empty,"\n -rd: ",rd,"\n -rx_done: ",rx_done,"\n---------------------------------\n");
		if(state != uut.current_state)
		begin
			$display("Error curret_state, state esperado es:",state,".Valor uut.current_state es:",uut.current_state,". Tiempo: ", $time);
			$finish;
		end
	end
	endfunction

	function get_state_name(input [3:0] state);
	begin

		case(state)
			3'b000:
				begin
					string="ENVIO_A_CPU";
				end
			3'b001:
				begin
					string="ESPERO_A_CPU";
				end
			3'b010:
				begin
					string="RECIBO_DE_RX";
				end
			3'b011:
				begin
					string="ESPERO_A_RX";
				end
			3'b100:
				begin
					string="IDLE";
				end
				
		endcase
	end
	endfunction


	always #5
	begin
		clk = ~clk;
		get_state_name(uut.current_state);
	end
		
	initial begin
		$display("Comienza la simulacion");
		$monitor("---------------------------------\n-current_state: ",uut.current_state,"\n -d_out(entrada): ",d_out,"\n -stack: ",uut.stack,"\n -r_data(salida): ",r_data,"\n -rx_empty: ",rx_empty,"\n -rd: ",rd,"\n -rx_done: ",rx_done,"\n---------------------------------\n");
		
		// Initialize Inputs
		d_out = 50;
		rx_done = 0;
		rd = 0;
		clk = 0;

		#20;
		
		rx_done = 1;
		#50;
		check_state(3'b011);
		
		rx_done = 0;
		#50;
		check_state(3'b100);
		
		rd=1;
		#50;
		check_state(3'b001);
		
		rd=0;
		#50;
		check_state(3'b100);
		
		$display("Termina la simulacion");
		$finish;
	end
      
endmodule

