library ieee;
use ieee.std_logic_1164.all;

entity secretariaEletronica is
     port (Play, NextB, BackB, OnB, clk, new_msg : in std_logic;
	        AD : in std_logic_vector(7 downto 0);
			  LedF, LedO, LedM, LedP, LedR : out std_logic;
			  DA : out std_logic_vector(7 downto 0);
			  msgAtual : out std_logic_vector(15 downto 0));
end secretariaEletronica;

architecture ckt of secretariaEletronica is

component button is
  port (C, clk, reset : in std_logic;
        btn : out std_logic);
end component;

component div_clock is
port(
  clock_in  : in std_logic;
  count     : buffer std_logic_vector(23 downto 0);
  clock_out : out std_logic);
end component;

component controleSecretaria is
  port (clk, on1, play, back1, next1, temp_lt_60, temp_gt_60, new_msg, tot_lt_25, temp_lt_2, temp_gt_5, temp_gt_2, temp_lt_5,
        msg_lt_tot, msg_gt_1, index_gt_0, index_eq_0, ram_rw,  tam_msg_lt_11, tam_msg_lt_10484, tam_msg_gt_10, tam_msg_gt_10484,
		  amostra_lt_tam, flag_rt,  msg_gt_tot, reset1, amostra_gt_tam, msg_eq_1  : in std_logic;
        temp_clr, display_en, addr_clr, tot_msg_ld, ram_en_clr, ram_en_ld, mux_tot_s, msg_atual_ld, temp_en, mux_atual_s, msg_atual_clr,
		  index_ld, mux_index_s, ram_rw_ld, tot_msg_clr, ram_rw_clr, addr_ld, tam_msg_ld, mux_tam_s, amostra_clr, tam_msg_clr, aux_addr_ld,
		  data_ld, mux_addr_ld_s, da_clr, da_ld, amostra_ld, flag_rt_ld, flag_rt_clr, Led_O, Led_P, Led_R, mux_adr_sum_s : out std_logic;
		  mux_data_s : out std_logic_vector(1 downto 0));
end component;

component datapath is
     port (clk, clk_timer, temp_clr, addr_clr, tot_msg_ld, ram_en_clr, ram_en_ld, mux_tot_s, msg_atual_ld, temp_en, mux_atual_s, msg_atual_clr,
		  index_ld, mux_index_s, ram_rw_ld, tot_msg_clr, ram_rw_clr, addr_ld, tam_msg_ld, mux_tam_s, amostra_clr, tam_msg_clr, aux_addr_ld,
		  data_ld, mux_addr_ld_s, da_clr, da_ld, amostra_ld, flag_rt_ld, flag_rt_clr, mux_adr_sum_s : in std_logic;
		  ram_data, ad_in : in std_logic_vector(15 downto 0);
		  mux_data_s : in std_logic_vector(1 downto 0);
		  temp_lt_60, temp_gt_60, tot_lt_25, temp_lt_2, temp_gt_5, temp_gt_2, temp_lt_5,
        msg_lt_tot, msg_gt_1, index_gt_0, index_eq_0, ram_rw,  tam_msg_lt_11, tam_msg_lt_10484, tam_msg_gt_10, tam_msg_gt_10484,
		  amostra_lt_tam, flag_rt, msg_gt_tot, amostra_gt_tam, msg_eq_1, tot_eq_25 : out std_logic;
		  DA, addr, data, msgAtual : out std_logic_vector(15 downto 0));
end component;

component memo IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (11 DOWNTO 0)
	);
END component;



