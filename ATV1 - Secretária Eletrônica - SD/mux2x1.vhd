library ieee;
use ieee.std_logic_1164.all;


entity mux21 is
   port(I0,I1 : in std_logic_vector(15 downto 0);
	     seletor : in std_logic;    
      	Saida : out std_logic_vector(15 downto 0));

end mux21;

architecture ARKMUX of mux21 is
  
     begin
      with seletor select
  	   Saida<= I0 when '0',
		        I1 when others;
    
end ARKMUX;