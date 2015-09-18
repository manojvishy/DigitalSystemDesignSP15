
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_tb is
end decoder_tb;

architecture tb of decoder_tb is

signal I2,I1,I0,O : std_logic_vector(7 downto 0);
signal S: std_logic_vector(3 downto 0);

begin
mapping: entity work.decoder(behv1) port map (I2=>I2,I1=>I1,I0=>I0,S=>S,O=>O);
process
begin
I2<="11001100";
I1<="10101010";
I0<="00110011";
S <= "0011";wait for 5 ns;
S <= "0100";wait for 5 ns;
S <= "1110";wait for 5 ns;
S <= "1010";wait for 5 ns;
S <= "1011";wait for 5 ns;
S <= "0011";wait for 5 ns;
S <= "1100";wait for 5 ns;
S <= "1111";wait for 5 ns;
S <= "0000";wait for 5 ns;
end process;
end architecture;

