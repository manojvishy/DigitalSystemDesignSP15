library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use ieee.numeric_std.all;

entity encoder_8_3 is
end encoder_8_3;

architecture tb of encoder_8_3 is
signal din : std_logic_vector (7 downto 0);
signal dout : std_logic_vector (2 downto 0);
signal valid : std_logic;
begin
dut: entity work.priority_encoder_8_3(priority_enc_arc) 
	port map (din =>din,dout=>dout,valid =>valid);
test_cases: process is
begin
din <= "10000000"; wait for 5 ns;
din <= "01000000"; wait for 5 ns;
din <= "00100000"; wait for 5 ns;
din <= "00010000"; wait for 5 ns;
din <= "00001000"; wait for 5 ns;
din <= "00000100"; wait for 5 ns;
din <= "00000010"; wait for 5 ns;
din <= "00000001"; wait for 5 ns;
din <= "01001001"; wait for 5 ns;
end process test_cases;

end architecture tb;


	
