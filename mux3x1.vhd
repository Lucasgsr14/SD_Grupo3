library ieee; 
use ieee.std_logic_1164.all;

entity mux3x1 is
   port(A0,A1,A2 : in std_logic_vector(15 downto 0);
	     sel : in std_logic_vector(1 downto 0);    
      	Z : out std_logic_vector(15 downto 0));

end mux3x1;

architecture ARKMUX of mux3x1 is
  
     begin
	with sel select
  	Z<= A0 when "00",
	    A1 when "01",
	    A2 when others;
end ARKMUX;