signal playBS, nextBS, backBS, clkTimer, aux_temp_lt_60, aux_temp_gt_60, aux_tot_lt_25, aux_temp_lt_2, aux_temp_gt_5, aux_temp_gt_2 : std_logic;
signal aux_temp_lt_5, aux_msg_it_tot, aux_msg_gt_1, aux_index_gt_0, aux_index_eq_0, aux_rw, aux_tam_lt_10, aux_tam_lt_2048, aux_tam_gt_10 : std_logic;
signal aux_tam_gt_2048, aux_amostra_it_tam, aux_flag, aux_msg_gt_tot, aux_amostra_gt_tam, aux_msg_eq_1 : std_logic;
signal aux_mux_data_s : std_logic_vector(1 downto 0);
signal aux_temp_clr, aux_display_en, aux_addr_clr,aux_tot_msg_ld,
aux_ram_en_clr, aux_ram_en_ld, aux_mux_tot_s, aux_msg_atual_ld,
aux_temp_en, aux_mux_atual_s, aux_msg_atual_clr, aux_index_ld,
aux_mux_index_s, aux_ram_rw_ld, aux_tot_msg_clr, aux_ram_rw_clr,
aux_addr_ld, aux_tam_msg_ld, aux_mux_tam_s, aux_amostra_clr, 
aux_tam_msg_clr, aux_aux_addr_ld, aux_data_ld, aux_mux_addr_ld_s,
aux_da_clr, aux_da_ld, aux_flag_rt_ld, aux_flag_rt_clr, aux_amostra_ld, 
aux_Led_O, aux_Led_P, aux_Led_R, aux_mux_adr_sum_s, aux_tot_eq_25 : std_logic;
signal aux_ram_data, ram_out : std_logic_vector(11 downto 0);
signal aux_reg_DA, aux_addr, aux_reg_data, aux_msgAtual : std_logic_vector(15 downto 0);


begin

play_S : button port map(C => Play, clk => clk, reset => '0', btn => playBS);
nextB_S : button port map(C => NextB, clk => clk, reset => '0', btn => nextBS);
backB_S : button port map(C => BackB, clk => clk, reset => '0', btn => backBS);

divClk : div_clock port map(clock_in => clk, clock_out => clkTimer);

port_controle : controleSecretaria port map(clk => clk, on1 => onB, play => playBS, back1 => backBS, next1 => nextBS,
temp_lt_60 => aux_temp_lt_60, temp_gt_60 => aux_temp_gt_60, new_msg => new_msg, tot_lt_25 => aux_tot_lt_25, temp_lt_2 => aux_temp_lt_2, temp_gt_5 => aux_temp_gt_5,
temp_gt_2 => aux_temp_gt_2, temp_lt_5 => aux_temp_lt_5, msg_lt_tot => aux_msg_it_tot, msg_gt_1 => aux_msg_gt_1, index_gt_0 => aux_index_gt_0, index_eq_0 => aux_index_eq_0,
ram_rw => aux_rw, tam_msg_lt_11 => aux_tam_lt_10, tam_msg_lt_10484 => aux_tam_lt_2048, tam_msg_gt_10 => aux_tam_gt_10, tam_msg_gt_10484 => aux_tam_gt_2048, amostra_lt_tam => aux_amostra_it_tam,
flag_rt => aux_flag, msg_gt_tot => aux_msg_gt_tot, amostra_gt_tam => aux_amostra_gt_tam, msg_eq_1 => aux_msg_eq_1, reset1 => '0',
temp_clr => aux_temp_clr, display_en => aux_display_en, addr_clr => aux_addr_clr, tot_msg_ld => aux_tot_msg_ld, ram_en_clr => aux_ram_en_clr, ram_en_ld => aux_ram_en_ld, mux_tot_s => aux_mux_tot_s,
msg_atual_ld => aux_msg_atual_ld, temp_en => aux_temp_en, mux_atual_s => aux_mux_atual_s, msg_atual_clr => aux_msg_atual_clr, index_ld => aux_index_ld, mux_index_s => aux_mux_index_s,
ram_rw_ld => aux_ram_rw_ld, tot_msg_clr => aux_tot_msg_clr, ram_rw_clr => aux_ram_rw_clr, addr_ld => aux_addr_ld, tam_msg_ld => aux_tam_msg_ld, mux_tam_s => aux_mux_tam_s, amostra_clr => aux_amostra_clr,
tam_msg_clr => aux_tam_msg_clr, aux_addr_ld => aux_aux_addr_ld, data_ld => aux_data_ld, mux_addr_ld_s => aux_mux_addr_ld_s, da_clr => aux_da_clr, da_ld => aux_da_ld, amostra_ld => aux_amostra_ld,
flag_rt_ld => aux_flag_rt_ld, flag_rt_clr => aux_flag_rt_clr, Led_O => aux_Led_O, Led_P => aux_Led_P, Led_R => aux_Led_R, mux_adr_sum_s => aux_mux_adr_sum_s, mux_data_s => aux_mux_data_s);
 
