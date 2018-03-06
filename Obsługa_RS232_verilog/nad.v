module nad
(rst_i, clk_i, bdata_i, zaczalem_nadawac, skonczylem_nadawac, TXD_o);
   	 input wire clk_i, rst_i;
   	 input [9:0] bdata_i;//=8'b00000000;
   	 input  zaczalem_nadawac;//=0;
   	 output reg skonczylem_nadawac=0;
   	 output reg TXD_o=1;


integer i=0;
reg par_nad;

//assign bdata_i = 8'b00000000;
//assign zaczalem_nadawac = 0;

   	 always@(posedge clk_i or posedge rst_i)
		 begin
		 if (rst_i)
		 
			i = 0;
		 else
			 begin
/*	  	 
			 if (zaczalem_nadawac==1)
				 begin
				 skonczylem_nadawac=0;
				 i=i+1;
				 if (i == 1)
					TXD_o<=bdata_i[8];
				 if (i == 5208)
					TXD_o<=bdata_i[0];
				 if (i == 10416)
					TXD_o<=bdata_i[1];   		 
				 if (i == 15624)
					TXD_o<=bdata_i[2];
				 if (i == 20832)
					TXD_o<=bdata_i[3];
				 if (i == 26040)
					TXD_o<=bdata_i[4];
				 if (i == 31248)
					TXD_o<=bdata_i[5];
				 if (i == 36456)
					TXD_o<=bdata_i[6];
				 if (i == 41664) 
					TXD_o<=bdata_i[7];
				 if (i == 46872) 
					begin
						TXD_o<=1;
						skonczylem_nadawac=1;
					end
				 if (i == 46873)
					i=0;
			 end
*/
	


			 if (zaczalem_nadawac==1)
				 begin
				 skonczylem_nadawac=0;
				 i=i+1;
				 if (i == 5)
					TXD_o<=bdata_i[8];
				 if (i == 10)
					TXD_o<=bdata_i[0];
				 if (i == 15)
					TXD_o<=bdata_i[1];   		 
				 if (i == 20) 
					TXD_o<=bdata_i[2];
				 if (i == 25)
					TXD_o<=bdata_i[3];
				 if (i == 30)
					TXD_o<=bdata_i[4];
				 if (i == 35)
					TXD_o<=bdata_i[5];
				 if (i == 40)
					TXD_o<=bdata_i[6];
				 if (i == 45)
					TXD_o<=bdata_i[7];
				 if (i == 55)
					begin
						TXD_o<=1;
						skonczylem_nadawac=1;
					end
				 if (i == 56)
					i=0;
			 end



end
end     

endmodule
