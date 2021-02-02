library ieee;
use ieee.std_logic_1164.all;

entity Somador16bits is
  port ( X, Y : in  std_logic_vector(15 downto 0);
           ci : in std_logic;
            Q : out std_logic_vector(15 downto 0);
            cout : out std_logic);
end Somador16bits;

architecture ckt of Somador16bits is
  
  signal co : std_logic_vector (15 downto 0);
  
  begin
    
    co(0) <= ci;
    Q(0)  <=  Y(0) xor X(0) xor co(0);
    co(1) <= (Y(0) and co(0)) or (X(0) and co(0)) or (X(0) and Y(0));
    Q(1)  <=  Y(1) xor X(1) xor co(1);
    co(2) <= (Y(1) and co(1)) or (X(1) and co(1)) or (X(1) and Y(1));
    Q(2)  <=  Y(2) xor X(2) xor co(2);
    co(3) <= (Y(2) and co(2)) or (X(2) and co(2)) or (X(2) and Y(2));
    Q(3)  <=  Y(3) xor X(3) xor co(3);
    co(4) <= (Y(3) and co(3)) or (X(3) and co(3)) or (X(3) and Y(3));
    Q(4)  <=  Y(4) xor X(4) xor co(4);
    co(5) <= (Y(4) and co(4)) or (X(4) and co(4)) or (X(4) and Y(4));
    Q(5)  <=  Y(5) xor X(5) xor co(5);
    co(6) <= (Y(5) and co(5)) or (X(5) and co(5)) or (X(5) and Y(5));
    Q(6)  <=  Y(6) xor X(6) xor co(6);
    co(7) <= (Y(6) and co(6)) or (X(6) and co(6)) or (X(6) and Y(6));
    Q(7)  <=  Y(7) xor X(7) xor co(7);
    co(8) <= (Y(7) and co(7)) or (X(7) and co(7)) or (X(7) and Y(7));
	 Q(8)  <=  Y(8) xor X(8) xor co(8);
    co(9) <= (Y(8) and co(8)) or (X(8) and co(8)) or (X(8) and Y(8));
	 Q(9)  <=  Y(9) xor X(9) xor co(9);
    co(10) <= (Y(9) and co(9)) or (X(9) and co(9)) or (X(9) and Y(9));
	 Q(10)  <=  Y(10) xor X(10) xor co(10);
    co(11) <= (Y(10) and co(10)) or (X(10) and co(10)) or (X(10) and Y(10));
	 Q(11)  <=  Y(11) xor X(11) xor co(11);
    co(12) <= (Y(11) and co(11)) or (X(11) and co(11)) or (X(11) and Y(11));
	 Q(12)  <=  Y(12) xor X(12) xor co(12);
    co(13) <= (Y(12) and co(12)) or (X(12) and co(12)) or (X(12) and Y(12));
	 Q(13)  <=  Y(13) xor X(13) xor co(13);
    co(14) <= (Y(13) and co(13)) or (X(13) and co(13)) or (X(13) and Y(13));
	 Q(14)  <=  Y(14) xor X(14) xor co(14);
    co(15) <= (Y(14) and co(14)) or (X(14) and co(14)) or (X(14) and Y(14));
	 Q(15)  <=  Y(15) xor X(15) xor co(15);
    cout <= (Y(15) and co(15)) or (X(15) and co(15)) or (X(15) and Y(15));
	 
    
end ckt;