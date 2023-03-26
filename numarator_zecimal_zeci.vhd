library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity numarator_zecimal_zeci is
    Port ( CLK_ZECI : in  STD_LOGIC;
           RESET,load : in  STD_LOGIC;
           FINAL_NUMARARE : out  STD_LOGIC;
           LED_ZECI : out  STD_LOGIC_VECTOR (3 downto 0);
		   IN_ZECI:IN STD_LOGIC_VECTOR (3 downto 0));
end numarator_zecimal_zeci;

architecture Behavioral of numarator_zecimal_zeci is
signal cnt_zeci:std_logic_vector(3 downto 0);
begin

	process(CLK_ZECI,RESET,load)
	begin
	   if(cnt_zeci="UUUU") then
	       cnt_zeci<=IN_ZECI;
	   end if;
		if(RESET='1') THEN cnt_zeci<="1001";
		elsif (CLK_ZECI'event and CLK_ZECI='1') then 
		   if(load='1') then cnt_zeci<=IN_ZECI;
		   else cnt_zeci<=cnt_zeci-1; FINAL_NUMARARE<='0';
                if(cnt_zeci="0000") then cnt_zeci<="1001"; FINAL_NUMARARE<='1';
                end if;
	       	end if;
		end if;
	
	end process;
LED_ZECI<=cnt_zeci;

end Behavioral;
