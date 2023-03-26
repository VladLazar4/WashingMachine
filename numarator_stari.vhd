library	IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity numarator_stari is
	port(reset,clk,ld,load2: in STD_LOGIC;
	tmax: in std_logic_vector(7 downto 0);
	timp_actual: in natural;
	final_num: out natural);
end numarator_stari;

architecture numarator_stari of numarator_stari is 
signal cnt: std_logic_vector(7 downto 0):=x"00";
signal aux: natural:=timp_actual;
begin	  	   	
	process(reset, clk, ld, tmax)
	begin  
		
		if(reset='1') then cnt<=x"00";
		elsif(clk'event and clk='1')then
				if(ld='1')then 
					cnt<=tmax;
				else cnt<=cnt-1; 
					if (cnt=x"00" and load2='1') then
    					final_num<=aux+1;
					end if;
				end if;
		end if;
		 
	end process; 
end numarator_stari;