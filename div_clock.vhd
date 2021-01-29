library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity div_clock is
port(
  clock_in  : in std_logic;
  count     : buffer std_logic_vector(7 downto 0);
  clock_out : out std_logic);
end div_clock;
 
architecture teste of div_clock is
begin
  -- quando o contador é igual a 4
  -- nosso clock de saída recebe 1
  -- ou seja, nosso clock de saida é 1/4 do clock de entrada
 
  clock_out <= '1' when count >= "00100000" else
               '0';
 
  process(clock_in)
  begin
    -- a cada borda de subida do clock de entrada
    -- o contador é incrementado --
    if(clock_in ='1' and clock_in'event) then
      count <= count + 1;
    end if;
 
    -- quando o contador chega em 5 ele é zerado
    if(count = "01000001") then
      count <= "00000000";
    end if;
  end process;
end teste;