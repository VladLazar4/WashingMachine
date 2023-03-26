library	IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity secunde is
	port (clk_100Mhz: in std_logic;
	clk1Hz:out std_logic);
end secunde;

architecture Behavioral of secunde is   

signal count: integer:=0;
signal b:std_logic:='0';
begin
	process(clk_100Mhz)
	begin
		if(rising_edge(clk_100Mhz)) then
			count<=count+1;
			if( count =50000000-1) then 
				b<=not b;
				count<=0;
			end if;
		end if;
		clk1Hz<=b;
	end process;
end;