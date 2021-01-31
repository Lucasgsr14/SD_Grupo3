entity complementoA2 is
  port ( D : in bit_vector(6 downto 0);
         K : out bit_vector(6 downto 0));         
end complementoA2;

architecture ckt of complementoA2 is 

  signal A1, Cin, S : bit_vector(6 downto 0);
  
  begin
    A1(6) <= not(D(6));
    A1(5) <= not(D(5));
    A1(4) <= not(D(4));
    A1(3) <= not(D(3));
    A1(2) <= not(D(2));
    A1(1) <= not(D(1));
    A1(0) <= not(D(0));
    
    S(0) <= '1';
    S(1) <= '0';
    S(2) <= '0';
    S(3) <= '0';
    S(4) <= '0';
    S(5) <= '0';
    S(6) <= '0';
        
    Cin(0) <= '0';
    
    K(0) <= A1(0) xor S(0) xor Cin(0);
    Cin(1) <= (S(0) and Cin(0)) or (A1(0) and Cin(0)) or (A1(0) and S(0));
    K(1) <= A1(1) xor S(1) xor Cin(1);
    Cin(2) <= (S(1) and Cin(1)) or (A1(1) and Cin(1)) or (A1(1) and S(1));
    K(2) <= A1(2) xor S(2) xor Cin(2);
    Cin(3) <= (S(2) and Cin(2)) or (A1(2) and Cin(2)) or (A1(2) and S(2));
    K(3) <= A1(3) xor S(3) xor Cin(3);
    Cin(4) <= (S(3) and Cin(3)) or (A1(3) and Cin(3)) or (A1(3) and S(3));
    K(4) <= A1(4) xor S(4) xor Cin(4);
    Cin(5) <= (S(4) and Cin(4)) or (A1(4) and Cin(4)) or (A1(4) and S(4));
    K(5) <= A1(5) xor S(5) xor Cin(5);
    Cin(6) <= (S(5) and Cin(5)) or (A1(5) and Cin(5)) or (A1(5) and S(5));
    K(6) <= A1(6) xor S(6) xor Cin(6);    
end ckt;