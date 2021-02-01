library ieee;
use ieee.std_logic_1164.all;

entity button is
  port (C, clk, reset : in std_logic;
        btn : out std_logic);
end button;

architecture ckt of button is

 component ffd is
    port (clk,D,P,C : in  std_logic;
                  q : out std_logic);
 end component;
 
 signal s1, s0, n1, n0 : std_logic;   
 
 begin
 
  s11 : ffd port map(clk=>clk,D=>n1,P=>'1',C=>reset,q=>s1);
  s00 : ffd port map(clk=>clk,D=>n0,P=>'1',C=>reset,q=>s0);
    
  n1 <= s0 or (not(c) and s1);
  n0 <= not(s1) and not(s0) and not(c);
  btn <= n0;
  
end ckt;