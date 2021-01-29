entity mux2x1 is
   port(I0,I1 : in bit;
	     seletor : in bit;    
      	Saida : out bit);

end mux2x1;

architecture ARKMUX of mux2x1 is
  
     begin
      
	Saida<=(IO and (not seletor)) or (I1 and seletor);
    
end ARKMUX;
        

