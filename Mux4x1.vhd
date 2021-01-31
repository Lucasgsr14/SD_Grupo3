entity mux4x1 is
   port(A0,A1,A2,A3 : in bit_vector(16 downto 0);
	     sel : in bit_vector(1 downto 0);    
      	Z : out bit_vector(16 downto 0));

end mux4x1;

architecture ARKMUX of mux4x1 is
  
     begin
	with sel select
  	Z<= A0 when "00",
	    A1 when "01",
	    A2 when "10",
	    A3 when others;
end ARKMUX;
        

