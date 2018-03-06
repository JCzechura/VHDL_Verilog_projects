--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:21:49 04/10/2017
-- Design Name:   
-- Module Name:   C:/Documents and Settings/lab1/Pulpit/klawa-20170410T112103Z-001/klawa/tb.vhd
-- Project Name:  klawa
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tb IS
END tb;
 
ARCHITECTURE behavior OF tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         ps2_clk_i : IN  std_logic;
         clk_i : IN  std_logic;
         led7_seg_o : OUT  std_logic_vector(6 downto 0);
         ps2_data_i : IN  std_logic;
         led_o : OUT  std_logic_vector(7 downto 0);
         led7_an_o : OUT  std_logic_vector(3 downto 0);
         rst_i : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ps2_clk_i : std_logic := '1';
   signal clk_i : std_logic := '0';
   signal ps2_data_i : std_logic := '0';
   signal rst_i : std_logic := '0';

 	--Outputs
   signal led7_seg_o : std_logic_vector(6 downto 0);
   signal led_o : std_logic_vector(7 downto 0);
   signal led7_an_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 20 ns;
	
	constant czas : time := 30ns;
	constant czas1 : time := 20ns;
	constant czas2 : time := 10ns;
 
BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          ps2_clk_i => ps2_clk_i,
          clk_i => clk_i,
          led7_seg_o => led7_seg_o,
          ps2_data_i => ps2_data_i,
          led_o => led_o,
          led7_an_o => led7_an_o,
          rst_i => rst_i
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
	
      -- hold reset state for 100ms.
      
		rst_i<='1';
		wait for 100 ns;
		rst_i<='0';
		wait for 200 ns;

      -- insert stimulus here 

		
				 ps2_clk_i<='0'; -- opadanie nr1
   			 wait for czas;
   			 ps2_clk_i<='1'; --narastanie nr1
   			 wait for czas;
   			 ps2_clk_i<='0';-- opadanie nr2
   			 wait for czas2;
   			 ps2_data_i<='1'; -- data 1
   			 wait for czas1;
   			 ps2_clk_i<='1'; -- narastanie 2
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr3
   			 ps2_data_i<='0'; -- data2
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr4
   			 ps2_data_i<='0'; -- data3
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr5
   			 ps2_data_i<='1';-- data 4
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr6
   			 ps2_data_i<='0';-- data 5
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; ---- opadanie nr7
   			 ps2_data_i<='1';-- data 6
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr8    
   			 ps2_data_i<='1';-- data 7
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr 9  	 
   	 		 ps2_data_i<='0';-- data 8
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr10
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr11
   			 wait for czas;
   			 ps2_clk_i<='1'; -- narastanie stop
				 wait for czas*3;
				 
				 
				-- 2 cyfra
				
--				 --start
--
--
   			 ps2_clk_i<='0'; -- opadanie nr1
   			 wait for czas;
   			 ps2_clk_i<='1'; --narastanie nr1
   			 wait for czas;
   			 ps2_clk_i<='0';-- opadanie nr2
   			 wait for czas2;
   			 ps2_data_i<='1'; -- data 1
   			 wait for czas1;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr3
   			 ps2_data_i<='0'; -- data2
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr4
   			 ps2_data_i<='0'; -- data3
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr5
   			 ps2_data_i<='1';-- data 4
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr6
   			 ps2_data_i<='0';-- data 5
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; ---- opadanie nr7
   			 ps2_data_i<='1';-- data 6
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr8    
   			 ps2_data_i<='1';-- data 7
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr 9  	 
   	 		 ps2_data_i<='0';-- data 8
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr10
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr11
   			 wait for czas;
   			 ps2_clk_i<='1';
				 wait for czas;
   			 ps2_clk_i<='1'; -- narastanie stop
				 wait for czas*3;
				 
				 
				 				-- 3 cyfra
				
--				 --start
--
--
   			 ps2_clk_i<='0'; -- opadanie nr1
   			 wait for czas;
   			 ps2_clk_i<='1'; --narastanie nr1
   			 wait for czas;
   			 ps2_clk_i<='0';-- opadanie nr2
   			 wait for czas2;
   			 ps2_data_i<='1'; -- data 1
   			 wait for czas1;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr3
   			 ps2_data_i<='0'; -- data2
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr4
   			 ps2_data_i<='0'; -- data3
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr5
   			 ps2_data_i<='1';-- data 4
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr6
   			 ps2_data_i<='0';-- data 5
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; ---- opadanie nr7
   			 ps2_data_i<='1';-- data 6
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr8    
   			 ps2_data_i<='1';-- data 7
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr 9  	 
   	 		 ps2_data_i<='0';-- data 8
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr10
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr11
   			 wait for czas;
   			 ps2_clk_i<='1';
				 wait for czas;
   			 ps2_clk_i<='1'; -- narastanie stop
				 wait for czas*3;














     -- insert stimulus here 

		
				 ps2_clk_i<='0'; -- opadanie nr1
   			 wait for czas;
   			 ps2_clk_i<='1'; --narastanie nr1
   			 wait for czas;
   			 ps2_clk_i<='0';-- opadanie nr2
   			 wait for czas2;
   			 ps2_data_i<='1'; -- data 1
   			 wait for czas1;
   			 ps2_clk_i<='1'; -- narastanie 2
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr3
   			 ps2_data_i<='0'; -- data2
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr4
   			 ps2_data_i<='0'; -- data3
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr5
   			 ps2_data_i<='1';-- data 4
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr6
   			 ps2_data_i<='0';-- data 5
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; ---- opadanie nr7
   			 ps2_data_i<='1';-- data 6
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr8    
   			 ps2_data_i<='1';-- data 7
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr 9  	 
   	 		 ps2_data_i<='0';-- data 8
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr10
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr11
   			 wait for czas;
   			 ps2_clk_i<='1'; -- narastanie stop
				 wait for czas*3;
				 
				 
				-- 2 cyfra
				
