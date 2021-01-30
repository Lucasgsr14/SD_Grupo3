library ieee ;
use ieee.std_logic_1164.all;

entity botaoSinc is
	port ( s1, s0, button, n1, n0 : in std_logic ;
			 saida : out std_logic 
			 );
end botaoSinc ;

architecture logica of botaoSinc is
begin
	saida <= not(s1) and s0 and not(n0);
end logica ;