port_datapath : datapath port map(clk => clk, clk_timer => clkTimer, temp_clr => aux_temp_clr, addr_clr => aux_addr_clr, tot_msg_ld => aux_tot_msg_ld, ram_en_clr => aux_ram_en_clr, 
ram_en_ld => aux_ram_en_ld, mux_tot_s => aux_mux_tot_s, msg_atual_ld => aux_msg_atual_ld, temp_en => aux_temp_en, mux_atual_s => aux_mux_atual_s, msg_atual_clr => aux_msg_atual_clr,
index_ld => aux_index_ld, mux_index_s => aux_mux_index_s, ram_rw_ld => aux_ram_rw_ld, tot_msg_clr => aux_tot_msg_clr, ram_rw_clr => aux_ram_rw_clr, addr_ld => aux_addr_ld,
tam_msg_ld => aux_tam_msg_ld, mux_tam_s => aux_mux_tam_s, amostra_clr => aux_amostra_clr, tam_msg_clr => aux_tam_msg_clr, aux_addr_ld => aux_aux_addr_ld,
data_ld => aux_data_ld, mux_addr_ld_s => aux_mux_addr_ld_s, da_clr => aux_da_clr, da_ld => aux_da_ld, amostra_ld => aux_amostra_ld, flag_rt_ld => aux_flag_rt_ld,
flag_rt_clr => aux_flag_rt_clr, mux_adr_sum_s => aux_mux_adr_sum_s, ram_data(15 downto 12) => "0000", ram_data(11 downto 0) => aux_ram_data, ad_in(15 downto 8) => "00000000", ad_in(7 downto 0) => AD,
mux_data_s => aux_mux_data_s,  temp_lt_60 => aux_temp_lt_60, temp_gt_60 => aux_temp_gt_60, tot_lt_25 => aux_tot_lt_25, temp_lt_2 => aux_temp_lt_2, temp_gt_5 => aux_temp_gt_5, temp_gt_2 => aux_temp_gt_2,
temp_lt_5 => aux_temp_lt_5, msg_lt_tot => aux_msg_it_tot, msg_gt_1 => aux_msg_gt_1, index_gt_0 => aux_index_gt_0, index_eq_0 => aux_index_eq_0, ram_rw => aux_rw, tam_msg_lt_11 => aux_tam_lt_10, 
tam_msg_lt_10484 => aux_tam_lt_2048, tam_msg_gt_10 => aux_tam_gt_10, tam_msg_gt_10484 => aux_tam_gt_2048, amostra_lt_tam => aux_amostra_it_tam, flag_rt => aux_flag, msg_gt_tot => aux_msg_gt_tot,
amostra_gt_tam => aux_amostra_gt_tam, msg_eq_1 => aux_msg_eq_1, tot_eq_25 => aux_tot_eq_25, DA => aux_reg_DA, addr => aux_addr, data => aux_reg_data, msgAtual => aux_msgAtual);

port_memo : memo port map(address => aux_addr, clock => clk, data => aux_reg_data(11 downto 0), wren => aux_rw, q => aux_ram_data(11 downto 0));

LedO <= aux_Led_O;
LedP <= aux_Led_P;
LedR <= aux_led_R;
LedF <= aux_tot_eq_25 and aux_Led_O;
LedM <= new_msg and (aux_msg_gt_1 or aux_msg_eq_1);
DA <= aux_reg_DA(7 downto 0);
msgAtual <= aux_msgAtual;


end ckt;

		  