---------------------------------------------------
-- Manoj Vishwanathan
-- Mini Project 1 (xnor) Test Bench		
-- Two input 
-- gate level and behavioural
----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity xnor_tb is
end xnor_tb;

architecture test of xnor_tb is 
signal a,b,f : std_logic;
begin
	dut: entity work.xnor_gate_two_input (behav1)
	port map (a=>a , b=>b , f=>f);
test_cases: process is
procedure testing (ain, bin : in std_logic) is
begin
a <= ain;
b <= bin;
wait for 1ms;
end procedure testing;
begin
testing('0','0');
testing('0','1');
testing('1','0');
testing('1','1'); 	 	
wait;
end process test_cases;
end architecture test;