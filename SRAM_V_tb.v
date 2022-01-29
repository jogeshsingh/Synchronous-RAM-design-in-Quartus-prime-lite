///*******testbench file ********//
///******designed SRAM_V  ********* ////
module SRAM_V_tb ();
parameter n = 8 ;
parameter m = 10 ;
reg i_clk ;
reg [n-1:0] d_in ;
reg rw ;
reg [m-1:0] addr_in ;
wire [n-1:0] data_out ;

///////instantiation of top module /////////
SRAM_V DUT  (
      d_in , 
		i_clk , 
		rw , 
		addr_in , 
	   data_out ) ;
		
	initial
    begin
	  i_clk = 1'b0 ;
   end
 

always #5 i_clk = ~i_clk ;



initial
   begin

 #10 addr_in = 0; // set the row to 1
 #10 d_in = 32;
 #10 rw = 1'b0; // set the rw to 0
 #10 addr_in = 1; // set the row to 
  ////set rw ==1                 it should have written the data 75 at 0:1 address location///
  
  #2 rw = 1'b1 ;
 
  #10 addr_in = 0; // set the row to 1
#10 d_in = 47; // set the data to 47
#10 rw = 1'b0;  //set rw = 0 //
 #10 addr_in = 2; // set the row to 2
 
 #3 rw = 1'b1 ;
 
 #40 addr_in = 0;
 #5 d_in = 14 ;
 #1 rw = 1'b0;
 #10 addr_in = 3 ;
 
 #2 rw = 1'b1 ;
 
  #550 $stop ;
  
 
		end
		endmodule
		