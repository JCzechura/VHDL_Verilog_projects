--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:30:00 05/29/2017
-- Design Name:   
-- Module Name:   C:/Designs/aes_proj/TB.vhd
-- Project Name:  aes_proj
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: aes
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
use STD.textio.all;
use ieee.std_logic_textio.all;


ENTITY TB IS
END TB;
 
ARCHITECTURE behavior OF TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aes
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         key_i : IN  std_logic_vector(127 downto 0);
         data_i : IN  std_logic_vector(127 downto 0);
         data_write_i : IN  std_logic;
         data_o : OUT  std_logic_vector(127 downto 0);
         data_ready_o : OUT  std_logic
        );
    END COMPONENT;
    


   file file_VECTORS : text;
   file file_RESULTS : text;

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal key_i : std_logic_vector(127 downto 0) := x"2b7e1516_28aed2a6_abf71588_09cf4f3c";
   signal data_i : std_logic_vector(127 downto 0) := (others => '0');
   signal data_write_i : std_logic := '0';

 	--Outputs
   signal data_o : std_logic_vector(127 downto 0);
   signal data_ready_o : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	
	type array_std is array (0 to 5) of std_logic_vector(127 downto 0); 
	
	shared variable ENDSIM : std_logic := '0';
	shared variable data_i_var : std_logic_vector(127 downto 0) := (others => '0');
	shared	variable v_ILINE : array_std;
	shared	variable inLINE : line;
	shared variable v_OLINE : array_std;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: aes PORT MAP (
          clk => clk,
          rst => rst,
          key_i => key_i,
          data_i => data_i,
          data_write_i => data_write_i,
          data_o => data_o,
          data_ready_o => data_ready_o
        );

   -- Clock process definitions
   clk_process :process
	
	
   begin
		if ENDSIM='0' then
			clk <= '0';
			wait for clk_period/2;
			clk <= '1';
			wait for clk_period/2;
		else
			wait;
		end if;
		
   end process;
 

   -- Stimulus process
   stim_proc: process
	
	--variable v_ILINE  : line;	

	variable i : integer := 0;

   begin	

      -- hold reset state for 100ms.
      rst <= '1';
		wait for 50 ns;
		rst <= '0';
		wait for 200 ns;
		
	   file_open(file_VECTORS, "input_vectors.txt",  read_mode);
		file_open(file_RESULTS, "output_results.txt", write_mode);
	 
		while not endfile(file_VECTORS) loop
			readline(file_VECTORS, inLINE);
			hread( inLINE, data_i_var);
			wait for 100 ns;
			data_i <= data_i_var;
			wait for 10 ns;
			data_write_i <= '1';
			wait for 20 ns;
			data_write_i <= '0';
			wait for 400 ns;
		end loop;
		
		 file_close(file_VECTORS);
		 file_close(file_RESULTS);
		 		
      wait;
   end process;

END;
