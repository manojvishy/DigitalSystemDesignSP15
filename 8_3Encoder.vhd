--
---------------------------------------------------------------------------------
----
---- Title       : 8_3Encoder
---- Author      : Manoj Vishwanathan
----
---------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use ieee.numeric_std.all;

entity priority_encoder_8_3 is
     port(
         din : in STD_LOGIC_VECTOR(7 downto 0);
         dout : out STD_LOGIC_VECTOR(2 downto 0);
         valid : out std_logic
);
end priority_encoder_8_3;


architecture priority_enc_arc of priority_encoder_8_3 is
begin
    
dout <= "000" when din(7)='1' else
        "001" when din(6)='1'else
        "010" when din(5)='1' else
        "011" when din(4)='1' else
        "100" when din(3)='1' else
        "101" when din(2)='1' else
        "110" when din(1)='1' else
        "111" when din(0)='1';
valid <= '1' when din="10000000" else
         '1' when din="01000000" else
         '1' when din="00100000" else
         '1' when din="00010000" else
         '1' when din="00001000" else
         '1' when din="00000100" else
         '1' when din= "00000010" else
         '1' when din="00000001" else
	 '0'	;
    

end priority_enc_arc;
