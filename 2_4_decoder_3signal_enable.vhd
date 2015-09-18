library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_2_4_decoder_3signal is
end tb_2_4_decoder_3signal;

architecture tb of tb_2_4_decoder_3signal is
signal a: std_logic_vector (1 downto 0);
signal en: std_logic_vector (2 downto 0);
signal x: std_logic_vector (3 downto 0);
begin
dut: entity work.decode_2to4_enable(Behavioral_3signal)
	port map ( a=>A, x=>X, en=>EN);
test_cases: process is
begin
en <="100";wait for 5 ns;
a<= "00"; wait for 5 ns;
a<= "01"; wait for 5 ns;
a<= "10"; wait for 5 ns;
a<="11"; wait for 5 ns;
en <="001";wait for 5 ns;
a<= "00"; wait for 5 ns;
a<= "01"; wait for 5 ns;
a<= "10"; wait for 5 ns;
a<="11"; wait for 5 ns;

end process test_cases;
end architecture;

