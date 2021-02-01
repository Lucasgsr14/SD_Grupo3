library ieee;
use ieee.std_logic_1164.all;

entity Registrador16bits is
  port (X : in  std_logic_vector (15 downto 0);
        ld, clr, clk : in std_logic;
        Q : out std_logic_vector (15 downto 0));
end Registrador16bits;

architecture ckt of Registrador16bits is

  component ffd is
    port (clk,D,P,C : in  std_logic;
                  q : out std_logic);
  end component;
  
  signal mux, aux : std_logic_vector(15 downto 0);
  
  begin
  
   mux(15) <= (X(15) and ld) or (aux(15) and not(ld));
   mux(14) <= (X(14) and ld) or (aux(14) and not(ld));
   mux(13) <= (X(13) and ld) or (aux(13) and not(ld));
   mux(12) <= (X(12) and ld) or (aux(12) and not(ld));
   mux(11) <= (X(11) and ld) or (aux(11) and not(ld));
   mux(10) <= (X(10) and ld) or (aux(10) and not(ld));    
   mux(9) <= (X(9) and ld) or (aux(9) and not(ld));
   mux(8) <= (X(8) and ld) or (aux(8) and not(ld));
   mux(7) <= (X(7) and ld) or (aux(7) and not(ld));
   mux(6) <= (X(6) and ld) or (aux(6) and not(ld));
   mux(5) <= (X(5) and ld) or (aux(5) and not(ld));
   mux(4) <= (X(4) and ld) or (aux(4) and not(ld));
   mux(3) <= (X(3) and ld) or (aux(3) and not(ld));
   mux(2) <= (X(2) and ld) or (aux(2) and not(ld));
   mux(1) <= (X(1) and ld) or (aux(1) and not(ld));
   mux(0) <= (X(0) and ld) or (aux(0) and not(ld));
	
   ffd15 : ffd port map (clk => clk, D => mux(15), P => '1', C => clr, q => aux(15));
   ffd14 : ffd port map (clk => clk, D => mux(14), P => '1', C => clr, q => aux(14));
   ffd13 : ffd port map (clk => clk, D => mux(13), P => '1', C => clr, q => aux(13));
   ffd12 : ffd port map (clk => clk, D => mux(12), P => '1', C => clr, q => aux(12));
   ffd11 : ffd port map (clk => clk, D => mux(11), P => '1', C => clr, q => aux(11));
   ffd10 : ffd port map (clk => clk, D => mux(10), P => '1', C => clr, q => aux(10));   
   ffd9 : ffd port map (clk => clk, D => mux(9), P => '1', C => clr, q => aux(9));
   ffd8 : ffd port map (clk => clk, D => mux(8), P => '1', C => clr, q => aux(8));
   ffd7 : ffd port map (clk => clk, D => mux(7), P => '1', C => clr, q => aux(7));
   ffd6 : ffd port map (clk => clk, D => mux(6), P => '1', C => clr, q => aux(6));
   ffd5 : ffd port map (clk => clk, D => mux(5), P => '1', C => clr, q => aux(5));
   ffd4 : ffd port map (clk => clk, D => mux(4), P => '1', C => clr, q => aux(4));
   ffd3 : ffd port map (clk => clk, D => mux(3), P => '1', C => clr, q => aux(3));
   ffd2 : ffd port map (clk => clk, D => mux(2), P => '1', C => clr, q => aux(2));
   ffd1 : ffd port map (clk => clk, D => mux(1), P => '1', C => clr, q => aux(1));
   ffd0 : ffd port map (clk => clk, D => mux(0), P => '1', C => clr, q => aux(0));
	
   Q(15) <= aux(15);
   Q(14) <= aux(14);
   Q(13) <= aux(13);
   Q(12) <= aux(12);
   Q(11) <= aux(11);
   Q(10) <= aux(10);     
   Q(9) <= aux(9);
   Q(8) <= aux(8);
   Q(7) <= aux(7);
   Q(6) <= aux(6);
   Q(5) <= aux(5);
   Q(4) <= aux(4);
   Q(3) <= aux(3);
   Q(2) <= aux(2);
   Q(1) <= aux(1);
   Q(0) <= aux(0);
     
end ckt;