library IEEE;
use IEEE.STD_LOGIC_1164.all;	
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.STD_LOGIC_arith.all;

entity decodificare_stari is 
	port(sw: in std_logic_vector(6 downto 0);	 
	clatire_sup,prespalare: out std_logic;
	timp_temp: out std_logic_vector(7 downto 0);
	timp_total_zeci: out std_logic_vector (3 downto 0);
	timp_total_unitati: out std_logic_vector (3 downto 0));
		
end decodificare_stari;


architecture decodificare_stari of decodificare_stari is
	signal temp: std_logic_vector(1 downto 0);
	signal timp_total_unitati_temp: std_logic_vector (3 downto 0);
	signal timp_total_zeci_temp: std_logic_vector (3 downto 0);
	
begin
	process(sw)
	begin	
	if(sw(6) = '0') then --automat 
	   case sw is
		   when "0000000" => timp_total_unitati_temp<=timp_total_unitati_temp+1; timp_temp<="00011110"; temp<="00";  prespalare<='0'; clatire_sup<='0';
		   when "0001000" => timp_total_unitati_temp<=timp_total_unitati_temp+2; timp_temp<="01011010"; temp<="10";  prespalare<='0'; clatire_sup<='0';
		   when "0010000" => timp_total_unitati_temp<=timp_total_unitati_temp+1; timp_total_zeci_temp<=timp_total_zeci_temp+1; timp_temp<="00110010"; temp<="01";  prespalare<='0'; clatire_sup<='1';
		   when "0011000" => timp_total_unitati_temp<=timp_total_unitati_temp+1; timp_total_zeci_temp<=timp_total_zeci_temp+1; timp_temp<="00110010"; temp<="01";  prespalare<='1'; clatire_sup<='0';
		   when "0100000" => timp_total_unitati_temp<=timp_total_unitati_temp+3; timp_temp<="10010110"; temp<="11";  prespalare<='0'; clatire_sup<='1';
		   when others => timp_total_unitati_temp<="0000"; timp_total_zeci_temp<="0000"; timp_temp<="00000000"; temp<="00"; prespalare<='0'; clatire_sup<='0';
	   end case;
	else --manual		   
		temp(0)<=sw(5);				  
		temp(1)<=sw(4);
		case sw(5 downto 4) is
			when "00" => timp_total_unitati_temp<=timp_total_unitati_temp+1; 
			when "01" => timp_total_unitati_temp<=timp_total_unitati_temp+1; 
			when "10" => timp_total_unitati_temp<=timp_total_unitati_temp+2; 
			when others => timp_total_unitati_temp<=timp_total_unitati_temp+3; 
		end case; 
		
		prespalare<=sw(1); 
		clatire_sup<=sw(0);
		case sw(1 downto 0) is 
			when "00" => timp_total_zeci_temp<=timp_total_zeci_temp;
			when "01" => timp_total_zeci_temp<=timp_total_zeci_temp+1;
			when "10" => timp_total_zeci_temp<=timp_total_zeci_temp+1;	  
			when others => timp_total_zeci_temp<=timp_total_zeci_temp+2;
			
		end case;
	end if;
	
	   	
	end process;
	timp_total_zeci<=timp_total_zeci_temp;
	timp_total_unitati<=timp_total_unitati_temp;  
end decodificare_stari;