library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;
entity klawa is

   	 port(
   	 ps2_clk_i: in std_logic;
   	 clk_i: in std_logic;
		 gotowe : out std_logic:='0';
		 bps2_data_i: out std_logic_vector (7 downto 0) ;
   	-- bled7_seg_o: out std_logic_vector(6 downto 0);
   	 --bps2_data_i:  std_logic_vector (7 downto 0) ;
   	 ps2_data_i: in std_logic;
   	 rst_i: in std_logic
   	 );

end klawa;

architecture Behavioral of klawa is

signal bps2_clk_1: std_logic;
signal bps2_clk_2: std_logic;
--signal bps2_clk_i: std_logic:='1';
--signal bled7_seg_o_tmp: std_logic_vector (6 downto 0);
signal i: integer:=0;
signal j: integer:=1;
--signal bps2_data_i: std_logic_vector (7 downto 0) ;


begin


wpisywanie_do_bufora: process(ps2_clk_i, clk_i)

begin


if rst_i='1' then
    --bled7_seg_o <= "1111111";
    
elsif rising_edge(clk_i) then

--    i<=i+1;
--    if i=3 then
--    i<=0;

   	 bps2_clk_2<=bps2_clk_1;
   	 bps2_clk_1<=ps2_clk_i;
   	 
   	 ---if ps2_clk_i='0' then
   	 if bps2_clk_1='0' and bps2_clk_2='1' then    
		 
		 -- dopisuje
			if j<33 then
				j<=j+1;
   		end if;
			
			if j=1 then  			--start
				--start<=ps2_data_i;
				gotowe<='0';
			end if;
			if j=2 then      --1 data
				bps2_data_i(0)<=ps2_data_i;
							
			end if;
			if j=3 then   --2 data
				bps2_data_i(1)<=ps2_data_i;
			
			end if;
			if j=4 then   --3 data
				bps2_data_i(2)<=ps2_data_i;
			
			end if;
			if j=5 then    --4 data
				bps2_data_i(3)<=ps2_data_i;
				
			end if;
			if j=6 then      --5 data
				bps2_data_i(4)<=ps2_data_i; 
				
			end if;
			if j=7 then   --6 data
				bps2_data_i(5)<=ps2_data_i;
			
			end if;
			if j=8 then   --7 data
				bps2_data_i(6)<=ps2_data_i;
				
			end if;
			if j=9 then    --8 data
				bps2_data_i(7)<=ps2_data_i; 
				gotowe<='1';
			end if;
			if j=10 then   --parzystosc
				--parzystosc<=ps2_data_i;
				
			end if;
			if j>=33 then   --stop
				--stop<=ps2_data_i;
				
			j<=1;

--				case bps2_data_i is
--				when "01000101" => bled7_seg_o <= "0000001"; --0
--				when "00010110" => bled7_seg_o <= "1001111"; --1
--				when "00011110" => bled7_seg_o <= "0010010"; --2
--				when "00100110" => bled7_seg_o <= "0000110"; --3
--				when "00100101" => bled7_seg_o <= "1001100"; --4
--				when "00101110" => bled7_seg_o <= "0100100"; --5
--				when "00110110" => bled7_seg_o <= "0100000"; --6
--				when "00111101" => bled7_seg_o <= "0001111"; --7 							
--				when "00111110" => bled7_seg_o <= "0000000"; --8
--				when "01000110" => bled7_seg_o <= "0000100"; --9
--				when "00011100" => bled7_seg_o <= "0001000"; --A
--				when "00110010" => bled7_seg_o <= "1100000"; --B
--				when "00100001" => bled7_seg_o <= "0110001"; --C
--				when "00100011" => bled7_seg_o <= "1000010"; --D
--				when "00100100" => bled7_seg_o <= "0110000"; --E
--				when "00101011" => bled7_seg_o <= "0111000"; --F
--				when "11110000"=> null;								--f0 break
--				when others => bled7_seg_o <= "1111111";
--		end case;
			end if;
			 
   	 end if;
    end if;
--end if;
--end if;

end process wpisywanie_do_bufora;


end Behavioral;
