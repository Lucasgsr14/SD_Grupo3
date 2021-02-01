library ieee;
use ieee.std_logic_1164.all;

entity bloco_comp is
  port (tam_msg, amostra_atual, tot_msg, msg_atual, index_msg, temp : in  std_logic_vector (15 downto 0);
        index_gt_0, msg_gt_tot, amostra_gt_tam : out std_logic;
	     index_eq_0, msg_eq_tot, amostra_eq_tam : out std_logic;
	     index_it_0, msg_it_tot, amostra_it_tam : out std_logic;
	     msg_lt_1, msg_eq_1, msg_gt_1, tam_lt_10, tam_eq_10, tam_gt_10, tot_lt_25, tot_eq_25, tot_gt_25, tam_lt_2048, tam_eq_2048, tam_gt_2048 : out std_logic;
		  temp_lt_2, temp_eq_2, temp_gt_2, temp_lt_5, temp_eq_5, temp_gt_5, temp_lt_60, temp_eq_60, temp_gt_60 : out std_logic);
  end bloco_comp;

architecture ckt of bloco_comp is

  component ComparadorMagnitude16bits is
    port( X, Y : in std_logic_vector(15 downto 0);
        LT, EQ, GT : out std_logic);
  end component;
  signal aux_tam_msg, aux_amostra_atual, aux_tot_msg, aux_msg_atual, aux_index_msg, aux0, aux_temp : std_logic_vector(15 downto 0);
  signal qt, eq, it : std_logic_vector(9 downto 0);

begin

	aux_tam_msg <= tam_msg;
	aux_amostra_atual <= amostra_atual;
	aux_tot_msg <=tot_msg;
	aux_msg_atual <= msg_atual;
	aux_index_msg <= index_msg;
	aux_temp <= temp;
	aux0 <= "0000000000000000";
	

comp_index: ComparadorMagnitude16bits port map(
X => aux_index_msg,
Y => aux0,
LT => it(0),
EQ => eq(0),
GT => qt(0));

comp_amostra: ComparadorMagnitude16bits port map(
X => aux_tam_msg,
Y => aux_amostra_atual,
LT => it(1),
EQ => eq(1),
GT => qt(1));

comp_msg: ComparadorMagnitude16bits port map(
X => aux_tot_msg,
Y => aux_msg_atual,
LT => it(2),
EQ => eq(2),
GT => qt(2));

comp_atual_1 : ComparadorMagnitude16bits port map(
X => aux_msg_atual,
Y => "0000000000000001",
LT => it(3),
EQ => eq(3),
GT => qt(3));

comp_tot_25 : ComparadorMagnitude16bits port map(
X => aux_tot_msg,
Y => "0000000000011001",
LT => it(4),
EQ => eq(4),
GT => qt(4));

comp_tam_10 : ComparadorMagnitude16bits port map(
X => aux_tam_msg,
Y => "0000000000001010",
LT => it(5),
EQ => eq(5),
GT => qt(5));

comp_tam_2048 : ComparadorMagnitude16bits port map(
X => aux_tam_msg,
Y => "0000100000000000",
LT => it(6),
EQ => eq(6),
GT => qt(6));

comp_temp_2 : ComparadorMagnitude16bits port map(
X => aux_temp,
Y => "0000000000000010",
LT => it(7),
EQ => eq(7),
GT => qt(7));

comp_temp_5 : ComparadorMagnitude16bits port map(
X => aux_temp,
Y => "0000000000000101",
LT => it(8),
EQ => eq(8),
GT => qt(8));

comp_temp_60 : ComparadorMagnitude16bits port map(
X => aux_temp,
Y => "0000000000111100",
LT => it(9),
EQ => eq(9),
GT => qt(9));



index_gt_0 <= qt(0);
amostra_gt_tam <= qt(1);
msg_gt_tot <= qt(2);
 
index_eq_0 <= eq(0);
amostra_eq_tam <= eq(1); 
msg_eq_tot <= eq(2);

index_it_0 <= it(0);
amostra_it_tam <= it(1);
msg_it_tot <= it(2);

msg_gt_1 <= qt(3);
msg_eq_1 <= eq(3);
msg_lt_1 <= it(3);

tot_gt_25 <= qt(4);
tot_eq_25 <= eq(4);
tot_lt_25 <= it(4);

tam_gt_10 <= qt(5);
tam_eq_10 <= eq(5);
tam_lt_10 <= it(5);

tam_gt_2048 <= qt(6);
tam_eq_2048 <= eq(6);
tam_lt_2048 <= it(6);

temp_gt_2 <= qt(7);
temp_eq_2 <= eq(7);
temp_lt_2 <= it(7); 

temp_gt_5 <= qt(8);
temp_eq_5 <= eq(8);
temp_lt_5 <= it(8); 

temp_gt_60 <= qt(9);
temp_eq_60 <= eq(9);
temp_lt_60 <= it(9); 


 
end ckt;