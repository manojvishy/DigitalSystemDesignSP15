-------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------

entity Mux2 is
port(	I1: 	in std_logic;
	I0: 	in std_logic;
	S:	in std_logic;
	O:	out std_logic
);
end Mux2;  

-------------------------------------------------

architecture behv1 of Mux2 is
begin
    process(I1,I0,S)
    begin
    
        -- use case statement
        case S is
	    when '0' =>	O <= I0;
	    when '1' =>	O <= I1;
	 when others =>	O <= 'Z';
	end case;

    end process;
end behv1;

