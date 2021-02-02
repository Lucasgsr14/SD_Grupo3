library ieee;
use ieee.std_logic_1164.all;



entity bcd_display is

  port( X : in std_logic_vector(3 downto 0);

        D : out std_logic_vector(0 to 6));



end bcd_display;



architecture display of bcd_display is

   

  begin

    D(6) <= not(X(1) or X(3) or ((not(X(2))) and (not(X(0)))) or (X(2) and X(0)));

    D(5) <= not((not(X(2))) or ((not(X(1))) and (not(X(0)))) or (X(1) and X(0)));

    D(4) <= not((not(X(1))) or X(0) or X(2));

    D(3) <= not(X(3) or ((not(X(2))) and (not(X(0)))) or ((not(X(2))) and X(1)) or (X(1) and (not(X(0)))) or (X(2) and (not(X(1))) and X(0)));

    D(2) <= not(((not(X(2))) and (not(X(0)))) or (X(1) and (not(X(0)))));

    D(1) <= not(X(3) or ((not(X(1))) and (not(X(0)))) or (X(2) and (not(X(1)))) or (X(2) and (not(X(0)))));

    D(0) <= not(X(3) or ((not(X(2))) and X(1)) or (X(1) and (not(X(0)))) or (X(2) and (not(X(1)))));

    

end display;