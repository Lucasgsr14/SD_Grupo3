library ieee;
use ieee.std_logic_1164.all;

entity bloco_reg is
    port (ram_data_out : in std_logic_vector(15 downto 0);
	       out_sum_tam, out_sum_msg, out_sum_tot, out_sum_index, out_sum_amostra, AD, out_sum_addr : in std_logic_vector(15 downto 0);
			 clk, tam_msg_ld, tam_msg_clr, mux_tam_s, index_ld, mux_index_s, tot_msg_clr, tot_msg_ld, mux_tot_s, addr_ld, addr_clr : in std_logic;
			 msg_atual_ld, msg_atual_clr, mux_atual_s, aux_begin_addr_ld, amostra_atual_ld, amostra_atual_clr : in std_logic;
			 data_ld, da_ld, da_clr, ram_rw_ld, ram_rw_clr, ram_en_clr, ram_en_ld, flag_rt_clr, flag_rt_ld, mux_addr_s : in std_logic;
			 mux_data_s : in std_logic_vector(1 downto 0);
			 reg_tam, reg_msg, reg_tot, reg_index, reg_amostra, reg_rw, reg_data, reg_addr, reg_begin, reg_flag, reg_da, reg_en : out std_logic_vector(15 downto 0));
end bloco_reg;

architecture ckt of bloco_reg is

component Registrador16bits is
  port (X : in  std_logic_vector (15 downto 0);
        ld, clr, clk : in std_logic;
        Q : out std_logic_vector (15 downto 0));
end component;

component mux21 is
   port(I0,I1 : in std_logic_vector(15 downto 0);
	     seletor : in std_logic;    
      	Saida : out std_logic_vector(15 downto 0));
end component;

component mux3x1 is
   port(A0,A1,A2 : in std_logic_vector(15 downto 0);
	     sel : in std_logic_vector(1 downto 0);    
      	Z : out std_logic_vector(15 downto 0));
end component;

signal aux_tam_msg, aux_reg_tam, aux_index, aux_reg_index, aux_tot, aux_reg_tot, aux_msg, aux_reg_msg, aux_reg_addr : std_logic_vector(15 downto 0);
signal aux_reg_rw, aux_reg_amostra, aux_data, aux_reg_data, aux_reg_da, aux_reg_en, aux_reg_flag, aux_reg_begin, aux_mux_addr : std_logic_vector(15 downto 0);

begin

mux_tam : mux21 port map(I0 => out_sum_tam, I1 => ram_data_out, seletor => mux_tam_s, Saida => aux_tam_msg);
reg_tam1 : registrador16bits port map(X => aux_tam_msg, ld=> tam_msg_ld, clr => tam_msg_clr, clk => clk, Q => aux_reg_tam);


mux_index : mux21 port map(I0 => aux_reg_msg, I1 => out_sum_index, seletor => mux_index_s, Saida => aux_index);
reg_index1 : registrador16bits port map(X => aux_index, ld => index_ld, clr => '0', clk => clk, Q=> aux_reg_index);

mux_tot : mux21 port map(I0 => ram_data_out, I1 => out_sum_tot, seletor => mux_tot_s, Saida => aux_tot);
reg_tot1 : registrador16bits port map(X => aux_tot, ld => tot_msg_ld, clr => tot_msg_clr, clk => clk, Q => aux_reg_tot);

mux_atual : mux21 port map(I0 => aux_reg_tot, I1 => out_sum_msg, seletor => mux_atual_s, Saida => aux_msg);
reg_atual1 : registrador16bits port map(X => aux_msg, ld => msg_atual_ld, clr => msg_atual_clr, clk => clk, Q => aux_reg_msg);

reg_ram_rw : registrador16bits port map(X => "0000000000000001", ld => ram_rw_ld, clr => ram_rw_clr, clk => clk, Q => aux_reg_rw);

reg_amostra1 : registrador16bits port map(X => out_sum_amostra, ld => amostra_atual_ld, clr => amostra_atual_clr, clk => clk, Q => aux_reg_amostra);

mux_data : mux3x1 port map(A0 => AD, A1 => aux_reg_tam, A2 => aux_reg_tot, sel => mux_data_s, Z => aux_data);
reg_data1 : registrador16bits port map(X => aux_data, ld => data_ld, clr => '0', clk => clk, Q => aux_reg_data);

reg_da1 : registrador16bits port map(X => ram_data_out, ld => da_ld, clr => da_clr, clk => clk, Q => aux_reg_da);

reg_ram_en1 : registrador16bits port map(X => "0000000000000001", ld => ram_en_ld, clr => ram_en_clr, clk => clk, Q => aux_reg_en);

reg_flag1 : registrador16bits port map(X => "0000000000000001", ld => flag_rt_ld, clr => flag_rt_clr, clk => clk, Q => aux_reg_flag);

reg_aux_addr1 : registrador16bits port map(X => aux_reg_addr, ld => aux_begin_addr_ld, clr => '0', clk => clk, Q => aux_reg_begin);

mux_addr1 : mux21 port map(I0 => aux_reg_begin, I1 => out_sum_addr, seletor => mux_addr_s, Saida => aux_mux_addr);
reg_addr1 : registrador16bits port map(X => aux_mux_addr, ld => addr_ld, clr => addr_clr, clk => clk, Q => aux_reg_addr);

reg_tam <= aux_reg_tam;
reg_addr <= aux_reg_addr;
reg_msg <= aux_reg_msg;
reg_da <= aux_reg_da;
reg_data <= aux_reg_data; 
reg_rw <= aux_reg_rw;
reg_amostra <= aux_reg_amostra;
reg_en <= aux_reg_en;
reg_flag <= aux_reg_flag;
reg_index <= aux_reg_index;
reg_begin <= aux_reg_begin;
reg_tot <= aux_reg_tot;

end ckt;




