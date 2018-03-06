library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity wyswietlacz is
port (
clk_i : in std_logic;
led7_an_o : out std_logic_vector(3 downto 0);
led7_seg_o : out std_logic_vector(6 downto 0);
led7_seg_o_dp : out std_logic;
led7_seg_o_tmp0 : in std_logic_vector(6 downto 0) := "0000000";
led7_seg_o_tmp1 : in std_logic_vector(6 downto 0) := "0000000";
led7_seg_o_tmp2 : in std_logic_vector(6 downto 0) := "0000000";
led7_seg_o_tmp3 : in std_logic_vector(6 downto 0) := "0000000"

);
end wyswietlacz;


architecture Behavioral of wyswietlacz is


signal i: integer:=0;
	
	begin
	
	
	lcd: process (clk_i) is
		begin
	
		if rising_edge (clk_i) then
				i<=i+1;
				if i=1 then			
					led7_an_o <= "1110";	
					led7_seg_o <= led7_seg_o_tmp0;
					led7_seg_o_dp <= '1';
				elsif i=10 then --5x0
					led7_an_o <= "1011";
					led7_seg_o <= led7_seg_o_tmp1;
					led7_seg_o_dp <= '0';
				elsif i=20 then
					led7_an_o <= "1101";
					led7_seg_o <= led7_seg_o_tmp2;
					led7_seg_o_dp <= '1';
				elsif i=30 then
					led7_an_o <= "0111";
					led7_seg_o <=  led7_seg_o_tmp3;
					led7_seg_o_dp <= '1';					
				elsif i=40 then	
					i<=0;		
				end if;							
			end if;
	end process lcd;
	
end behavioral;