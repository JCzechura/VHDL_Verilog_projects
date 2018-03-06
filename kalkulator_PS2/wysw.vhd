library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity wysw is
port (
	clk_i : in std_logic;
	led7_an_o : out std_logic_vector(3 downto 0);
	led7_seg_o : out std_logic_vector(6 downto 0);
	led7_seg_o_tmp0 : in std_logic_vector(7 downto 0) := "00000000";
	led7_seg_o_tmp1 : in std_logic_vector(7 downto 0) := "00000000";
	led7_seg_o_tmp2 : in std_logic_vector(7 downto 0) := "00000000";
	led7_seg_o_tmp3 : in std_logic_vector(7 downto 0) := "00000000"
);
end wysw;


architecture Behavioral of wysw is

signal kropka_count: integer:=0;
signal i: integer:=0;
signal led7_seg_o_dp_in : std_logic:='0';
signal n: integer:=100;    
--signal n: integer:=1;    
    begin
  	 lcd: process (clk_i) is
   	 begin
    
   	 if rising_edge (clk_i) then
   			 i<=i+1;
   			 if i=1 then   	
   			 led7_an_o <= "1110";  
				 
					case led7_seg_o_tmp0 is
   				 when x"70" => led7_seg_o <= "0000001"; --0
   				 when x"69" => led7_seg_o <= "1001111"; --1
   				 when x"72" => led7_seg_o <= "0010010"; --2
   				 when x"7A" => led7_seg_o <= "0000110"; --3
					 when x"6B" => led7_seg_o <= "1001100"; --4
					 when x"73" => led7_seg_o <= "0100100"; --5
					 when x"74" => led7_seg_o <= "0100000"; --6
					 when x"6C" => led7_seg_o <= "0001111"; --7    		
					 when x"75" => led7_seg_o <= "0000000"; --8    00100100
					 when x"7D" => led7_seg_o <= "0000100"; --9
					 when "11110000"=> null;
					 when others => led7_seg_o <= "1111111";
					 end case;
				
				elsif i=10*n then --5x0
   				 led7_an_o <= "1101";
					case led7_seg_o_tmp1 is
					 when x"70" => led7_seg_o <= "0000001"; --0
   				 when x"69" => led7_seg_o <= "1001111"; --1
   				 when x"72" => led7_seg_o <= "0010010"; --2
   				 when x"7A" => led7_seg_o <= "0000110"; --3
					 when x"6B" => led7_seg_o <= "1001100"; --4
					 when x"73" => led7_seg_o <= "0100100"; --5
					 when x"74" => led7_seg_o <= "0100000"; --6
					 when x"6C" => led7_seg_o <= "0001111"; --7    		
					 when x"75" => led7_seg_o <= "0000000"; --8    00100100
					 when x"7D" => led7_seg_o <= "0000100"; --9
					 when "11110000"=> null;
   			 when others => led7_seg_o <= "1111111";
			 end case;

   			 elsif i=20*n then
   				 led7_an_o <= "1011";
   				 			case led7_seg_o_tmp2 is
   				 when x"70" => led7_seg_o <= "0000001"; --0
   				 when x"69" => led7_seg_o <= "1001111"; --1
   				 when x"72" => led7_seg_o <= "0010010"; --2
   				 when x"7A" => led7_seg_o <= "0000110"; --3
					 when x"6B" => led7_seg_o <= "1001100"; --4
					 when x"73" => led7_seg_o <= "0100100"; --5
					 when x"74" => led7_seg_o <= "0100000"; --6
					 when x"6C" => led7_seg_o <= "0001111"; --7    		
					 when x"75" => led7_seg_o <= "0000000"; --8    00100100
					 when x"7D" => led7_seg_o <= "0000100"; --9
					 when "11110000"=> null;
   			 when others => led7_seg_o <= "1111111";
			 end case;

   			 elsif i=30*n then
   	   				 led7_an_o <= "0111";
   				  			case led7_seg_o_tmp3 is
   				when x"70" => led7_seg_o <= "0000001"; --0
   				 when x"69" => led7_seg_o <= "1001111"; --1
   				 when x"72" => led7_seg_o <= "0010010"; --2
   				 when x"7A" => led7_seg_o <= "0000110"; --3
					 when x"6B" => led7_seg_o <= "1001100"; --4
					 when x"73" => led7_seg_o <= "0100100"; --5
					 when x"74" => led7_seg_o <= "0100000"; --6
					 when x"6C" => led7_seg_o <= "0001111"; --7    		
					 when x"75" => led7_seg_o <= "0000000"; --8    00100100
					 when x"7D" => led7_seg_o <= "0000100"; --9
					 when "11110000"=> null;
   			 when others => led7_seg_o <= "1111111";
			 end case;
  				 
   			 elsif i=40*n then    
   				 i<=0;   	 
   			 end if;   						 
   		 end if;
    end process lcd;
    
end Behavioral;
