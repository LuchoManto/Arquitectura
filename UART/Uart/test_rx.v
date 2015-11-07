`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:43:44 11/06/2015
// Design Name:   rx
// Module Name:   E:/Documents/Windows/Facu/Arquitectura de computadoras/ProyectosXilinx/Arquitectura/UART/Uart/test_rx.v
// Project Name:  Uart
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_rx;


	// Inputs
	reg rx;
	reg clk;
	reg baud;

	// Outputs
	wire [7:0] d_out;
	wire rx_done;

	// Instantiate the Unit Under Test (UUT)
	rx uut (
		.rx(rx), 
		.clk(clk), 
		.baud(baud), 
		.d_out(d_out), 
		.rx_done(rx_done)
	);
	
	always #1
	begin
		clk = ~clk;
	end
	
	always #10
	begin
		baud = ~baud;
	end
	
	task recibir_dato(input [7:0] dato);
	begin
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		$fdisplay(f,"\n Comienza envio de dato: %b",dato," -Time: ",$time, " \n");
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		rx = 0;
		while(uut.current_state!=2)
			#1;
	
		
		$fdisplay(f,"\n Recibo bit start-------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		rx = dato[0];
		
		while(uut.s!=15)
			#1;
		while(uut.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[0]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
        
		rx = dato[1];
		
		while(uut.s!=15)
			#1;
		while(uut.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[1]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		rx = dato[2];
		
		while(uut.s!=15)
			#1;
		while(uut.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[2]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
      //$finish;
		  
		rx = dato[3];
		
		while(uut.s!=15)
			#1;
		while(uut.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[3]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		rx = dato[4];
		
		while(uut.s!=15)
			#1;
		while(uut.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[4]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
        
		rx = dato[5];
		
		while(uut.s!=15)
			#1;
		while(uut.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[5]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		rx = dato[6];
		
		while(uut.s!=15)
			#1;
		while(uut.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[6]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		
		rx = dato[7];
		
		while(uut.s!=15)
			#1;
		while(uut.s!=0)
			#1;
			
		$fdisplay(f,"\n Recibo bit[7]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		
		rx = 1;
		
		while(uut.current_state!=0)
			#1;
			
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		$fdisplay(f,"\n Finaliza envio de dato: %b",dato," Time: ",$time, " \n");
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
	end
	endtask
	
	integer f;
	initial begin
		//File de salida;
		f = $fopen("test_salida.txt", "w");
		$fdisplay("Comienza la simulacion");
		$fmonitor(f,"---------------------------\n-rx:",rx,"\n-baud:",baud,"\n-current_state:",uut.current_state,"\n-n:",uut.n,"\n-s:",uut.s,"\n-buffer:%b",uut.buffer,"\n-rx_done:",rx_done,"\n-d_out:%b",d_out,"\n-time:",$time,"\n---------------------------");		
		rx = 1;
		clk = 0;
		baud = 0;
		
		recibir_dato(8'b01010101);

		#1000;
		
		recibir_dato(8'b10101010);
		
		#1000;
		
		recibir_dato(8'b11110000);
		
		#1000;
		
		recibir_dato(8'b00001111);
		
		#1000;
		
		recibir_dato(8'b00000000);
		
		#1000;
		
		recibir_dato(8'b11111111);
      $fdisplay(f,"Termina la simulacion. -Time: ",$time);
		$fclose(f);
		$finish;
	end
      
endmodule

/*
task recibir_dato(input [7:0] dato);
	begin
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		$fdisplay(f,"\n Comienza envio de dato: %b",dato," -Time: ",$time, " \n");
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		rx = 0;
	
		#150;
		$fdisplay(f,"\n Recibo bit start-------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		rx = dato[0];
		
		#325;
		$fdisplay(f,"\n Recibo bit[0]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
        
		rx = dato[1];
		
		#325; 
		$fdisplay(f,"\n Recibo bit[1]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		rx = dato[2];
		
		#325;
		$fdisplay(f,"\n Recibo bit[2]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
      //$finish;
		  
		rx = dato[3];
		
		#325;
		$fdisplay(f,"\n Recibo bit[3]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		rx = dato[4];
		
		#325;
		$fdisplay(f,"\n Recibo bit[4]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
        
		rx = dato[5];
		
		#325;
		$fdisplay(f,"\n Recibo bit[5]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		//$finish;
		
		rx = dato[6];
		
		#325;
		$fdisplay(f,"\n Recibo bit[6]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		
		rx = dato[7];
		
		#325;
		$fdisplay(f,"\n Recibo bit[7]   -------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		
		rx = 1;
		
		#325;
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
		$fdisplay(f,"\n Finaliza envio de dato: %b",dato," Time: ",$time, " \n");
		$fdisplay(f,"\n -----------------------------------------------------------------------------------------------------"," Time: ",$time, " \n");
	end
	endtask
	*/

