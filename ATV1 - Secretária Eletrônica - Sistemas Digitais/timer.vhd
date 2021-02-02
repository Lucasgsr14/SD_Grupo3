library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;
  
entity Timer is 
   port(Clock, CLR, en : in std_logic; 
      Q : out std_logic_vector(15 downto 0)); 
end Timer; 
 
architecture ckt of Timer is 
   signal tmp: std_logic_vector(15 downto 0); 

begin 
   process (Clock, CLR, en) 
   begin 
      if (CLR = '1') then 
         tmp <= "0000000000000000"; 
      elsif (Clock'event and Clock = '1' and en = '1') then 
         tmp <= tmp + 1; 
      end if; 
   end process; 
   Q <= tmp; 
end ckt;