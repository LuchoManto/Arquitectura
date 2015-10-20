`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:13:52 10/18/2015
// Design Name:   UART_RX
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/Gaston/FIFO-UART/TEST_UART_RX.v
// Project Name:  FIFO-UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_RX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TEST_UART_RX;

	// Inputs
	reg rx;
	reg clk;

	// Outputs
	wire [7:0] d_out;
	wire rx_done;

	// Instantiate the Unit Under Test (UUT)
	UART_RX uut (
		.rx(rx), 
		.clk(clk), 
		.d_out(d_out), 
		.rx_done(rx_done)
	);
	
	
		//Funciones y variables para test
	reg[10*8:0] current_state_name;
	reg[10*8:0] expected_state_name;
	
	//Declaro estados
	localparam [2:0] 	IDLE 	 = 3'b000,
							DESFASO  = 3'b001,
							ESPERO = 3'b010,
							RECIBO  = 3'b011,
							FIN	 = 3'b100;

	function check_state(input [3:0] state);
	begin
		case(state)
			IDLE:
				begin
					expected_state_name="IDLE";
				end
			DESFASO:
				begin
					expected_state_name="DESFASO";
				end
			ESPERO:
				begin
					expected_state_name="ESPERO";
				end
			RECIBO :
				begin
					expected_state_name="RECIBO";
				end
			FIN:
				begin
					expected_state_name="FIN";
				end
		endcase
		case(uut.current_state)
			IDLE:
				begin
					current_state_name="IDLE";
				end
			DESFASO:
				begin
					current_state_name="DESFASO";
				end
			ESPERO:
				begin
					current_state_name="ESPERO";
				end
			RECIBO :
				begin
					current_state_name="RECIBO";
				end
			FIN:
				begin
					current_state_name="FIN";
				end
		endcase
		
		$display("---------------------------------\n-expected_state: %s",expected_state_name,
		"\n -current_state: %s",current_state_name,
		"\n -buffer: ",uut.buffer,"\n -rx(entrada): ",rx,
		"\n -rx_done: ",rx_done,"\n -n: ",uut.n,"\n -s: ",uut.s,
		"\n -d_out(salida): ",d_out,"\n -time: ",$time,"\n---------------------------------\n");
		if(state != uut.current_state)
		begin
			$display("Error curret_state, state esperado es:",state,".Valor uut.current_state es:",uut.current_state,". Tiempo: ", $time);
			$finish;
		end
	end
	endfunction

	always #5
	begin
		clk = ~clk;
	end

	initial begin
		$display("Comienza la simulacion");
		$monitor("---------------------------------\n-current_state: ",uut.current_state,
		"\n -buffer: ",uut.buffer,"\n -rx(entrada): ",rx,
		"\n -rx_done: ",rx_done,"\n -n: ",uut.n,"\n -s: ",uut.s,
		"\n -d_out(salida): ",d_out,"\n -TIME: ",$time,"\n---------------------------------\n");
		// Initialize Inputs
		rx = 1;
		clk = 0;


		#10;
		check_state(IDLE);
		
		rx = 0;
		#10;
		check_state(DESFASO);
		
		#70
		rx = 1;
		while(uut.n<8)
		begin
			#10;
			check_state(ESPERO);
			
			#150;
			check_state(RECIBO);
		end
		
		#10;
		check_state(ESPERO);
		
		#150;
		check_state(FIN);
		
		#10;
		check_state(ESPERO);
		
		#160;
		check_state(IDLE);
		
		#160;
		check_state(IDLE);
		
		$display("Termina la simulacion");
		$finish;
	end
      
endmodule

