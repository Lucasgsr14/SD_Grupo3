library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity botaoSinc is
port(
  clock_in, b  : in std_logic;
  count     : buffer std_logic_vector(23 downto 0);
  pulso : out std_logic);
end botaoSinc;
 
architecture teste of botaoSinc is
begin
  pulso <= '1' when count = "000000000000000000000001" else
               '0';
 
  process(clock_in)
  begin
    -- a cada borda de subida do clock de entrada
    -- o contador é incrementado --
    if(clock_in ='1' and clock_in'event and b = '1') then
      count <= count + 1;
    end if;
    if(b = '0') then
      count <= "000000000000000000000000";
    end if;
  end process;
end teste;