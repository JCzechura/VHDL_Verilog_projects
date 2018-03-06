----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:37 03/20/2017 
-- Design Name: 
-- Module Name:    display - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
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
led7_seg_o_dp : out std_logic;
led7_seg_o_tmp0 : in std_logic_vector(6 downto 0) := "0000000";
led7_seg_o_tmp1 : in std_logic_vector(6 downto 0) := "0000000";
led7_seg_o_tmp2 : in std_logic_vector(6 downto 0) := "0000000";
led7_seg_o_tmp3 : in std_logic_vector(6 downto 0) := "0000000"

);
end display;


architecture Behavioral of display is

signal kropka_count: integer:=0;
signal i: integer:=0;
signal led7_seg_o_dp_in : std_logic:='0';    
    begin
    
    kropka: process (clk_i) is
   			 begin
   			   if rising_edge(clk_i) then
   				   kropka_count<= kropka_count+1;
   				   if kropka_count=25000000 then -- kropka_count=25000000
   					   kropka_count<=0;
   					   if led7_seg_o_dp_in='0' then
   					       led7_seg_o_dp_in<='1';
   					   else
   					  	 led7_seg_o_dp_in<='0';
   					   end if;
   				   end if;  
   			   end if;
   	 end process kropka;
   	 
   	 
   	 
    lcd: process (clk_i) is
   	 begin
    
   	 if rising_edge (clk_i) then
   			 i<=i+1;
   			 if i=1 then   		 
   				 led7_an_o <= "1110";    
   				 led7_seg_o <= led7_seg_o_tmp0;
   				 led7_seg_o_dp <= '1';
   			 elsif i=1000 then --5x0
   				 led7_an_o <= "1011";
   				 led7_seg_o <= led7_seg_o_tmp2;
   				 led7_seg_o_dp <= led7_seg_o_dp_in;
   			 elsif i=2000 then
   				 led7_an_o <= "1101";
   				 led7_seg_o <= led7_seg_o_tmp1;
   				 led7_seg_o_dp <= '1';
   			 elsif i=3000 then
   				 led7_an_o <= "0111";
   				 led7_seg_o <=  led7_seg_o_tmp3;
   				 led7_seg_o_dp <= '1';   				 
   			 elsif i=4000 then    
   				 i<=0;   	 
   			 end if;   						 
   		 end if;
    end process lcd;
    
end Behavioral;
