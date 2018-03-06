library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;



ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS
 
	-- Component Declaration for the Unit Under Test (UUT)
 
	COMPONENT top
	PORT(
     	clk_i : in std_logic;
   	 led7_an_o : out std_logic_vector(3 downto 0);
   	 led7_seg_o_dp : out std_logic;
   	 led7_seg_o : out std_logic_vector(6 downto 0);
   	 led_o: out std_logic_vector(1 downto 0);
   	 rst_i : in std_logic;
   	 minute : in std_logic:='0';
   	 hour: in std_logic:='0';
   	 lab_speed: in std_logic:='0'
    	);
	END COMPONENT;
    
    
    
	signal    led_o: std_logic_vector(1 downto 0);
    signal    rst_i :std_logic;
    signal    minute : std_logic;
    signal    hour: std_logic;
    signal    lab_speed: std_logic;
   signal clk_i : std_logic := '0';
   signal led7_an_o : std_logic_vector(3 downto 0);
   signal led7_seg_o : std_logic_vector(6 downto 0);
   signal led7_seg_o_dp : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
      	clk_i => clk_i,
      	led7_an_o => led7_an_o,
      	led7_seg_o => led7_seg_o,
      	led7_seg_o_dp => led7_seg_o_dp,
   	   led_o=>led_o,
   	   minute=>minute,
   	   hour=>hour,
   	   lab_speed=>lab_speed,
   	   rst_i=>rst_i
    	);

   -- Clock process definitions
   clk_i_process :process
   begin
   	 clk_i <= '0';
   	 wait for clk_i_period/2;
   	 clk_i <= '1';
   	 wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin   	 
  	-- hold reset state for 100 ns.
    hour<='0';
    lab_speed<='0';
    minute<='0';
	 rst_i<='1';
    wait for 500 ns;
	 rst_i<='0';
    wait for 500 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    hour<='1';
    wait for 100 ns;
    hour<='0';
    wait for 3000 ns;
    minute<='1';
    wait for 100 ns;
    minute<='0';
    wait for 3000 ns;
    minute<='1';
    wait for 100 ns;
    minute<='0';
    wait for 3000 ns;
    minute<='1';
    wait for 100 ns;
    minute<='0';
    wait for 3000 ns;
    minute<='1';
    wait for 100 ns;
    minute<='0';
    wait for 3000 ns;
    minute<='1';
    wait for 100 ns;
    minute<='0';
    wait for 3000 ns;
    minute<='1';
    wait for 100 ns;
    minute<='0';
    wait for 3000 ns;
    minute<='1';
    wait for 100 ns;
    minute<='0';
    wait for 3000 ns;
    minute<='1';
    wait for 100 ns;
    minute<='0';
    wait for 3000 ns;
    minute<='1';
    wait for 100 ns;
    minute<='0';
    wait for 3000 ns;
    minute<='1';
    wait for 100 ns;
    minute<='0';
    wait for 3000 ns;
    rst_i<='1';
    wait for 100 ns;
    rst_i<='0';
    wait for 3000 ns;
    lab_speed<='1';
    wait for 100 ns;
    lab_speed<='0';
--    wait for 20 ns;
--      	wait for 10 ps;    
--
--  	start_stop_button_i<='1';
--  	-- insert stimulus here
--
--    wait for 5 ps;
--   	 start_stop_button_i<='0';
--   	 
    wait for 1000000 ns;
--   	 
--   	 -- start_stop_button_i<='1';


 wait;
   end process;

END;
