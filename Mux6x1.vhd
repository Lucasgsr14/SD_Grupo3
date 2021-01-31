library ieee;
use ieee.std_logic_1164.all;

entity Mux6x1 is
  port(M,CP,DR,DL,Set,Clear : in std_logic_vector(15 downto 0);
        Sel : in std_logic_vector(2 downto 0);
        Saida : out std_logic_vector(15 downto 0));

end Mux6x1;

architecture arkmux of Mux6x1 is
 
  begin
   
	 Saida(15)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(15)) or
	 (not Sel(2) and not Sel(1) and Sel(0) and CP(15)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(15)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(15)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(15)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(15));
	 
	 Saida(14)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(14)) or
	 (not Sel(2) and not Sel(1) and Sel(0) and CP(14)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(14)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(14)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(14)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(14));
	 
	 Saida(13)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(13)) or
	 (not Sel(2) and not Sel(1) and Sel(0) and CP(13)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(13)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(13)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(13)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(13));
   
	 Saida(12)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(12)) or
	 (not Sel(2) and not Sel(1) and Sel(0) and CP(12)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(12)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(12)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(12)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(12));
    
	 Saida(11)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(11)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(11)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(11)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(11)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(11)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(11));
   
    Saida(10)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(10)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(10)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(10)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(10)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(10)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(10));
   
    Saida(9)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(9)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(9)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(9)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(9)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(9)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(9));
	 
	 Saida(8)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(8)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(8)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(8)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(8)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(8)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(8));
	 
	 Saida(7)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(7)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(7)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(7)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(7)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(7)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(7));
	 
	 Saida(6)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(6)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(6)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(6)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(6)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(6)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(6));
	 
	 Saida(5)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(5)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(5)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(5)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(5)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(5)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(5));
	 
	 Saida(4)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(4)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(4)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(4)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(4)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(4)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(4));
	 
	 Saida(3)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(3)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(3)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(3)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(3)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(3)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(3));
	 
	 Saida(2)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(2)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(2)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(2)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(2)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(2)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(2));
	 
	 Saida(1)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(1)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(1)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(1)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(1)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(1)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(1));
	 
	 Saida(0)<= (not Sel(2) and not Sel(1) and not Sel(0) and M(0)) or
    (not Sel(2) and not Sel(1) and Sel(0) and CP(0)) or
    (not Sel(2) and Sel(1) and not Sel(0) and DR(0)) or
    (not Sel(2) and Sel(1) and Sel(0) and DL(0)) or
    (Sel(2) and not Sel(1) and not Sel(0) and Set(0)) or
    (Sel(2) and not Sel(1) and Sel(0) and Clear(0));

end arkmux;
        