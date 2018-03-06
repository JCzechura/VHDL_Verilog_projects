module eres
(rst_i, clk_i, TXD_o, RXD_i);
   	 input RXD_i;
   	 output TXD_o;
   	 input wire clk_i, rst_i;
   	 
   	 
   	 
   	 
       wire [9:0] bdata_i ;
		 wire zaczalem_nadawac;
		 wire skonczylem_nadawac;
   	 
   	 nad UUT1(
	 .rst_i(rst_i),
    .clk_i(clk_i),
    .TXD_o(TXD_o),
    .bdata_i( bdata_i),
    .zaczalem_nadawac(zaczalem_nadawac),
    .skonczylem_nadawac(skonczylem_nadawac)
   		 );
   		 
   	 odb UUT2(
    .rst_i(rst_i),
	 .clk_i(clk_i),
    .RXD_i(RXD_i),
    .bdata_i( bdata_i),
    .zaczalem_nadawac(zaczalem_nadawac),
    .skonczylem_nadawac(skonczylem_nadawac)
   		 );

endmodule
