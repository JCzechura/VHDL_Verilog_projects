;----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:36 03/20/2017 
-- Design Name: 
-- Module Name:    timer - Behavioral 
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

entity timer is
    port (
   	 clk_i : in std_logic;
   	 minute : in std_logic:='0';
   	 hour: in std_logic:='0';
   	 lab_speed:in std_logic:='0';
   	 rst_i : in std_logic;
   	 
   	 
   	 led7_seg_o_tmp0 : out std_logic_vector(6 downto 0); -- bufor zerowej liczby na ledzie
   	 led7_seg_o_tmp1 : out std_logic_vector(6 downto 0);-- bufor pierwszej liczby na ledzie
   	 led7_seg_o_tmp2 : out std_logic_vector(6 downto 0);-- bufor drugiej liczby na ledzie
   	 led7_seg_o_tmp3 : out std_logic_vector(6 downto 0)-- bufor trzeciej liczby na ledzie
   	 
   	 --led_o : out std_logic_vector(1 downto 0)
    
    );


end timer;

architecture Behavioral of timer is


-- zmienne
   -- signal buffor_button: std_logic_vector(1 downto 0):="10";
    signal i: integer:=0;
    signal nint: integer:=300000000;
	 --signal n :std_logic_vector(28 downto 0):="10001111000011010001100000000";
    signal i_2: integer:=0;
    signal minute_0: integer:=0;
    signal minute_1: integer:=0;
    signal hour_0: integer:=0;
    signal hour_1: integer:=0;
	 signal bminute_0: integer:=0; --do przelacznikow
    signal bminute_1: integer:=0;--do przelacznikow
    signal bhour_0: integer:=0;--do przelacznikow
    signal bhour_1: integer:=0;--do przelacznikow
    --signal licz_setna: integer:=1;
    signal bled7_seg_o_tmp0 :std_logic_vector(6 downto 0):="0000001";
    signal bled7_seg_o_tmp1 :std_logic_vector(6 downto 0):="0000001";
    signal bled7_seg_o_tmp2 :std_logic_vector(6 downto 0):="0000001";
    signal bled7_seg_o_tmp3 :std_logic_vector(6 downto 0):="0000001";
    
    -- do drgan
    
    --signal key_in : std_logic;
    signal minute_out : std_logic:='0';
    signal q_minute : std_logic;
    signal key_synch_minute : std_logic;
    shared variable delay_cntr_m : integer range 0 to 2500000 := 0;
    signal bminute_out: std_logic:='0';
    
    
    signal hour_out : std_logic:='0';
    signal q_hour : std_logic;
    signal key_synch_hour : std_logic;
    shared variable delay_cntr_h : integer range 0 to 2500000 := 0;
    signal bhour_out: std_logic:='0';
    
    
    signal lab_speed_out : std_logic:='0';
    signal q_speed : std_logic;
    signal key_synch_speed : std_logic;
    shared variable delay_cntr_s : integer range 0 to 2500000 := 0;
    signal bspeed_out: std_logic:='0'; -- nieprzyspieszony 0,  przyspieszony 1
    
    begin
    
   	 synch_minute: process (clk_i) is
   			 begin
   			   if rising_edge(clk_i) then
						q_minute <= minute;
						key_synch_minute <= q_minute;
						if (key_synch_minute = minute_out) then
							delay_cntr_m := 0;
						else
							delay_cntr_m := delay_cntr_m + 1;
						end if;
						if (delay_cntr_m = 5) then
							minute_out <= key_synch_minute;
							delay_cntr_m := 0;
						end if;
   			   end if;  
   	 end process synch_minute;
   	 
   	 
   	 
   	 synch_hour: process (clk_i) is
   			 begin
   			   if rising_edge(clk_i) then
   			 	q_hour <= hour;
   			 	key_synch_hour <= q_hour;
   			 	if (key_synch_hour = hour_out) then
   			   	delay_cntr_h := 0;
   			 	else
   			   	delay_cntr_h := delay_cntr_h + 1;
   			 	end if;
   			 	if (delay_cntr_h = 5) then
   			   	hour_out <= key_synch_hour;
   			   	delay_cntr_h := 0;
   			 	end if;
   			   end if;  
   	 end process synch_hour;
   	 
   	 
   	 
   	 synch_lab_speed: process (clk_i) is
   			 begin
   			   if rising_edge(clk_i) then
   			 	q_speed <= lab_speed;
   			 	key_synch_speed <= q_speed;
   			 	if (key_synch_speed =lab_speed_out) then
   			   	delay_cntr_s := 0;
   			 	else
   			   	delay_cntr_s := delay_cntr_s + 1;
   			 	end if;
   			 	if (delay_cntr_s = 5) then
   			   	lab_speed_out <= key_synch_speed;
   			   	delay_cntr_s := 0;
   			 	end if;
   			   end if;  
   	 end process synch_lab_speed;
   	 	 
   	 speed_proc: process (clk_i)
   	 begin
   		 if rising_edge(clk_i) then
   		 bspeed_out<=lab_speed_out;
   				 if (bspeed_out='0' and lab_speed_out='1') then
   					 if nint=300000000 then
   						 nint<=3000000;
   					 else nint<=300000000;
   					 end if;
   				 end if;

   		 end if;
   	 end process speed_proc;


   	 
