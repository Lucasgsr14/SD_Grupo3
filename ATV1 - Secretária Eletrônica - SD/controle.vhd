library ieee;
use ieee.std_logic_1164.all;

entity controleSecretaria is
  port (clk, on1, play, back1, next1, temp_lt_60, temp_gt_60, new_msg, tot_lt_25, temp_lt_2, temp_gt_5, temp_gt_2, temp_lt_5,
        msg_lt_tot, msg_gt_1, index_gt_0, index_eq_0, ram_rw,  tam_msg_lt_11, tam_msg_lt_10484, tam_msg_gt_10, tam_msg_gt_10484,
		  amostra_lt_tam, flag_rt,  msg_gt_tot, reset1, amostra_gt_tam, msg_eq_1  : in std_logic;
        temp_clr, display_en, addr_clr, tot_msg_ld, ram_en_clr, ram_en_ld, mux_tot_s, msg_atual_ld, temp_en, mux_atual_s, msg_atual_clr,
		  index_ld, mux_index_s, ram_rw_ld, tot_msg_clr, ram_rw_clr, addr_ld, tam_msg_ld, mux_tam_s, amostra_clr, tam_msg_clr, aux_addr_ld,
		  data_ld, mux_addr_ld_s, da_clr, da_ld, amostra_ld, flag_rt_ld, flag_rt_clr, Led_O, Led_P, Led_R, mux_adr_sum_s : out std_logic;
		  mux_data_s : out std_logic_vector(1 downto 0));
end controleSecretaria;

