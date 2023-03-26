library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
entity numarator_zecimal_unitati is
    Port ( CLK_UNITATI : in  STD_LOGIC;
           RESET,load : in  STD_LOGIC;
           LED_UNITATI : out  STD_LOGIC_VECTOR (3 downto 0);
			FINAL_UNITATI: out STD_LOGIC;
			 IN_UNITATI:IN STD_LOGIC_VECTOR (3 downto 0));
end numarator_zecimal_unitati;

architecture Behavioral of numarator_zecimal_unitati is
signal cnt_unitati:std_logic_vector(3 downto 0);
begin

	process(CLK_UNITATI,RESET,load)
	begin
	   if(cnt_unitati="UUUU") then
	       cnt_unitati<=IN_UNITATI;
	   end if;
		if(RESET='1') THEN cnt_unitati<="1001";
		elsif (CLK_UNITATI'event and CLK_UNITATI='1') then 
		      if(load='1') then cnt_unitati<=IN_UNITATI;
		      else cnt_unitati<=cnt_unitati-1; FINAL_UNITATI<='0';
			     if(cnt_unitati="0000") then cnt_unitati<="1001"; FINAL_UNITATI<='1';
			     end if;
			 end if;
		end if;
	
	end process;
LED_UNITATI<=cnt_unitati;

end Behavioral;