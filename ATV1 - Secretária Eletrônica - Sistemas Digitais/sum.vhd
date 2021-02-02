library ieee;
use ieee.std_logic_1164.all;

entity bloco_sum is
       port (tam_msg, msg_atual, tot_msg, index_msg, amostra_atual : in std_logic_vector(15 downto 0);
		       out_sum_tam, out_sum_msg, out_sum_tot, out_sum_index, out_sum_amostra : out std_logic_vector(15 downto 0));
end bloco_sum;

architecture ckt of bloco_sum is

component Somador16bits is
  port ( X, Y : in  std_logic_vector(15 downto 0);
           ci : in std_logic;
            Q : out std_logic_vector(15 downto 0);
            cout : out std_logic);
end component;

 signal aux_out_tam, aux_out_msg, aux_out_tot, aux_out_index, aux_out_amostra : std_logic_vector(15 downto 0);
 signal csum : std_logic_vector(4 downto 0);

begin

tam_msg_1 : Somador16bits port map(
X => tam_msg,
Y => "0000000000000001",
ci => '0',
Q => aux_out_tam,
cout => csum(0));

msg_atual_1 : Somador16bits port map(
X => msg_atual,
Y => "0000000000000001",
ci => '0',
Q => aux_out_msg,
cout => csum(1));

tot_msg_1 : Somador16bits port map(
X => tot_msg,
Y => "0000000000000001",
ci => '0',
Q => aux_out_tot,
cout => csum(2));

index_msg_1 : Somador16bits port map(
X => index_msg,
Y => "1111111111111111",
ci => '0',
Q => aux_out_index,
cout => csum(3));

amostra_atual_1 : Somador16bits port map(
X => amostra_atual,
Y => "0000000000000001",
ci => '0',
Q => aux_out_amostra,
cout => csum(4));

out_sum_tam <= aux_out_tam;
out_sum_msg <= aux_out_msg;
out_sum_tot <= aux_out_tot;
out_sum_index <= aux_out_index;
out_sum_amostra <= aux_out_amostra;

end ckt;
