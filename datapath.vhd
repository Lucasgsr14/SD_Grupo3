library ieee;
use ieee.std_logic_1164.all;

entity datapath is
     port (clk, temp_clr, addr_clr, tot_msg_ld, ram_en_clr, ram_en_ld, mux_tot_s, msg_atual_ld, temp_en, mux_atual_s, msg_atual_clr,
		  index_ld, mux_index_s, ram_rw_ld, tot_msg_clr, ram_rw_clr, addr_ld, tam_msg_ld, mux_tam_s, amostra_clr, tam_msg_clr, aux_addr_ld,
		  data_ld, mux_addr_ld_s, da_clr, da_ld, amostra_ld, flag_rt_ld, flag_rt_clr, mux_adr_sum_s : in std_logic;
		    temp_lt_60, msg_gt_0, temp_gt_60, new_msg, tot_lt_25, temp_lt_2, temp_gt_5, temp_gt_2, temp_lt_5,
        msg_lt_tot, msg_gt_1, index_gt_0, index_eq_0, ram_rw,  tam_msg_lt_11, tam_msg_lt_10484, tam_msg_gt_10, tam_msg_gt_10484,
		  amostra_lt_tam, flag_rt,  msg_gt_tot, msg_lt_tam, msg_eq_tam, reset1, amostra_gt_tam : out std_logic);
end datapath;

architecture ckt of datapath is 

component bloco_sum is
       port (tam_msg, msg_atual, tot_msg, index_msg, amostra_atual : in std_logic_vector(15 downto 0);
		       out_sum_tam, out_sum_msg, out_sum_tot, out_sum_index, out_sum_amostra : out std_logic_vector(15 downto 0));
end component;

component bloco_comp is
  port (tam_msg, amostra_atual, tot_msg, msg_atual, index_msg, temp : in  std_logic_vector (15 downto 0);
        index_gt_0, msg_gt_tot, amostra_gt_tam : out std_logic;
	     index_eq_0, msg_eq_tot, amostra_eq_tam : out std_logic;
	     index_it_0, msg_it_tot, amostra_it_tam : out std_logic;
	     msg_lt_1, msg_eq_1, msg_gt_1, tam_lt_10, tam_eq_10, tam_gt_10, tot_lt_25, tot_eq_25, tot_gt_25, tam_lt_2048, tam_eq_2048, tam_gt_2048 : out std_logic;
		  temp_lt_2, temp_eq_2, temp_gt_2, temp_lt_5, temp_eq_5, temp_gt_5, temp_lt_60, temp_eq_60, temp_gt_60 : out std_logic);
end component;

component bloco_reg is
    port (tam_msg, msg_atual, tot_msg, amostra_atual, index_msg, addr, ram_data_out : in std_logic_vector(15 downto 0),
	       out_sum_tam, out_sum_msg, out_sum_tot, out_sum_index, out_sum_amostra, AD, out_sum_addr : in std_logic_vector(15 downto 0)
			 clk, tam_msg_ld, tam_msg_clr, mux_tam_s, index_clr, index_ld, mux_index_s, tot_msg_clr, tot_msg_ld, mux_tot_s, addr_ld, addr_clr : in std_logic,
			 msg_atual_ld, msg_atual_clr, mux_atual_s, aux_begin_addr_ld, aux_begin_addr_clr, amostra_atual_ld, amostra_atual_clr : in std_logic,
			 data_clr, data_ld, da_ld, da_clr, ram_rw_ld, ram_rw_clr, ram_en_clr, ram_en_ld, flag_rt_clr, flag_rt_ld, mux_addr_s : in std_logic,
			 mux_data_s : in std_logic(1 downto 0));
			 reg_tam, reg_msg, reg_tot, reg_index, reg_amostra, reg_rw, reg_data, reg_addr, reg_begin, reg_flag, reg_da, reg_en : out std_logic_vector(15 downto 0);
end component;

component mux2x1 is
   port(I0,I1 : in std_logic_vector(15 downto 0);
	     seletor : in std_logic;    
      	Saida : out std_logic);
end component;

component Somador16bits is
  port ( X, Y : in  std_logic_vector(15 downto 0);
           ci : in std_logic;
            Q : out std_logic_vector(15 downto 0);
            cout : out std_logic);
end component;

