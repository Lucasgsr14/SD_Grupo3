entity bloco_comp is
  port (tam_msg, amostra_atual, tot_msg, msg_atual, index_msg : in  bit_vector (15 downto 0);
        index_gt_0, msg_gt_tot, amostra_gt_tam : out bit;
	index_eq_0, msg_eq_tot, amostra_eq_tam : out bit;
	index_it_0, msg_it_tot, amostra_it_tam : out bit);
  end bloco_comp;

architecture ckt of bloco_comp is

  component ComparadorMagnitude16bits is
    port( X, Y : in bit_vector(15 downto 0);
        LT, EQ, GT : out BIT);
  end component;
  signal aux_tam_msg, aux_amostra_atual, aux_tot_msg, aux_msg_atual, aux_index_msg, aux0 : bit_vector(15 downto 0);
  signal qt, eq, it : bit_vector(2 downto 0);

begin

	aux_tam_msg <= tam_msg;
	aux_amostra_atual <= amostra_atual;
	aux_tot_msg <=tot_msg;
	aux_msg_atual <= msg_atual;
	aux_index_msg <= index_msg;
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

index_gt_0 <= qt(0);
amostra_gt_tam <= qt(1);
msg_gt_tot <= qt(2);
 
index_eq_0 <= eq(0);
amostra_eq_tam <= eq(1); 
msg_eq_tot <= eq(2);

index_it_0 <= it(0);
amostra_it_tam <= it(1);
msg_it_tot <= it(2);

end ckt;