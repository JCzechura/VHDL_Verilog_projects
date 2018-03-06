module rs232_tb();
    reg clk_i,TXD_o,RXD_i;
eres UUT(
    .clk_i(clk_i),
    .TXD_o(TXD_o),
    .RXD_i(RXD_i)
   		 );
    integer i;    
     reg [8:0] list [15:0] = '{9'b001000101,9'b000010110,9'b100011110,9'b000100110, 9'b000100101, 9'b100101110, 9'b100110110, 9'b000111101, 9'b000111110, 9'b001000110, 9'b000011100, 9'b000110010, 9'b100100001, 9'b000100011, 9'b100100100, 9'b100101011};    
 //newlist: list:= ( "01000101", "00010110", "00011110", "00100110","00100101", "00101110", "00110110", "00111101","00111110","01000110","00011100","00110010","00100001","00100011","00100100","00101011");   	 
initial
begin    RXD_i=1;
   	 clk_i=0;
   	 #150;
for (i = 0; i < 16; i = i +1) begin
   	 
   	 RXD_i=1;
   	 #105;
   	 RXD_i=0;
   	 #100;
   	 RXD_i=list[i][0]; //data0
   	 #100;
   	 RXD_i=list[i][1]; //data1
   	 #100;
   	 RXD_i=list[i][2]; //data2
   	 #100;
   	 RXD_i=list[i][3]; //data3
   	 #100;
   	 RXD_i=list[i][4]; //data4
   	 #100;
   	 RXD_i=list[i][5]; //data5
   	 #100;
   	 RXD_i=list[i][6]; //data6
   	 #100;
   	 RXD_i=list[i][7]; //data7
   	 #100;
   	 //RXD_i=list[i][8]; //datapar
   	 #100;
   	 RXD_i=1; // stop
   	 #1200;
   	 end;
   	 //RXD_i=1;
//   	 #105;
//   	 RXD_i=0;
//   	 #100;
//   	 RXD_i=1; //data0
//   	 #100;
//   	 RXD_i=1; //data1
//   	 #100;
//   	 RXD_i=1; //data2
//   	 #100;
//   	 RXD_i=0; //data3
//   	 #100;
//   	 RXD_i=0; //data4
//   	 #100;
//   	 RXD_i=1; //data5
//   	 #100;
//   	 RXD_i=1; //data6
//   	 #100;
//   	 RXD_i=0; //data7
//   	 #100;
//   	 RXD_i=0; //datapar
//   	 #100;
//   	 RXD_i=1; // stop
//   	 #1200;
//   	 RXD_i=1;
//   	 #105;
//   	 RXD_i=0;
//   	 #100;
//   	 RXD_i=0; //data0
//   	 #100;
//   	 RXD_i=1; //data1
//   	 #100;
//   	 RXD_i=1; //data2
//   	 #100;
//   	 RXD_i=1; //data3
//   	 #100;
//   	 RXD_i=0; //data4
//   	 #100;
//   	 RXD_i=1; //data5
//   	 #100;
//   	 RXD_i=1; //data6
//   	 #100;
//   	 RXD_i=0; //data7
//   	 #100;
//   	 RXD_i=0; //datapar
//   	 #100;
//   	 RXD_i=1; // stop

end

always #10 clk_i <=~clk_i;

endmodule
