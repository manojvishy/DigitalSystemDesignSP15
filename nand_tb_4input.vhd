---------------------------------------------------
-- Manoj Vishwanathan
-- Mini Project 1 (NAND) Test Bench		
-- gate behavioural and 
--  4 input a,b,c,d
----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity nand_tb_4input is
end nand_tb_4input;

architecture test of nand_tb_4input is 
signal a,b,c,d,f : std_logic;
signal input_value : std_logic_vector (3 downto 0) :="0000";
begin
	dut: entity work.nand_four_input(behav2)
	port map (a=>a , b=>b ,c=>c , d=>d, f=>f);
test_cases: process is
procedure testing (ain, bin, cin, din : in std_logic) is
begin
a <= ain;
b <= bin;
c <= cin;
d <= din;
wait for 1ms;
end procedure testing;
begin
for i in 0 to 16 loop 
testing(input_value(3),input_value(2),input_value(1),input_value(0));
input_value <= input_value + "0001"; 	 	
end loop;
wait;
end process test_cases;
end architecture test; 
