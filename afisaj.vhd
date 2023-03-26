library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity afisaj is 
	port(load,reset, clk,clk_placuta: in STD_LOGIC;	
	in_unitati: in STD_LOGIC_VECTOR (3 downto 0);
	in_zeci: in STD_LOGIC_VECTOR (3 downto 0);
	led_usa: out STD_LOGIC;
	anod: out std_logic_vector(3 downto 0);
	catod: out std_logic_vector(6 downto 0));
end afisaj;

architecture afisaj of afisaj is	 

	component cascadare_numaratoare_zecimale is
	    Port ( CLK : in  STD_LOGIC;
	           RESET : in  STD_LOGIC;
	           LED_UNITATI : out  STD_LOGIC_VECTOR (3 downto 0);
	           LED_ZECI : out  STD_LOGIC_VECTOR (3 downto 0);
			  FINAL:OUT STD_LOGIC;
			  IN_UNITATI1:in std_logic_vector(3 downto 0);
			  IN_ZECI1:in std_logic_vector(3 downto 0));
	end component;	 

	component multiplexor is 
		port(intrari_unitati,intrari_zeci: in std_logic_vector(3 downto 0);	
			output_nr:in std_logic_vector(15 downto 0):=x"0000";
			anod: out std_logic_vector(3 downto 0);
			catod: out std_logic_vector(6 downto 0));
	end component;

	component numarator_delay is
		port(en,reset,clk: in STD_LOGIC;
		led: out STD_LOGIC_VECTOR(15 downto 0));
	end component;

signal temp: std_logic_vector(15 downto 0);
signal led_unitati, led_zeci: STD_LOGIC_VECTOR (3 downto 0);
signal en: std_logic:='1';
begin
	
	u1: numarator_delay port map(en,reset,clk_placuta,temp);
	u2: cascadare_numaratoare_zecimale port map(clk,reset,led_unitati,led_zeci,led_usa,in_unitati,in_zeci);
	u3: multiplexor port map(led_unitati,led_zeci,temp,anod,catod);
	
end afisaj;
