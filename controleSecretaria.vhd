library ieee;
use ieee.std_logic_1164.all;

entity controle is
  port (clk, on, play, back, next, temp_lt_60, msg_gt_0, temp_gt_60, new_msg, tot_lt_25, temp_lt_2, temp_gt_5, temp_gt_2, temp_lt_5,
        msg_lt_tot, msg_gt_1, index_gt_0, index_eq_0, ram_rw,  tam_msg_lt_11, tam_msg_lt_10485, tam_msg_gt_10, tam_msg_gt_10484,
		  amostra_lt_tam, flag_rt,  msg_gt_tot, msg_lt_tam, msg_eq_tam  : in bit;
        temp_clr, display_en, addr_clr, tot_msg_ld, ram_rw, ram_en, mux_tot_s, msg_atual_ld, temp_en, mux_atual_s, flag_rt, msg_atual_clr,
		  index_ld, mux_index_s, ram_rw_ld, tot_msg_clr, ram_rw_clr, addr_ld, tam_msg_ld, mux_tam_s, amostra_clr, tam_msg_clr, aux_addr_ld,
		  dta_ld, mux_addr_ld, da_clr, da_ld, amostra_ld, : out bit);
end controle;

architecture ckt of controle is
  type state_type is (Desligado, transicaoInicial, Inicial, reproducaoTotal, Repouso, onPress2, onPress, Desligado2, Salvar, addr1, Reset,
                      Next, Back, Navegacao, reproducaoIndividual, msg1, clearAddr, Intermed, somaAddr, esc1, esc2, Grava, fimGrava, endrTot,
							 tamMsg, ler1, condicionalReproducao, Pause, Ler, incrementoReproducao, msg++);
  signal estado : state_type;
  begin
   
	with estado select     
   temp_clr <= '1' when Desligado, Repouso, onPress2, Reset;
           '0' when others;
			  
  
  process (clk,r)
    begin
      if r = '0' then 
        y_present <= a;
      elsif (clk'event and clk = '1') then
        y_present <= y_next;
    end if;
  end process;
  z <= '1' when y_present = c else '0';
end ckt;