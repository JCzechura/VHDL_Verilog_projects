--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:37:02 04/06/2016
-- Design Name:   
-- Module Name:   D:/xilinxy/stoperro/testo.vhd
-- Project Name:  stoperro
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testo IS
END testo;
 
ARCHITECTURE behavior OF testo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         clk_i : IN  std_logic;
         led7_an_o : OUT  std_logic_vector(3 downto 0);
         led7_seg_o : OUT  std_logic_vector(6 downto 0);
         led7_seg_o_dp : OUT  std_logic;
         start_stop_button_i : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_i : std_logic := '0';
   signal start_stop_button_i : std_logic := '0';

 	--Outputs
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
          start_stop_button_i => start_stop_button_i
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
      wait for 300 ns;	

      start_stop_button_i<='1';
      -- insert stimulus here 

	wait for 450 ns;
		start_stop_button_i<='0';
		
--	wait for 20 ns;
--	      wait for 10 ps;	
--
--      start_stop_button_i<='1';
--      -- insert stimulus here 
--
--	wait for 5 ps;
--		start_stop_button_i<='0';
--		
	wait for 1000000 ns;
--		
--		-- start_stop_button_i<='1';


 
   end process;

END;