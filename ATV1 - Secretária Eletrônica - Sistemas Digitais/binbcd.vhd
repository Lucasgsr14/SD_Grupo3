library ieee;
use ieee.std_logic_1164.all;


entity conv_bin_bcd is

  port( SW : in std_logic_vector(7 downto 0);

        HEX2 : out std_logic_vector(6 downto 0);

        HEX1 : out std_logic_vector(6 downto 0);

        HEX0 : out std_logic_vector(6 downto 0));

        

end conv_bin_bcd;



architecture bin_bcd of conv_bin_bcd is

  

  component conversor_somador

     port ( A : in std_logic_vector(3 downto 0);

            S : out std_logic_vector(3 downto 0));

  end component;

  

  component bcd_display 

    port( X : in std_logic_vector(3 downto 0);

          D : out std_logic_vector(0 to 6));



  end component;

  

  signal m1,m2,m3,m4,m5 : std_logic_vector(3 downto 0);

  signal bcd : std_logic_vector(11 downto 0);

  

  begin 

    

     bloco1 : conversor_somador port map(A(3) => '0', A(2) => SW(7), A(1) => SW(6), A(0) => SW(5),

                            S(3) => m1(3), S(2) => m1(2), S(1) => m1(1), S(0) => m1(0));

     bloco2 : conversor_somador port map(A(3) => m1(2), A(2) => m1(1), A(1) => m1(0), A(0) => SW(4),

                            S(3) => m2(3), S(2) => m2(2), S(1) => m2(1), S(0) => m2(0));

     bloco3 : conversor_somador port map(A(3) => m2(2), A(2) => m2(1), A(1) => m2(0), A(0) => SW(3),

                            S(3) => m3(3), S(2) => m3(2), S(1) => m3(1), S(0) => m3(0));

     bloco4 : conversor_somador port map(A(3) => '0', A(2) => m1(3), A(1) => m2(3), A(0) => m3(3),

                            S(3) => m4(3), S(2) => m4(2), S(1) => m4(1), S(0) => m4(0));

     bloco5 : conversor_somador port map(A(3) => m3(2), A(2) => m3(1), A(1) => m3(0), A(0) => SW(2),

                            S(3) => m5(3), S(2) => m5(2), S(1) => m5(1), S(0) => m5(0));

     bloco6 : conversor_somador port map(A(3) => m4(2), A(2) => m4(1), A(1) => m4(0), A(0) => m5(3),

                            S(3) => bcd(8), S(2) => bcd(7), S(1) => bcd(6), S(0) => bcd(5));

     bloco7 : conversor_somador port map(A(3) => m5(2), A(2) => m5(1), A(1) => m5(0), A(0) => SW(1),

                            S(3) => bcd(4), S(2) => bcd(3), S(1) => bcd(2), S(0) => bcd(1));

       

     bcd(9) <= m4(3);

     bcd(11) <= '0';

     bcd(10) <= '0';

     bcd(0) <= SW(0);

     

      CENTENA : bcd_display port map(X => bcd(11 downto 8), D =>  HEX2);

      DEZENA : bcd_display port map(X => bcd(7 downto 4), D =>  HEX1);

      UNIDADE : bcd_display port map(X => bcd(3 downto 0), D =>  HEX0);

     

end bin_bcd;