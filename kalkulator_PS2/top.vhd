library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;



entity top is
port (
   	 ps2_clk_i: in std_logic;
   	 clk_i: in std_logic;
   	 led7_seg_o: out std_logic_vector(6 downto 0);
   	 ps2_data_i: in std_logic;
   	 led_o: out std_logic_vector(7 downto 0);
   	 led7_an_o: out std_logic_vector(3 downto 0);
   	 rst_i: in std_logic

);   	 
end top;

architecture Behavioral of top is
   		 signal bled7_seg_o: std_logic_vector (7 downto 0);
			 signal gotowe: std_logic;
			 signal led7_seg_o_tmp0 : std_logic_vector(7 downto 0);
			 signal led7_seg_o_tmp1 : std_logic_vector(7 downto 0);
			 signal led7_seg_o_tmp2 : std_logic_vector(7 downto 0);
			 signal led7_seg_o_tmp3 : std_logic_vector(7 downto 0);
			 signal bps2_data_i: std_logic_vector (7 downto 0) ;
			 
component wysw is
   	 port (
				clk_i : in std_logic;
				led7_an_o : out std_logic_vector(3 downto 0);
				led7_seg_o : out std_logic_vector(6 downto 0);
				led7_seg_o_tmp0 : in std_logic_vector(7 downto 0) := "00000000";
				led7_seg_o_tmp1 : in std_logic_vector(7 downto 0) := "00000000";
				led7_seg_o_tmp2 : in std_logic_vector(7 downto 0) := "00000000";
				led7_seg_o_tmp3 : in std_logic_vector(7 downto 0) := "00000000"
   	 );
    end component;
    
    component klawa is
   	 port (    
				 ps2_clk_i: in std_logic;
				 clk_i: in std_logic;
				 gotowe : out std_logic:='0';
				 bps2_data_i: out std_logic_vector (7 downto 0) ;
				 -- bled7_seg_o: out std_logic_vector(6 downto 0);
				 --bps2_data_i:  std_logic_vector (7 downto 0) ;
				 ps2_data_i: in std_logic;
				
				 rst_i: in std_logic
   			 );
   	 end component;
		 component kalkulator is
   	 port (    

				clk_i : in std_logic;
				rst_i:in std_logic;
				gotowe : in std_logic:='0';
				bps2_data_i: in std_logic_vector (7 downto 0) ;
				led7_seg_o_tmp0 : out std_logic_vector(7 downto 0) := "00000000";
				led7_seg_o_tmp1 : out std_logic_vector(7 downto 0) := "00000000";
				led7_seg_o_tmp2 : out std_logic_vector(7 downto 0) := "00000000";
				led7_seg_o_tmp3 : out std_logic_vector(7 downto 0) := "00000000";
				led_o: out std_logic_vector(7 downto 0)
   			 );
   	 end component;
    begin
    
    COM1: wysw port map(clk_i => clk_i, led7_seg_o => led7_seg_o, led7_an_o =>led7_an_o , led7_seg_o_tmp0=>led7_seg_o_tmp0, led7_seg_o_tmp1=>led7_seg_o_tmp1, led7_seg_o_tmp2=>led7_seg_o_tmp2, led7_seg_o_tmp3=>led7_seg_o_tmp3) ;
    COM2: klawa port map(bps2_data_i=>bps2_data_i, gotowe=>gotowe, rst_i=>rst_i, ps2_clk_i=>ps2_clk_i, clk_i => clk_i, ps2_data_i=>ps2_data_i) ;
	 COM3: kalkulator port map (bps2_data_i=>bps2_data_i, led_o=>led_o, clk_i => clk_i, rst_i=>rst_i,led7_seg_o_tmp0=>led7_seg_o_tmp0, led7_seg_o_tmp1=>led7_seg_o_tmp1, led7_seg_o_tmp2=>led7_seg_o_tmp2, led7_seg_o_tmp3=>led7_seg_o_tmp3, gotowe=>gotowe);

end behavioral;
