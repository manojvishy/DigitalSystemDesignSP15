---------------------------------------------------
-- Manoj Vishwanathan
-- Mini Project 1 (NAND)
-- Four input 
-- gate level and behavioural
----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity nand_four_input is

port(a , b , c, d : in std_logic;f: out std_logic  );
end nand_four_input;

architecture behav1 of nand_four_input is

component nand_gate_two_input is
port ( a,b : in std_logic ; 
	f: out std_logic); 
end component nand_gate_two_input;

signal out1,out2,final_out : std_logic;
begin
nand1: nand_gate_two_input port map (a,b,out1);
nand2: nand_gate_two_input port map (c,d,out2);
nand3: nand_gate_two_input port map (out1,out2,final_out);
end architecture behav1;

architecture behav2 of nand_four_input is
begin
	f <= not(a AND b  AND c AND d);
end behav2; 