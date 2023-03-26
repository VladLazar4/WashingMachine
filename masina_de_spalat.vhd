library	IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity masina_de_spalat is
	port(clk_placuta,reset,start,usa: in std_logic;
	sw: in std_logic_vector (6 downto 0);
	led_usa, led_prespalare, led_spalare, led_clatire, led_clatiresup, led_centrifugare, led_final: out std_logic;
	anod: out std_logic_vector(3 downto 0);
	catod: out std_logic_vector(6 downto 0));
end entity;

architecture arh1 of masina_de_spalat is 

  component afisaj is 
	port(load,reset, clk,clk_placuta: in STD_LOGIC;	
		in_unitati: in STD_LOGIC_VECTOR (3 downto 0);
		in_zeci: in STD_LOGIC_VECTOR (3 downto 0);
		led_usa: out STD_LOGIC;
		anod: out std_logic_vector(3 downto 0);
		catod: out std_logic_vector(6 downto 0));
  	end component;  	
	
	component numarator_stari is
		port(reset,clk,ld,load2: in STD_LOGIC;
		tmax: in std_logic_vector(7 downto 0);
		timp_actual: in natural;
		final_num: out natural);
	end component;

	
	component decodificare_stari is 
		port(sw: in std_logic_vector(6 downto 0);	 
		clatire_sup,prespalare: out std_logic;
		timp_temp: out std_logic_vector(7 downto 0);
		timp_total_zeci: out std_logic_vector (3 downto 0);
		timp_total_unitati: out std_logic_vector (3 downto 0));
	end component;
	
	component secunde is
        port (clk_100Mhz: in std_logic;
        clk1Hz:out std_logic);
    end component;

type stare_t is (st00,st0,st1,st2,st3,st4,st5,st6,st11,st21,st31,st41,st51,st61);
signal stare: stare_t;
signal next_stare: stare_t := st00;
signal prespalare,clatire_sup,ld_num:std_logic;
signal load2: std_logic:='0';
signal aux_timp,timp: Natural:=0;
signal semnal_start:std_logic:='0'; 
signal led_usa_aux: std_logic;
signal semnal_numarator:std_logic_vector(7 downto 0);
signal semnal_numarator_total:std_logic_vector(7 downto 0);
signal timp_temp: std_logic_vector(7 downto 0);	
signal timp_total_zeci: std_logic_vector(3 downto 0);
signal timp_total_unitati: std_logic_vector(3 downto 0);
signal clk: std_logic;
signal load_numarare: std_logic:='0';
begin
	actualizeaza_stare: process(reset,clk,next_stare)
	begin
		if(reset='1')then stare<=st00;
		elsif (clk'event and clk='1') then stare<=next_stare;
		end if;
	end process actualizeaza_stare;
	
	tranzitie: process(stare,timp,usa,start,aux_timp,prespalare,clatire_sup,timp_total_unitati,timp_total_zeci)
	begin	 
            		
		case stare is
		when st00=>  
            led_usa<='0';
            led_prespalare<='0';
            led_spalare<='0';
            led_clatire<='0';
            led_clatiresup<='0';
            led_centrifugare<='0';
            led_final<='0';
            next_stare<=st0;
            
		when st0 =>	
			if(usa='1' and start='1') then 
				led_usa<='1'; --daca e true usa e inchisa    
				load_numarare<='1';
				if(prespalare='1') then 
					next_stare<=st1;
				else
					next_stare<=st2; 
				end if;
			else
				next_stare<=st0; 
			end if;
				
		when st1 =>	
		    load_numarare<='0';
			semnal_numarator<=x"0A";  
			ld_num <='1';
			load2<='1';
			aux_timp<=timp;
			next_stare<=st11;
			
		
		when st11 =>	 
			ld_num <='0';
			led_prespalare<='1';  
			if((timp - aux_timp) = 1) then 
					next_stare<=st2;
			end if;
			
		 when st2 =>
		     load_numarare<='0';
			 semnal_numarator<=x"14";
			 ld_num <='1';
			 load2<='1';
			 aux_timp<=timp;
			 next_stare<=st21; 
		
		when st21 => 
		 	ld_num <='0';
		 	led_spalare<='1';
			if((timp - aux_timp) = 1) then  
				next_stare<=st3; 
			end if;	
			
		when st3 =>	 
			semnal_numarator<=x"0A"; 
			ld_num <='1';
			load2<='1';
			aux_timp<=timp;
			next_stare<=st31;
			
		when st31 => 
			ld_num <='0';
			led_clatire<='1';
			if((timp - aux_timp) = 1) then 
				if(clatire_sup='1') then 
					next_stare<=st4;
				else
					next_stare<=st5;
				end if;
			end if;
				
		when st4 => 
			semnal_numarator<=x"0A";
			ld_num <='1';
			load2<='1';
			aux_timp<=timp;
			next_stare<=st41;
		
		when st41 =>   
			ld_num <='0';
			led_clatiresup<='1';
		  	if((timp - aux_timp) = 1) then 
				next_stare<=st5;
			end if;
			
		when st5=> 	
			semnal_numarator<=x"0A";
			ld_num <='1';
			load2<='1';
			aux_timp<=timp;
			next_stare<=st51;
			
		when st51 =>
			ld_num <='0';
			led_centrifugare<='1';
			if((timp - aux_timp) = 1) then 
				led_final<='1';
				next_stare<=st6; 
			end if;
				
		when st6=>
			semnal_numarator<=x"01";  
			ld_num <='1';
			load2<='1';
			aux_timp<=timp;
			next_stare<=st61;
		
		when st61=>	   
			ld_num <='0';
			if((timp - aux_timp) = 1) then
			     led_final<='1';   
				next_stare<=st00;
			end if;	
		end case;
	end process;   
	
	u0: secunde port map (clk_placuta,clk);
	u1: decodificare_stari port map(sw,clatire_sup,prespalare,timp_temp,timp_total_zeci, timp_total_unitati);
	u2: afisaj port map(load_numarare,reset,clk,clk_placuta,timp_total_unitati,timp_total_zeci,led_usa_aux,anod,catod); 
	u3: numarator_stari port map (reset,clk,ld_num,load2,semnal_numarator,aux_timp,timp);
end architecture;