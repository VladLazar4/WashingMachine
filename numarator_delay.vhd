library	IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity numarator_delay is
	port(en,reset,clk: in STD_LOGIC;
	led: out STD_LOGIC_VECTOR(15 downto 0));
end numarator_delay;

architecture numarator_delay of numarator_delay is
signal cnt: std_logic_vector(15 downto 0):=x"0000";	
signal temp: std_logic:='1';
begin
	process(reset, clk, en)
	begin  
		
		if(reset='1') then cnt<=x"0000";
		elsif(clk'event and clk='1')then
			if(en='1') then
				cnt<=cnt+1;						   
			end if;
		end if;
	end process; 
	led<=cnt;
end numarator_delay;  