architecture ckt of controleSecretaria is
  type state_type is (Init, Desligado, transicaoInicial, Inicial, reproducaoTotal, Repouso, onPress2, onPress, Desligado2, Salvar, addrG, addrL, Reset,
                      NextE, BackE, Navegacao, reproducaoIndividual, msg1, clearAddr, IntermedG, intermedL, somaAddrG, somaaddrL, esc1, esc2, Grava,
							 fimGrava, endrTot, tamMsg, ler1, condicionalReproducao, Pause, Ler, incrementoReproducao, msg2);
  signal estado : state_type;
  begin
   
	with estado select     
   temp_clr <= '1' when Desligado, '1' when Repouso, '1' when onPress2, '1' when Reset, '1' when BackE, '1' when NextE,
           '0' when others;
	
	with estado select
	display_en <= '0' when Desligado, '0' when Desligado2, '0' when transicaoInicial, '0' when Repouso, '0' when Salvar, '0' when addrG, 
	              '0' when intermedG, '0' when somaAddrG, '0' when esc1, '0' when esc2, '0' when Grava, '0' when fimGrava, '0' when endrTot,
                 '1' when others;
					 
	with estado select
   addr_clr <= '1' when Salvar, '1' when Desligado, '1' when Reset, '1' when clearAddr, '1' when endrTot,
               '0' when others;
					
	with estado select
	tot_msg_ld <= '1' when fimGrava, '1' when transicaoInicial,
	              '0' when others;
					  
	with estado select
	ram_en_clr <= '1' when Inicial, '1' when Repouso,
	              '0' when others;
	
	with estado select
	mux_tot_s <= '1' when transicaoInicial,
	             '0' when others;
	
	with estado select
	msg_atual_ld <= '1' when BackE, '1' when NextE, '1' when Inicial, '1' when Repouso, '1' when msg1, '1' when msg2,
                   '0' when others;
	
   with estado select
   temp_en <= '1' when Inicial, '1' when onPress, '1' when navegacao,
              '0' when others;
				 
	with estado select
   mux_atual_s <= '1' when Inicial, '1' when Repouso,
                  '0' when others; 
	
   with estado select
   msg_atual_clr <= '1' when reproducaoTotal,
                    '0' when others;
	
   with estado select
   index_ld <= '1' when reproducaoIndividual, '1' when Salvar, '1' when clearAddr, '1' when somaAddrG, '1' when somaaddrL,
               '0' when others;
	
   with estado select
   mux_index_s <= '1' when Salvar, '1' when reproducaoIndividual,
                  '0' when others;
	
   with estado select
   tot_msg_clr <= '1' when Reset,
                  '0' when others;
	
   with estado select
   addr_ld <= '1' when addrG, '1' when addrL, '1' when somaAddrG, '1' when somaaddrL, '1' when esc2, '1' when fimGrava, 
	           '1' when incrementoReproducao, '1' when  ler1,
              '0' when others;	
				  
	with estado select
	tam_msg_ld <= '1' when tamMsg, '1' when Grava,
	              '0' when others;
					  
	with estado select
	mux_tam_s <= '0' when tamMsg,
	             '1' when others;
					 
	with estado select
	amostra_clr <= '1' when tamMsg,
	               '0' when others;
						
	with estado select
	tam_msg_clr <= '1' when esc1,
	               '0' when others;
						
	with estado select
	aux_addr_ld <= '1' when esc1,
	               '0' when others;
						
	with estado select
	data_ld <= '1' when Grava, '1' when endrTot,
	           '0' when others;
				  
	with estado select
	mux_addr_ld_s <= '1' when fimGrava,
	                 '0' when others;
						  
	with estado select
	da_clr <= '1' when Pause, '1' when condicionalReproducao,
	          '0' when others;
	
	with estado select 
	da_ld <= '1' when ler,
	         '0' when others;
	
	with estado select
	amostra_ld <= '1' when incrementoReproducao,
	              '0' when others;
					  
	with estado select
	flag_rt_ld <= '1' when Inicial,
	              '0' when others;
	
	with estado select
	flag_rt_clr <= '1' when navegacao,
	               '0' when others;
						
	with estado select
	ram_rw_ld <= '1' when Salvar,
	             '0' when others;
	
	with estado select
	ram_en_ld <= '1' when  transicaoInicial, '1' when tamMsg, '1' when Grava, '1' when fimGrava, '1' when endrTot, '1' when ler, '1' when Reset,
	             '0' when others;
	
	with estado select
	ram_rw_clr <= '1' when transicaoInicial, '1' when reproducaoIndividual, '1' when Repouso,
	              '0' when others;
	
	with estado select
	Led_O <= '0' when Init, '0' when Desligado, '0' when Desligado2,
	         '1' when others;
				
	with estado select
	Led_R <= '1' when Salvar, '1' when addrG, '1' when intermedG, '1' when somaAddrG, '1' when esc1, '1' when esc2, '1' when Grava, 
	         '1' when fimGrava, '1' when endrTot,
	         '0' when others;
	
	with estado select 
	Led_P <= '1' when reproducaoTotal, '1' when msg1, '1' when reproducaoIndividual, '1' when addrL, '1' when clearAddr, '1' when intermedL, 
	         '1' when somaaddrL, '1' when tamMsg, '1' when ler1, '1' when Pause, '1' when ler, '1' when incrementoReproducao,
	         '1' when condicionalReproducao, '1' when msg2,
				'0' when others;
				
   with estado select
	mux_adr_sum_s <= '1' when esc2, '1' when incrementoReproducao, '1' when ler1, '1' when addrG, '1' when addrL,
	               '0' when others;
	
	with estado select
	mux_data_s <= "01" when fimGrava, 
	              "00" when Grava,
					  "10" when others; 
				
  
  abc : process (clk , reset1)
