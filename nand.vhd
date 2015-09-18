---------------------------------------------------
-- Manoj Vishwanathan
-- Mini Project 1 (NAND)
-- Two input 
-- gate level and behavioural
----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity nand_gate_two_input is
	port(a , b : in std_logic;f: out std_logic  );
end  nand_gate_two_input	;

architecture nand_behav1 of nand_gate_two_input is
begin 
	f <= a nand b;
end architecture nand_behav1;

architecture nand_behav2 of  nand_gate_two_input is 
begin

    process(a, b)
    begin
        -- compare to truth table
        if (a='1' and b='1') then
	    f <= '0';
	else
	    f <= '1';
	end if;
    end process;
end nand_behav2;
