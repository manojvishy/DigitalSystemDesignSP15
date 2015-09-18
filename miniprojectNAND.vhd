library ieee;
use ieee.std_logic_1164.all;

entity nand_gate is
	port(a , b : in std_logic;f: out std_logic  );
end  nand_gate	;

architecture nand_arch of nand_gate is
begin 
	f = a nand b;
end architecture nand_arch;

