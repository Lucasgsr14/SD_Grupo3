entity mux6x1 is
  port(M,CP,DR,DL,Set,Clear : in bit_vector(3 downto 0);
        Sel : in bit_vector(2 downto 0);
        Saida : out bit_vector(3 downto 0));

end mux6x1;

architecture arkmux of mux6x1 is
 
  begin
   
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
