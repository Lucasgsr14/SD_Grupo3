entity ComparadorMagnitude8bits is
  port( X, Y : in bit_vector(15 downto 0);
        LT, EQ, GT : out BIT);
end ComparadorMagnitude8bits;

architecture ckt of ComparadorMagnitude8bits is

signal v,f : bit_vector(12 downto 0);
signal igual,maior,menor : BIT;
                                                        
begin 

v(15) <= X(15) xnor Y(15);                                                    
v(14) <= X(14) xnor Y(14); 
v(13) <= X(13) xnor Y(13);
v(12) <= X(12) xnor Y(12);                                                    
v(11) <= X(11) xnor Y(11); 
v(10) <= X(10) xnor Y(10);
v(9) <= X(9) xnor Y(9);
v(8) <= X(8) xnor Y(8);  
v(7) <= X(7) xnor Y(7); 
v(6) <= X(6) xnor Y(6);
v(5) <= X(5) xnor Y(5);
v(4) <= X(4) xnor Y(4);
v(3) <= X(3) xnor Y(3); 
v(2) <= X(2) xnor Y(2);
v(1) <= X(1) xnor Y(1);
v(0) <= X(0) xnor Y(0);



f(15) <= X(15) and not(Y(15));
f(14) <= X(14) and not(Y(14)) and v(15);                       
f(13) <= X(13) and not(Y(13)) and v(14) and v(15);          
f(12) <= X(12) and not(Y(12)) and v(13) and v(14) and v(15);
f(11) <= X(11) and not(Y(11)) and v(12) and v(13) and v(14) and v(15);
f(10) <= X(10) and not(Y(10)) and v(11) and v(12) and v(13) and v(14) and v(15);
f(9) <= X(9) and not(Y(9)) and v(10) and v(11) and v(12) and v(13) and v(14) and v(15);
f(8) <= X(8) and not(Y(8)) and v(9) and v(10) and v(11) and v(12) and v(13) and v(14) and v(15);
f(7) <= X(7) and not(Y(7)) and v(8) and v(9) and v(10) and v(11) and v(12) and v(13) and v(14) and v(15);
f(6) <= X(6) and not(Y(6)) and v(7) and v(8) and v(9) and v(10) and v(11) and v(12) and v(13) and v(14) and v(15);
f(5) <= X(5) and not(Y(5)) and v(6) and v(7) and v(8) and v(9) and v(10) and v(11) and v(12) and v(13) and v(14) and v(15);
f(4) <= X(4) and not(Y(4)) and v(5) and v(6) and v(7) and v(8) and v(9) and v(10) and v(11) and v(12) and v(13) and v(14) and v(15);
f(3) <= X(3) and not(Y(3)) and v(4) and v(5) and v(6) and v(7) and v(8) and v(9) and v(10) and v(11) and v(12) and v(13) and v(14) and v(15);
f(2) <= X(2) and not(Y(2)) and v(3) and v(4) and v(5) and v(6) and v(7) and v(8) and v(9) and v(10) and v(11) and v(12) and v(13) and v(14) and v(15);
f(1) <= X(1) and not(Y(1)) and v(2) and v(3) and v(4) and v(5) and v(6) and v(7) and v(8) and v(9) and v(10) and v(11) and v(12) and v(13) and v(14) and v(15);
f(0) <= X(0) and not(Y(0)) and v(1) and v(2) and v(3) and v(4) and v(5) and v(6) and v(7) and v(8) and v(9) and v(10) and v(11) and v(12) and v(13) and v(14) and v(15);

igual <= (v(15) and v(14)) and (v(13) and v(12)) and (v(11) and v(10)) and (v(9) and v(8)) and (v(7) and v(6)) and (v(5) and v(4)) and (v(3) and v(2)) and (v(1) and v(0));

maior <= f(15) or f(14) or f(13) or f(12) or f(11) or f(10) or f(9) or f(8) or f(7) or f(6) or f(5) or f(4) or f(3) or f(2) or f(1) or f(0);

menor <= not(igual or maior); 

LT <= menor;
EQ <= igual;
GT <= maior;


end ckt;
