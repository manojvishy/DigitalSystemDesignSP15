library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_2_4_decoder is
end tb_2_4_decoder;

architecture tb of tb_2_4_decoder is
signal a: std_logic_vector (1 downto 0);
signal en: std_logic;
signal x: std_logic_vector (3 downto 0);
begin
dut: entity work.decode_2to4(Behavioral)
	port map ( a=>A, x=>X, en=>EN);
test_cases: process is
begin
en <='1';
a<= "00"; wait for 5 ns;
a<= "01"; wait for 5 ns;
a<= "10"; wait for 5 ns;
a<="11"; wait for 5 ns;

end process test_cases;
end architecture;

