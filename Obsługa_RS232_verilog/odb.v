module odb
(rst_i, clk_i, bdata_i, zaczalem_nadawac, skonczylem_nadawac, RXD_i);
    	input  wire clk_i, rst_i;
   	 output reg[9:0] bdata_i=8'b00000000;
   	 output reg zaczalem_nadawac=0;
   	 input skonczylem_nadawac;
   	 input RXD_i;


reg[9:0] bbdata_wektor=00000000;
reg bb_data_1=0;
reg bb_data_2=0;
integer j=0;
integer bj=0;
integer i=0;
reg par_odb ;




   	 always@(posedge clk_i or posedge rst_i)
		 begin	 
			if (rst_i)
				i=0;
			else
			begin
				 bb_data_2<=bb_data_1;
				 bb_data_1<=RXD_i;
				 if (j==0)
				 begin
					 if ((bb_data_1==0) & (bb_data_2==1))
						bj=1;
				 end		 
				 if (skonczylem_nadawac==1)
				 begin
					 zaczalem_nadawac=0;
				 end 
				 bb_data_2<=bb_data_1;
				 bb_data_1<=RXD_i;
				 if (j==0)
				 begin
					if ((bb_data_1==0) & (bb_data_2==1))
						 j=1;
				 end
/*						 
				 if (j==1)
				 begin
					 i=i+1;
					 if (i==1)
						bbdata_wektor[8]<=RXD_i;
					 if (i==5208)
						bbdata_wektor[0]<=RXD_i;
					 if (i==10416)
						bbdata_wektor[1]<=RXD_i;		 
					 if (i==15624)
						bbdata_wektor[2]<=RXD_i;
					 
					 if (i==20832)
						bbdata_wektor[3]<=RXD_i;
					 
					 if (i==26040)
						bbdata_wektor[4]<=RXD_i;
					 
					 if (i==31248)
						bbdata_wektor[5]<=RXD_i;
					 
					 if (i==36456)
						bbdata_wektor[6]<=RXD_i;
					 
					 if (i==41664)
						bbdata_wektor[7]<=RXD_i;
					 if (i==46871)
						bbdata_wektor<= bbdata_wektor+8'b00100000;
					 if (i==46872)
						begin
							i=0;
							j=0;
							zaczalem_nadawac=1;
					
							bdata_i <= bbdata_wektor; //+ 8'b00100000;
						
						end
					end
		end
	*/
	//SYMULACJA:
	
	
		 if (j==1)
			 begin
				 i=i+1;
				 if (i==5)
					bbdata_wektor[8]<=RXD_i;
				 if (i==5208)
					begin
						bbdata_wektor[0]<=RXD_i;
					end
				 if (i==10)
					bbdata_wektor[1]<=RXD_i;
				 
				 if (i==15)
					bbdata_wektor[2]<=RXD_i;
				 
				 if (i==20)
					bbdata_wektor[3]<=RXD_i;
				 
				 if (i==25)
					bbdata_wektor[4]<=RXD_i;
				 
				 if (i==30)
					bbdata_wektor[5]<=RXD_i;
				 
				 if (i==35)
					bbdata_wektor[6]<=RXD_i;
				 
				 if (i==40)
					bbdata_wektor[7]<=RXD_i;
				 
				 if (i==45)
					bbdata_wektor<= bbdata_wektor+8'b00100000;
				 if (i==46)
					begin
						i=0;
						j=0;
						zaczalem_nadawac=1;
						bdata_i <= bbdata_wektor; //+ 8'b00100000;
					end
			 end



   end 	 
end
endmodule
