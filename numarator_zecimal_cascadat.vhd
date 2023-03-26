library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cascadare_numaratoare_zecimale is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           LED_UNITATI : out  STD_LOGIC_VECTOR (3 downto 0);
           LED_ZECI : out  STD_LOGIC_VECTOR (3 downto 0);
		   FINAL:OUT STD_LOGIC;
		   IN_UNITATI1:in std_logic_vector(3 downto 0);
		   IN_ZECI1:in std_logic_vector(3 downto 0));
end cascadare_numaratoare_zecimale;

architecture Behavioral of cascadare_numaratoare_zecimale is

component numarator_zecimal_zeci is
    Port ( CLK_ZECI : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           FINAL_NUMARARE : out  STD_LOGIC;
           LED_ZECI : out  STD_LOGIC_VECTOR (3 downto 0);
		   IN_ZECI:IN STD_LOGIC_VECTOR (3 downto 0));
end component;

component numarator_zecimal_unitati is
    Port ( CLK_UNITATI : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           LED_UNITATI : out  STD_LOGIC_VECTOR (3 downto 0);
			FINAL_UNITATI: out STD_LOGIC;
			 IN_UNITATI:IN STD_LOGIC_VECTOR (3 downto 0):="1001");
end component;


signal final_unitati:std_logic:='0';
begin

	U1:numarator_zecimal_unitati port map(CLK,RESET,LED_UNITATI,final_unitati,IN_UNITATI1);
	U2:numarator_zecimal_zeci port map(final_unitati,RESET,FINAL,LED_ZECI,IN_ZECI1);

end Behavioral;