process(clk_i,rst_i)
begin
	if rst_i='1' then

		i<=0;
		minute_0<=0;
		minute_1<=0;
		hour_0<=0;
		hour_1<=0;
		led7_seg_o_tmp0<=bled7_seg_o_tmp0;
		led7_seg_o_tmp1<=bled7_seg_o_tmp1;
		led7_seg_o_tmp2<=bled7_seg_o_tmp2;
		led7_seg_o_tmp3<=bled7_seg_o_tmp3;
		
	elsif (rising_edge(clk_i)) then
		i<=i+1;
		bminute_out<=minute_out;
		bhour_out<=hour_out;
			if (bminute_out='0' and minute_out='1') then
				if  minute_0=9 then
					minute_0<=0;
					if minute_1=5 then
						minute_1<=0;
					else
						minute_1<= minute_1+1;
					end if;
				else
					minute_0<=minute_0+1;
				end if;
			end if;	
				
			if bhour_out='0' and hour_out='1' then
				if hour_0=3 then
					--hour_0<=0;
					if hour_1=2 then
						hour_1<=0;
						hour_0<=0;
					else
						--hour_1<= hour_1+1;
						hour_0<=hour_0+1;
					end if;
				else
					hour_0<=hour_0+1;
				end if;
				if hour_0=9 then
					hour_1<= hour_1+1;
					hour_0<= 0;
				end if;
			end if;
		if i>=nint then --i=300000000
			i<=0;
			i_2<=i_2+1;
		end if;
		if i_2=10 then										--6
			i_2<=0;   				 -- <- licz_setna dokr?ci do 5000, 2^13 5 zer
			if minute_0<9 then							--5
				minute_0<=1+minute_0;
			elsif minute_0=9 then
				minute_0<=0;
				if minute_1<5 then						--4
					minute_1<=1+minute_1;
				elsif minute_1=5 then
				minute_1<=0;
					 if hour_0<3 then						--3
					 hour_0<=1+hour_0;
					 elsif hour_0>=3 then
						 if hour_1=2 then					--2
							 i_2<=0;
							 minute_0<=0;
							 minute_1<=0;
							 hour_0<=0;
							 hour_1<=0;
						 else
							 hour_0<=1+hour_0;
					 
							if hour_0=9 then
									hour_0<=0;
									if hour_1<2 then     --1
										hour_1<=1+hour_1;
									elsif hour_1=2 then
									i_2<=0;
									 --licz_setna<=1;
									 minute_0<=0;
									 minute_1<=0;
									 hour_0<=0;
									 hour_1<=0; 
									end if;			 		--1
							end if;							--2
							
						 end if;    						--3
					end if;									--4
				end if;	 									--5
		end if; 												--6		  		 
	end if;
    
