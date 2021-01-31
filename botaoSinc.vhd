<<<<<<< HEAD
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
=======
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
>>>>>>> 2e2b454fd21f3530828c46ea1a38ba8de22cb2c4
end logica ;