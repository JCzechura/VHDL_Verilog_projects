library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity kodglowny is
port (
clk_i : in std_logic;
start_stop_button_i : in std_logic;
rst_i : in std_logic:='0';

led7_seg_o_tmp0 : out std_logic_vector(6 downto 0); -- bufor zerowej liczby na ledzie
led7_seg_o_tmp1 : out std_logic_vector(6 downto 0);-- bufor pierwszej liczby na ledzie
led7_seg_o_tmp2 : out std_logic_vector(6 downto 0);-- bufor drugiej liczby na ledzie
led7_seg_o_tmp3 :  out std_logic_vector(6 downto 0);-- bufor trzeciej liczby na ledzie

led_o : out std_logic_vector(1 downto 0)

);


end kodglowny;

architecture Behavioral of kodglowny is


-- zmienne
signal buffor_button: std_logic_vector(1 downto 0):="10";
signal i: natural:=0;

signal setna: integer:=0;
signal dziesietna: integer:=0;
signal sek: integer:=0;
signal dziesiata: integer:=0;
signal licz_setna: integer:=1;
signal bled7_seg_o_tmp0 :std_logic_vector(6 downto 0):="0000001";
signal bled7_seg_o_tmp1 :std_logic_vector(6 downto 0):="0000001";
signal bled7_seg_o_tmp2 :std_logic_vector(6 downto 0):="0000001";
signal bled7_seg_o_tmp3 :std_logic_vector(6 downto 0):="0000001";
-- liczby na wyswietlacz w postaci dziesietnej

signal bliczba0: integer:=0; --odpowiednik led tmp0
signal bliczba1: integer:=0;
signal bliczba2: integer:=0;
signal bliczba3: integer:=0;

-- do drgan

--signal key_in : std_logic;
signal q : std_logic;
signal key_synch : std_logic;
signal start_stop_button_out : std_logic;
signal bstart_stop_button_out: std_logic;

shared variable delay_cntr : integer range 0 to 2500000 := 0;

begin


synch: process (clk_i) is

begin

  if rising_edge(clk_i) then
    q <= start_stop_button_i;
    key_synch <= q;
    if (key_synch = start_stop_button_out) then
      delay_cntr := 0;
    else
      delay_cntr := delay_cntr + 1;
    end if;
    if (delay_cntr = 5) then
      start_stop_button_out <= key_synch;
      delay_cntr := 0;
    end if;
  end if;
  
end process synch;

wyj: process (clk_i)
begin
	if rising_edge(clk_i) then
	bstart_stop_button_out<=start_stop_button_out;
	if bstart_stop_button_out='0' and start_stop_button_out='1' then
			case CONV_INTEGER (buffor_button) is
			 when 0 => buffor_button <="01";
			 when 1 => buffor_button <="10";
			 when 2 => buffor_button <="00";
			 when others => buffor_button <= "10"; --stop
			 end case;
		end if;
	end if;
end process wyj;

process(clk_i)
begin

	if rising_edge(clk_i) then
	if rst_i='1' then
		i<=0;
					setna<=0;
					dziesietna<=0;
					sek<=0;
					dziesiata<=0;
					bliczba0<=0;
					bliczba2<=0;
					bliczba1<=0;
					bliczba3<=0;
					led7_seg_o_tmp0<=bled7_seg_o_tmp0;
					led7_seg_o_tmp1<=bled7_seg_o_tmp1;
					led7_seg_o_tmp2<=bled7_seg_o_tmp2;
					led7_seg_o_tmp3<=bled7_seg_o_tmp3;
	elsif buffor_button=0 then
			i<=i+1;
			if i=50 then 
			 i<=0;					-- <- licz_setna dokrêci do 5000, 2^13 5 zer
				if setna<9 then
				setna<=1+setna;
				elsif setna=9 then
				 setna<=0;
					if dziesietna<9 then
					dziesietna<=1+dziesietna;
					elsif dziesietna=9 then
					dziesietna<=0;
						if sek<9 then
						sek<=1+sek;
						elsif sek=9 then
						sek<=0;
							if dziesiata<5 then
							dziesiata<=1+dziesiata;
							elsif dziesiata=5 then
							i<=0;
							licz_setna<=1;
							setna<=10;
							dziesietna<=10;
							sek<=10;
							dziesiata<=10;
						
						end if;
					end if;	
				end if;
			end if;
	
	end if;
				licz_setna<=licz_setna+1;
				bliczba0<=setna;
				bliczba2<=dziesietna;
				bliczba1<=sek;
				bliczba3<=dziesiata;
				
		end if;
						
		
				if buffor_button="01" then
					led7_seg_o_tmp0<=bled7_seg_o_tmp0;
					led7_seg_o_tmp1<=bled7_seg_o_tmp1;
					led7_seg_o_tmp2<=bled7_seg_o_tmp2;
					led7_seg_o_tmp3<=bled7_seg_o_tmp3;
				end if;
				
				if buffor_button="10" then
					i<=0;
					setna<=0;
					dziesietna<=0;
					sek<=0;
					dziesiata<=0;
					bliczba0<=0;
					bliczba2<=0;
					bliczba1<=0;
					bliczba3<=0;
					led7_seg_o_tmp0<=bled7_seg_o_tmp0;
					led7_seg_o_tmp1<=bled7_seg_o_tmp1;
					led7_seg_o_tmp2<=bled7_seg_o_tmp2;
					led7_seg_o_tmp3<=bled7_seg_o_tmp3;
				end if;
		end if;			

	
case bliczba0 is
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
							when 10 => bled7_seg_o_tmp0 <= "1111110"; -- na kreskê
							when others => bled7_seg_o_tmp0 <= "1111111"; -- wyzerowanie wszystkiego
					end case;	
					case bliczba1 is
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
							when 10 => bled7_seg_o_tmp1 <= "1111110"; -- na kreskê
							when others => bled7_seg_o_tmp1 <= "1111111"; -- wyzerowanie wszystkiego
					end case;
					case bliczba2 is
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
							when 10 => bled7_seg_o_tmp2 <= "1111110"; -- na kreskê
							when others => bled7_seg_o_tmp2 <= "1111111"; -- wyzerowanie wszystkiego
					end case;
					case bliczba3 is
							when 0 => bled7_seg_o_tmp3 <= "0000001"; --0
							when 1 => bled7_seg_o_tmp3 <= "1001111"; --1
							when 2 => bled7_seg_o_tmp3 <= "0010010"; --2
							when 3 => bled7_seg_o_tmp3 <= "0000110"; --3
							when 4 => bled7_seg_o_tmp3 <= "1001100"; --4
							when 5 => bled7_seg_o_tmp3 <= "0100100"; --5
							--when 6 => bled7_seg_o_tmp0 <= "0100000"; --6
							when 10 => bled7_seg_o_tmp3 <= "1111110"; -- na kreskê
							when others => bled7_seg_o_tmp3 <= "1111111"; -- wyzerowanie wszystkiego
					end case;	
	

led_o<=buffor_button;

led7_seg_o_tmp0<=bled7_seg_o_tmp0;
led7_seg_o_tmp1<=bled7_seg_o_tmp1;
led7_seg_o_tmp2<=bled7_seg_o_tmp2;
led7_seg_o_tmp3<=bled7_seg_o_tmp3;
end process;

end behavioral;