case minute_0 is
   						 when 0 => bled7_seg_o_tmp0 <= "0000001"; --0
   						 when 1 => bled7_seg_o_tmp0 <= "1001111"; --1
   						 when 2 => bled7_seg_o_tmp0 <= "0010010"; --2
   						 when 3 => bled7_seg_o_tmp0 <= "0000110"; --3
   						 when 4 => bled7_seg_o_tmp0 <= "1001100"; --4
   						 when 5 => bled7_seg_o_tmp0 <= "0100100"; --5
   						 when 6 => bled7_seg_o_tmp0 <= "0100000"; --6
   						 when 7 => bled7_seg_o_tmp0 <= "0001111"; --7
   						 when 8 => bled7_seg_o_tmp0 <= "0000000"; --8
   						 when 9 => bled7_seg_o_tmp0 <= "0000100"; --9
   						 when 10 => bled7_seg_o_tmp0 <= "1111110"; -- na kresk?
   						 when others => bled7_seg_o_tmp0 <= "1111111"; -- wyzerowanie wszystkiego
   				 end case;    
   				 case minute_1 is
   						 when 0 => bled7_seg_o_tmp1 <= "0000001"; --0
   						 when 1 => bled7_seg_o_tmp1 <= "1001111"; --1
   						 when 2 => bled7_seg_o_tmp1 <= "0010010"; --2
   						 when 3 => bled7_seg_o_tmp1 <= "0000110"; --3
   						 when 4 => bled7_seg_o_tmp1 <= "1001100"; --4
   						 when 5 => bled7_seg_o_tmp1 <= "0100100"; --5
   						 when 6 => bled7_seg_o_tmp1 <= "0100000"; --6
   						 when 7 => bled7_seg_o_tmp1 <= "0001111"; --7
   						 when 8 => bled7_seg_o_tmp1 <= "0000000"; --8
   						 when 9 => bled7_seg_o_tmp1 <= "0000100"; --9
   						 when 10 => bled7_seg_o_tmp1 <= "1111110"; -- na kresk?
   						 when others => bled7_seg_o_tmp1 <= "1111111"; -- wyzerowanie wszystkiego
   				 end case;
   				 case hour_0 is
   						 when 0 => bled7_seg_o_tmp2 <= "0000001"; --0
   						 when 1 => bled7_seg_o_tmp2 <= "1001111"; --1
   						 when 2 => bled7_seg_o_tmp2 <= "0010010"; --2
   						 when 3 => bled7_seg_o_tmp2 <= "0000110"; --3
   						 when 4 => bled7_seg_o_tmp2 <= "1001100"; --4
   						 when 5 => bled7_seg_o_tmp2 <= "0100100"; --5
   						 when 6 => bled7_seg_o_tmp2 <= "0100000"; --6
   						 when 7 => bled7_seg_o_tmp2 <= "0001111"; --7
   						 when 8 => bled7_seg_o_tmp2 <= "0000000"; --8
   						 when 9 => bled7_seg_o_tmp2 <= "0000100"; --9
   						 when 10 => bled7_seg_o_tmp2 <= "1111110"; -- na kresk?
   						 when others => bled7_seg_o_tmp2 <= "1111111"; -- wyzerowanie wszystkiego
   				 end case;
   				 case hour_1 is
   						 when 0 => bled7_seg_o_tmp3 <= "0000001"; --0
   						 when 1 => bled7_seg_o_tmp3 <= "1001111"; --1
   						 when 2 => bled7_seg_o_tmp3 <= "0010010"; --2
   						 when 3 => bled7_seg_o_tmp3 <= "0000110"; --3
   						 when 4 => bled7_seg_o_tmp3 <= "1001100"; --4
   						 when 5 => bled7_seg_o_tmp3 <= "0100100"; --5
   						 --when 6 => bled7_seg_o_tmp0 <= "0100000"; --6
   						 when 10 => bled7_seg_o_tmp3 <= "1111110"; -- na kresk?
   						 when others => bled7_seg_o_tmp3 <= "1111111"; -- wyzerowanie wszystkiego
   				 end case;    
    

--led_o<=buffor_button;

led7_seg_o_tmp0<=bled7_seg_o_tmp0;
led7_seg_o_tmp1<=bled7_seg_o_tmp1;
led7_seg_o_tmp2<=bled7_seg_o_tmp2;
led7_seg_o_tmp3<=bled7_seg_o_tmp3;

end if;

end process;

end Behavioral;

