library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity display is
port (
clk_i : in std_logic;
led7_an_o : out std_logic_vector(3 downto 0);
led7_seg_o : out std_logic_vector(6 downto 0);
led7_seg_o_tmp0 : in std_logic_vector(7 downto 0) := "0000000";
led7_seg_o_tmp1 : in std_logic_vector(7 downto 0) := "0000000";
led7_seg_o_tmp2 : in std_logic_vector(7 downto 0) := "0000000";
led7_seg_o_tmp3 : in std_logic_vector(7 downto 0) := "0000000"
);
end display;


architecture Behavioral of display is

signal kropka_count: integer:=0;
signal i: integer:=0;
signal led7_seg_o_dp_in : std_logic:='0';    
    begin
  	 lcd: process (clk_i) is
   	 begin
    
   	 if rising_edge (clk_i) then
   			 i<=i+1;
   			 if i=1 then   	
   			 led7_an_o <= "1110";    
 			case led7_seg_o_tmp0 is
   				 when "01000101" => led7_seg_o <= "0000001"; --0
   				 when "00010110" => led7_seg_o <= "1001111"; --1
   				 when "00011110" => led7_seg_o <= "0010010"; --2
   				 when "00100110" => led7_seg_o <= "0000110"; --3
   			 when "00100101" => led7_seg_o <= "1001100"; --4
   			 when "00101110" => led7_seg_o <= "0100100"; --5
   			 when "00110110" => led7_seg_o <= "0100000"; --6
   			 when "00111101" => led7_seg_o <= "0001111"; --7    		
   			 when "00111110" => led7_seg_o <= "0000000"; --8    00100100
   			 when "01000110" => led7_seg_o <= "0000100"; --9
   			 when others => led7_seg_o <= "1111111";
      			 elsif i=1000 then --5x0
   				 led7_an_o <= "1011";
   				 			case led7_seg_o_tmp2 is
   				 when "01000101" => led7_seg_o <= "0000001"; --0
   				 when "00010110" => led7_seg_o <= "1001111"; --1
   				 when "00011110" => led7_seg_o <= "0010010"; --2
   				 when "00100110" => led7_seg_o <= "0000110"; --3
   			 when "00100101" => led7_seg_o <= "1001100"; --4
   			 when "00101110" => led7_seg_o <= "0100100"; --5
   			 when "00110110" => led7_seg_o <= "0100000"; --6
   			 when "00111101" => led7_seg_o <= "0001111"; --7    		
   			 when "00111110" => led7_seg_o <= "0000000"; --8    00100100
   			 when "01000110" => led7_seg_o <= "0000100"; --9
   			 when others => led7_seg_o <= "1111111";

   				 led7_seg_o_dp <= led7_seg_o_dp_in;
   			 elsif i=2000 then
   				 led7_an_o <= "1101";
   				 			case led7_seg_o_tmp1 is
   				 when "01000101" => led7_seg_o <= "0000001"; --0
   				 when "00010110" => led7_seg_o <= "1001111"; --1
   				 when "00011110" => led7_seg_o <= "0010010"; --2
   				 when "00100110" => led7_seg_o <= "0000110"; --3
   			 when "00100101" => led7_seg_o <= "1001100"; --4
   			 when "00101110" => led7_seg_o <= "0100100"; --5
   			 when "00110110" => led7_seg_o <= "0100000"; --6
   			 when "00111101" => led7_seg_o <= "0001111"; --7    		
   			 when "00111110" => led7_seg_o <= "0000000"; --8    00100100
   			 when "01000110" => led7_seg_o <= "0000100"; --9
   			 when others => led7_seg_o <= "1111111";

   				 led7_seg_o_dp <= '1';
   			 elsif i=3000 then
 		case bps2_data_i is
   	   				 led7_an_o <= "0111";
   				  			case led7_seg_o_tmp3 is
   				 when "01000101" => led7_seg_o <= "0000001"; --0
   				 when "00010110" => led7_seg_o <= "1001111"; --1
   				 when "00011110" => led7_seg_o <= "0010010"; --2
   				 when "00100110" => led7_seg_o <= "0000110"; --3
   			 when "00100101" => led7_seg_o <= "1001100"; --4
   			 when "00101110" => led7_seg_o <= "0100100"; --5
   			 when "00110110" => led7_seg_o <= "0100000"; --6
   			 when "00111101" => led7_seg_o <= "0001111"; --7    		
   			 when "00111110" => led7_seg_o <= "0000000"; --8    00100100
   			 when "01000110" => led7_seg_o <= "0000100"; --9
   			 when others => led7_seg_o <= "1111111";

   				 led7_seg_o_dp <= '1';   				 
   			 elsif i=4000 then    
   				 i<=0;   	 
   			 end if;   						 
   		 end if;
    end process lcd;
    
end Behavioral;
