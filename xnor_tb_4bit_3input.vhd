---------------------------------------------------
-- Manoj Vishwanathan
-- Mini Project 1 (xnor) Test Bench		
-- gate behavioural and 
--  4 input a,b,c,d
----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity xnor_tb_4bit is
end xnor_tb_4bit;

architecture test of xnor_tb_4bit is 
signal a,b,c: std_logic_vector (3 downto 0);
signal f : std_logic;
signal input1,input2,input3: std_logic_vector (3 downto 0) :="0000"; 
begin
	dut: entity work.xnor_4bit_3input(behav2)
	port map (a=>a , b=>b ,c=>c , f=>f);
test_cases: process is
procedure testing (ain, bin, cin: in std_logic_vector (3 downto 0)) is
begin
a <= ain;
b <= bin;
c <= cin;
wait for 1ms;
end procedure testing;
begin
for i in 0 to 16 loop 
	for x in 0 to 16 loop
		for y in 0 to 16 loop
		testing(input1,input2,input3);
		input3 <= input3 + "0001";
		end loop;
	input2 <= input2+ "0001";
	end loop;
input1 <= input1 + "0001";
end loop;
wait;
end process test_cases;
end architecture test; 
