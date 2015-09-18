---------------------------------------------------
-- Manoj Vishwanathan
-- Mini Project 1 (XNOR)
-- Two input 
-- gate level and behavioural
----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity xnor_gate_two_input is 
port(a,b : in std_logic; 
	f: out std_logic);
end xnor_gate_two_input;

architecture behav1 of xnor_gate_two_input is
begin 
	process(a,b)
		begin 
		if (a=b) then
		f <= '1';
		else 
		f <= '0';
		end if;
	end process;

end behav1;

architecture behav2 of xnor_gate_two_input is
begin	
f <= a xnor b;
end behav2;