--				 --start
--
--
   			 ps2_clk_i<='0'; -- opadanie nr1
   			 wait for czas;
   			 ps2_clk_i<='1'; --narastanie nr1
   			 wait for czas;
   			 ps2_clk_i<='0';-- opadanie nr2
   			 wait for czas2;
   			 ps2_data_i<='1'; -- data 1
   			 wait for czas1;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr3
   			 ps2_data_i<='0'; -- data2
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr4
   			 ps2_data_i<='0'; -- data3
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr5
   			 ps2_data_i<='1';-- data 4
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr6
   			 ps2_data_i<='0';-- data 5
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; ---- opadanie nr7
   			 ps2_data_i<='1';-- data 6
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr8    
   			 ps2_data_i<='1';-- data 7
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr 9  	 
   	 		 ps2_data_i<='0';-- data 8
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr10
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr11
   			 wait for czas;
   			 ps2_clk_i<='1';
				 wait for czas;
   			 ps2_clk_i<='1'; -- narastanie stop
				 wait for czas*3;
				 
				 
				 				-- 3 cyfra
				
--				 --start
--
--
   			 ps2_clk_i<='0'; -- opadanie nr1
   			 wait for czas;
   			 ps2_clk_i<='1'; --narastanie nr1
   			 wait for czas;
   			 ps2_clk_i<='0';-- opadanie nr2
   			 wait for czas2;
   			 ps2_data_i<='1'; -- data 1
   			 wait for czas1;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr3
   			 ps2_data_i<='0'; -- data2
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr4
   			 ps2_data_i<='0'; -- data3
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr5
   			 ps2_data_i<='1';-- data 4
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr6
   			 ps2_data_i<='0';-- data 5
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; ---- opadanie nr7
   			 ps2_data_i<='1';-- data 6
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr8    
   			 ps2_data_i<='1';-- data 7
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr 9  	 
   	 		 ps2_data_i<='0';-- data 8
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr10
   			 wait for czas;
   			 ps2_clk_i<='1';
   			 wait for czas;
   			 ps2_clk_i<='0'; -- opadanie nr11
   			 wait for czas;
   			 ps2_clk_i<='1';
				 wait for czas;
   			 ps2_clk_i<='1'; -- narastanie stop
				 wait for czas*3;













				-- rownasie
				
--				 ps2_clk_i<='0'; -- opadanie nr1
--   			 wait for czas;
--   			 ps2_clk_i<='1'; --narastanie nr1
--   			 wait for czas;
--   			 ps2_clk_i<='0';-- opadanie nr2
--   			 wait for czas2;
--   			 ps2_data_i<='1'; -- data 1
--   			 wait for czas1;
--   			 ps2_clk_i<='1';
--   			 wait for czas;
--   			 ps2_clk_i<='0'; -- opadanie nr3
--   			 ps2_data_i<='0'; -- data2
--   			 wait for czas;
--   			 ps2_clk_i<='1';
--   			 wait for czas;
--   			 ps2_clk_i<='0'; -- opadanie nr4
--   			 ps2_data_i<='1'; -- data3
--   			 wait for czas;
--   			 ps2_clk_i<='1';
--   			 wait for czas;
--   			 ps2_clk_i<='0'; -- opadanie nr5
--   			 ps2_data_i<='0';-- data 4
--   			 wait for czas;
--   			 ps2_clk_i<='1';
--   			 wait for czas;
--   			 ps2_clk_i<='0'; -- opadanie nr6
--   			 ps2_data_i<='1';-- data 5
--   			 wait for czas;
--   			 ps2_clk_i<='1';
--   			 wait for czas;
--   			 ps2_clk_i<='0'; ---- opadanie nr7
--   			 ps2_data_i<='0';-- data 6
--   			 wait for czas;
--   			 ps2_clk_i<='1';
--   			 wait for czas;
--   			 ps2_clk_i<='0'; -- opadanie nr8    
--   			 ps2_data_i<='1';-- data 7
--   			 wait for czas;
--   			 ps2_clk_i<='1';
--   			 wait for czas;
--   			 ps2_clk_i<='0'; -- opadanie nr 9  	 
--   	 		 ps2_data_i<='0';-- data 8
--   			 wait for czas;
--   			 ps2_clk_i<='1';
--   			 wait for czas;
--   			 ps2_clk_i<='0'; -- opadanie nr10
--   			 wait for czas;
--   			 ps2_clk_i<='1';
--   			 wait for czas;
--   			 ps2_clk_i<='0'; -- opadanie nr11
--   			 wait for czas;
--   			 ps2_clk_i<='1';
--   			 wait for czas;
--   			 ps2_clk_i<='1'; -- narastanie stop
--				 wait for czas*3;				 
      wait;
   end process;

END;
