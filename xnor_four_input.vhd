---------------------------------------------------
-- Manoj Vishwanathan
-- Mini Project 1 (XNOR)
-- Four input 
-- gate level and behavioural
----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity xnor_four_input is

port(a , b , c, d : in std_logic;f: out std_logic  );
end xnor_four_input;

architecture behav1 of xnor_four_input is

component xnor_gate_two_input is
port ( a,b : in std_logic ; 
	f: out std_logic); 
end component xnor_gate_two_input;

signal out1,out2,final_out : std_logic;
begin
xnor1: xnor_gate_two_input port map (a,b,out1);
xnor2: xnor_gate_two_input port map (c,d,out2);
xnor3: xnor_gate_two_input port map (out1,out2,final_out);
end architecture behav1;

architecture behav2 of xnor_four_input is
begin
	f <= a xnor b xnor c xnor d;
end architecture behav2;

