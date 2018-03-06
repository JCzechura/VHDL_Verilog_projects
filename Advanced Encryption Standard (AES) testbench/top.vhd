----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:22:12 06/12/2017 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
port(
    clk           : in std_logic;
    rst           : in std_logic;
    --key_o         : out std_logic_vector(127 downto 0);  -- key must be kept constant for the time of encryption!
    data_in        : in std_logic_vector(7 downto 0);  -- plain input data
    data_write_i  : in std_logic;                       -- strobe indicating start od encryption
    data_o        : out std_logic_vector(127 downto 0); -- encrypted output data
    data_ready_o  : out std_logic                       -- data ready flag
	 );
end top;

architecture Behavioral of top is

signal data_i : std_logic_vector(127 downto 0);
signal key_o  : std_logic_vector(127 downto 0);

component aes is
   	 port (
			 clk           : in std_logic;
			 rst           : in std_logic;
			 key_i         : in std_logic_vector(127 downto 0);  -- key must be kept constant for the time of encryption!
			 data_i       : in std_logic_vector(127 downto 0);  -- plain input data
			 data_write_i  : in std_logic;                       -- strobe indicating start od encryption
			 data_o        : out std_logic_vector(127 downto 0); -- encrypted output data
			 data_ready_o  : out std_logic                       -- data ready flag
   	 );
    end component;

begin

comb: process (data_in)

begin
	data_i(127 downto 8) <= (others => '0');
	data_i(7 downto 0) <= data_in (7 downto 0);
	key_o <= x"2b7e1516_28aed2a6_abf71588_09cf4f3c";
	
end process;

COM1: aes port map(clk => clk, rst => rst, key_i => key_o, data_i => data_i, data_write_i => data_write_i, data_o=>data_o,data_ready_o=>data_ready_o) ;

end Behavioral;

