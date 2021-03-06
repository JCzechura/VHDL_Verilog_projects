----------------------------------------------------------------------------------


--
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
--
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity top is
port (
		clk_i : in std_logic;
		led7_an_o : out std_logic_vector(3 downto 0);
		led7_seg_o : out std_logic_vector(6 downto 0);
		led7_seg_o_dp : out std_logic;
		led_o: out std_logic_vector(1 downto 0);
		rst_i : in std_logic:='0';
		start_stop_button_i : in std_logic
);		
end top;

architecture Behavioral of top is
			signal led7_seg_o_tmp0 :std_logic_vector(6 downto 0) := "0000000";
			signal led7_seg_o_tmp1 : std_logic_vector(6 downto 0) := "0000000";
			signal led7_seg_o_tmp2 : std_logic_vector(6 downto 0) := "0000000";
			signal led7_seg_o_tmp3 : std_logic_vector(6 downto 0) := "0000000";
			
component wyswietlacz is 
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
	end component;
	
	component kodglowny is
		port (	
			clk_i : in std_logic;
			start_stop_button_i : in std_logic;
			rst_i : in std_logic;
			led7_seg_o_tmp0 : out std_logic_vector(6 downto 0); -- bufor zerowej liczby na ledzie
			led7_seg_o_tmp1 : out std_logic_vector(6 downto 0);-- bufor pierwszej liczby na ledzie
			led7_seg_o_tmp2 : out std_logic_vector(6 downto 0);-- bufor drugiej liczby na ledzie
			led7_seg_o_tmp3 :  out std_logic_vector(6 downto 0);-- bufor trzeciej liczby na ledzie
			led_o : out std_logic_vector(1 downto 0)
	);
		end component;
	begin
	
	BRAMKA1: wyswietlacz port map(clk_i => clk_i, led7_seg_o => led7_seg_o, led7_an_o =>led7_an_o ,led7_seg_o_dp=>led7_seg_o_dp, led7_seg_o_tmp0=>led7_seg_o_tmp0, led7_seg_o_tmp1=>led7_seg_o_tmp1, led7_seg_o_tmp2=> led7_seg_o_tmp2, led7_seg_o_tmp3=>led7_seg_o_tmp3) ;
	BRAMKA2: kodglowny port map(clk_i => clk_i,start_stop_button_i=>start_stop_button_i, led7_seg_o_tmp0=>led7_seg_o_tmp0, led7_seg_o_tmp1=>led7_seg_o_tmp1, led7_seg_o_tmp2=> led7_seg_o_tmp2, led7_seg_o_tmp3=>led7_seg_o_tmp3,led_o =>led_o, rst_i=>rst_i ) ;


end behavioral;