///****************Project name - : SRAM VERILOG MODEL ************///
///***design unit name -: SRAM_V *************//
///**HDL -: VERILOG **********///
///***** CAD TOOL -: QUARTUS Prime Lite Edition ************///
///***Address configuartion -: 8 bit ****************///
/////******data output configuration -: 8 bit**************///
////////synchronous read/write 

module SRAM_V 
   # (parameter mem_size =  1024 ,
	   parameter word_size  = 8  , 
		parameter addr_size  = 10  
	)
	(
      d_in , 
		i_clk , 
		rw ,  
		addr_in , 
		data_out ) ;
		
  input i_clk ;
  input wire [word_size-1:0] d_in ;             ///data input //
  input rw ;                               ///read/write , if rw => 0 , write to memory else read from the memory///
                            ///for 
  input [addr_size -1:0] addr_in ;              ///address bus ///
  output reg [word_size-1:0] data_out ;          //data bus ///
		
		///defining a memory ///
		
 reg [word_size-1:0] mem[mem_size-1:0]  ;


 always @ (posedge i_clk)
  begin
          if (rw==1'b0)
	   begin
		mem[addr_in] <= d_in ;
		  end
		else
        begin
		data_out <= mem[addr_in] ;
         end
	end 		
		endmodule 