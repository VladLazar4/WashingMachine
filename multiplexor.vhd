library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity multiplexor is 
	port(intrari_unitati,intrari_zeci: in std_logic_vector(3 downto 0);
	output_nr:in std_logic_vector(15 downto 0):=x"0000";
	anod: out std_logic_vector(3 downto 0);
	catod: out std_logic_vector(6 downto 0));
end multiplexor;

architecture multiplexor of multiplexor is	 

signal selectii: std_logic:='0';
begin
	--legari
	
	process (output_nr(15),intrari_unitati,intrari_zeci)
	begin
	selectii<=output_nr(15);   
	case selectii is
		when '0' => anod<="1110";
			case intrari_unitati is
				when "0000"	=> catod<="1000000";
				when "0001"	=> catod<="1111001";
				when "0010"	=> catod<="0100100";
				when "0011"	=> catod<="0110000";
				when "0100"	=> catod<="0011001"; 
				when "0101"	=> catod<="0010010";
				when "0110"	=> catod<="0000010";
				when "0111"	=> catod<="1111000";
				when "1000"	=> catod<="0000000";
				when "1001"	=> catod<="0010000";	 
				when others => catod<="1111111";
			end case;
		when '1'=>	anod<="1101";
			case intrari_zeci is
				when "0000"	=> catod<="1000000";
				when "0001"	=> catod<="1111001";
				when "0010"	=> catod<="0100100";
				when "0011"	=> catod<="0110000";
				when "0100"	=> catod<="0011001"; 
				when "0101"	=> catod<="0010010";
				when "0110"	=> catod<="0000010";
				when "0111"	=> catod<="1111000";
				when "1000"	=> catod<="0000000";
				when "1001"	=> catod<="0010000";	 
				when others => catod<="1111111";
			end case;
		when others => catod<="0000000";
	end case;
		end process;	 
end multiplexor;
