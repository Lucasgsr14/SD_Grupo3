library ieee;
use ieee.std_logic_1164.all;


entity conversor_somador is

  port ( A : in std_logic_vector(3 downto 0);

         S : out std_logic_vector(3 downto 0));

         

end conversor_somador;



architecture cs of conversor_somador is 

    begin

      S(3) <= A(3) or (A(2) and A(0)) or (A(2) and A(1));

      S(2) <= (A(2) and (not(A(1))) and (not(A(0)))) or (A(3) and A(0));

      S(1) <= (A(1) and A(0)) or (A(3) and (not(A(0)))) or ((not(A(2))) and A(1));

      S(0) <= ((not(A(3))) and (not(A(2))) and A(0)) or (A(3) and (not(A(0)))) or (A(2) and A(1) and (not(A(0))));

 

 end cs;