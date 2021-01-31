library ieee;
use ieee.std_logic_1164.all;

entity Mux6x1 is
  port(D0,D1,D2,D3,D4,D5 : in std_logic_vector(15 downto 0);
        Sel : in std_logic_vector(2 downto 0);
        Saida : out std_logic_vector(15 downto 0));

end Mux6x1;

architecture arkmux of Mux6x1 is
 
  begin
	
	with sel select
		Saida<= D0 when "000",
			D1 when "001",
			D2 when "010",
			D3 when "011",
			D4 when "100",
			D5 when others;

end arkmux;
        
