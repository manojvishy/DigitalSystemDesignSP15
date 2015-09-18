---------------------------------------------------
-- Manoj Vishwanathan
-- Mini Project 1 (NAND)
-- Four bit and Three input
-- gate level and behavioural
----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity nand_4bit_3input is

port(a , b , c : in std_logic_vector (3 downto 0);
	f: out std_logic  );
end nand_4bit_3input;

architecture behav1 of nand_4bit_3input is

component nand_gate_two_input is
port ( a,b : in std_logic ; 
	f: out std_logic); 
end component nand_gate_two_input;

signal out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,final_out : std_logic;
begin
nand1: nand_gate_two_input port map (a(0),b(0),out1);
nand2: nand_gate_two_input port map (out1,c(0),out2);
nand3: nand_gate_two_input port map (a(1),b(1),out3);
nand4: nand_gate_two_input port map (out3,c(1),out4);
nand5: nand_gate_two_input port map (a(2),b(2),out5);
nand6: nand_gate_two_input port map (out5,c(2),out6);
nand7: nand_gate_two_input port map (a(3),b(3),out7);
nand8: nand_gate_two_input port map (out7,c(3),out8);
nand9: nand_gate_two_input port map (out2,out4,out9);
nand10: nand_gate_two_input port map (out6,out8,out10);
nand11: nand_gate_two_input port map (out8,out10,final_out);
end architecture behav1;

architecture behav2 of nand_4bit_3input is
begin
	f <= not(a(0) AND b(0) AND a(1) AND b(1)  AND a(2) AND b(2) AND a(3) AND b(3));
end behav2; 