begin
  if reset1 = '1' then
    estado <= Init;
  elsif ( clk'event and clk = '1') then 
   case estado is

        when Init =>
           estado <= Desligado;
          
         
	 when Desligado  => 
       
        if (on1 = '0') then estado <= Desligado;
	elsif (on1 = '1') then estado <= transicaoInicial;
          end if;

	when transicaoInicial =>
           estado <= Inicial;

	when Inicial  =>
	     
        if (play = '1' and (msg_gt_1 = '1' or msg_eq_1 = '1')) then estado <= reproducaoTotal;
	elsif (on1 = '1' and temp_lt_60 = '1' ) then estado <= onPress2;
	elsif (temp_gt_60 = '1' and on1 = '0' ) then estado <= Repouso;
	elsif ((back1 = '1' or next1 = '1') and (msg_gt_1 = '1' or msg_eq_1 = '1') ) then estado <= Navegacao;
	elsif (play = '0' and next1 = '0' and back1 = '0' and temp_lt_60 = '1') then estado <= Inicial;
          end if;
			 
	when onPress2 =>
	        estado <= onPress;
			  
	when onPress  => 
       
        if (temp_gt_5 = '1' ) then estado <= desligado2;
	elsif (on1 = '0' and temp_gt_2 = '1' and temp_lt_5 = '1') then estado <= Reset;
	elsif (on1 = '0' and temp_lt_2 = '1') then estado <= Repouso;
	elsif (on1 = '1') then estado <= onPress;
          end if;	
	
   when desligado2 =>
	
	       if (on1 = '0') then estado <= desligado;
	elsif (on1 = '1') then estado <= desligado2;
			 end if;
			  
	when Repouso  => 
       
        if (new_msg = '1' and tot_lt_25 = '1') then estado <= Salvar;
	elsif (on1 = '1') then estado <= Inicial;
	elsif (on1 = '0' and new_msg = '0') then estado <= Repouso;
          end if;	
	
	when reset =>
	     estado <= Inicial;

        
	 when salvar  => 
           estado <= addrG;	
	
    when addrG =>
	        estado <= intermedG;
	
    when intermedG =>
	        
			if (index_gt_0 = '1') then estado <= somaAddrG;
	 elsif (index_eq_0 = '1') then estado <= esc1;
	      end if;
			 
	 when somaAddrG =>
	        estado <= intermedG;
			  
	 when esc1 =>
	        estado <= esc2;
	
	 when esc2 =>
	        estado <= Grava;
			  
	 when Grava =>
	        
			if ((new_msg = '1' or tam_msg_lt_11 = '1') and tam_msg_lt_10484 = '1') then estado <= esc2;
	 elsif ((new_msg = '0' and tam_msg_gt_10 = '1') or tam_msg_gt_10484 = '0') then estado <= fimGrava;
         end if;	
		
	 when fimGrava =>
	      estado <= endrTot;
		
	 when endrTot =>
	      estado <= repouso;
		
	 when navegacao =>
	 
	      if (next1 = '1' and msg_lt_tot = '1') then estado <= nextE;
	 elsif (back1 = '1' and msg_gt_1 = '1') then estado <= backE;
	 elsif (play = '1') then estado <= reproducaoIndividual;
	 elsif (on1 = '1' or temp_gt_60 = '1') then estado <= repouso;
	 elsif (play = '0' and next1 = '0' and back1 = '0' and on1 = '0' and temp_lt_60 = '1') then estado <= navegacao;
	      end if;
		
	when nextE =>
        estado <= navegacao;
	
   when backE =>
        estado <= navegacao;
		 
	when reproducaoTotal =>
        estado <= msg1;
		 
   when msg1 =>
        estado <= reproducaoIndividual;
		 
	when reproducaoIndividual =>
        estado <= clearAddr;
		 
	when clearAddr =>
        estado <= addrL;
		 
	when addrL =>
        estado <= intermedL;
		 
	when intermedL =>
	        
			if (index_gt_0 = '1') then estado <= somaAddrL;
	 elsif (index_eq_0 = '1') then estado <= tamMsg;
	      end if;
			 
	 when somaAddrL =>
	      estado <= intermedL; 
			  
	 when tamMsg =>
	      estado <= ler1;
		
	 when ler1 =>
	      estado <= condicionalReproducao;
		
	 when condicionalReproducao =>
	      
		   if (play = '1') then estado <= Pause;
	 elsif (play = '0' and amostra_lt_tam = '1') then estado <= ler;
	 elsif (amostra_gt_tam = '1' and flag_rt = '0') then estado <= navegacao;
	 elsif (amostra_gt_tam = '1' and flag_rt = '1') then estado <= msg2;
	     end if;
		  
	when Pause =>
	     if (play = '1') then estado <= condicionalReproducao;
	elsif (play = '0' and on1 = '0') then estado <= Pause;
	elsif (play = '0' and (on1 = '1' or temp_gt_60 = '1')) then estado <= repouso;
	     end if;
		  
	when ler =>
	     estado <= incrementoReproducao;
		  
	when incrementoReproducao =>
	     estado <= condicionalReproducao;
		  
	when msg2 =>
	     if (msg_gt_tot = '0') then estado <= reproducaoIndividual;
	elsif (msg_gt_tot = '1') then estado <= inicial;
	     end if;
		  		  

end case ;
end if;
end process abc ;
end ckt ;