component Timer is 
   port(Clock, CLR, en : in std_logic; 
      Q : out std_logic_vector(5 downto 0)); 
end component;

signal aux_sum_adr, aux_adr, aux_soma_adr, aux_temp : std_logic_vector(15 downto 0);
signal csum : std_logic  
signal aux_reg_tam, aux_reg_msg, aux_reg_tot, aux_reg_index, aux_reg_amostra : std_logic_vector(15 downto 0);
signal aux_sum_tam, aux_sum_msg, aux_sum_tot, aux_sum_index, aux_sum_amostra : std_logic_vector(15 downto 0); 
signal aux_index_gt_0, aux_msg_gt_tot, aux_msg_gt_tam, aux_index_eq_0, aux_msg_eq_tot, aux_amostra_eq_tam, aux_index_it_0, aux_msg_it_tot, aux_amostra_it_tam : std_logic; 
signal aux_msg_lt_1, aux_msg_eq_1, aux_msg_gt_1, aux_tam_lt_10, aux_tam_eq_10, aux_tam_gt_10, aux_tot_lt_25, aux_tot_eq_25, aux_tot_gt_25, aux_tam_lt_2048, aux_tam_eq_2048, aux_tam_gt_2048 : std_logic;
signal aux_temp_lt_2, aux_temp_eq_2, aux_temp_gt_2, aux_temp_lt_5, aux_temp_eq_5, aux_temp_gt_5, aux_temp_lt_60, aux_temp_eq_60, aux_temp_gt_60 : std_logic;
--signal aux_tam_msg, aux_msg_atual, aux_tot_msg, aux_amostra_atual, aux_index_msg

begin

mux_incremento_adr : mux2x1 port map(I0 => '0000000000000001', I1 => '0000100000000000', seletor => mux_adr_sum_s, Saida => aux_sum_adr);
soma_adr : somador16bits port map(X => aux_sum_adr, Y => aux_adr, ci => '0', Q => aux_soma_adr, cout => csum);

cont_temp : Timer port map(Clock => clk, CLR => temp_clr, en => temp_en, Q => aux_temp);

port_sum : bloco_sum port map(tam_msg => aux_reg_tam, msg_atual => aux_reg_msg, tot_msg => aux_reg_tot, index_msg => aux_reg_index, amostra_atual => aux_reg_amostra,
                              out_sum_tam => aux_sum_tam, out_sum_msg => aux_sum_msg, out_sum_tot => aux_sum_tot, out_sum_index => aux_sum_index, out_sum_amostra => aux_sum_amostra); 

port_comp : bloco_comp port map(tam_msg => aux_reg_tam, amostra_atual => aux_reg_amostra, tot_msg => aux_reg_tot, msg_atual => aux_reg_msg, index_msg => aux_reg_index, temp => aux_temp,
                                index_gt_0 => aux_index_gt_0, msg_gt_tot => aux_msg_gt_tot, amostra_gt_tam => aux_msg_gt_tam, index_eq_0 => aux_index_eq_0, msg_eq_tot => aux_msg_eq_tot,
										  amostra_eq_tam => aux_amostra_eq_tam, index_it_0 => aux_index_it_0, msg_it_tot => aux_msg_it_tot, amostra_it_tam => aux_amostra_it_tam,
										  msg_lt_1 => aux_msg_lt_1, msg_eq_1 => aux_msg_eq_1, msg_gt_1 => aux_msg_gt_1, tam_lt_10 => aux_tam_lt_10, tam_eq_10 => aux_tam_eq_10, tam_gt_10 => aux_tam_gt_10,
										  tot_lt_25 => aux_tot_lt_25, tot_gt_25=> aux_tot_gt_25, tam_lt_2048=> aux_tam_lt_2048, tam_eq_2048=> aux_tam_eq_2048, tam_gt_2048=> aux_tam_gt_2048
										  temp_lt_2 => aux_temp_lt_2, temp_eq_2=> aux_temp_eq_2, temp_gt_2=> aux_temp_gt_2, temp_lt_5 => aux_temp_lt_5, temp_eq_5=> aux_temp_eq_5, temp_gt_5=> aux_temp_gt_5
										  temp_lt_60 => aux_temp_lt_60, temp_eq_60=> aux_temp_eq_60, temp_gt_2=> aux_temp_gt_60);
										  
										  
port_reg : bloco_reg port map (
										 );										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  