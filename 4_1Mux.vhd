-------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------

entity Mux is
port(	I3: 	in std_logic;
	I2: 	in std_logic;
	I1: 	in std_logic;
	I0: 	in std_logic;
	S:	in std_logic_vector(1 downto 0);
	O:	out std_logic
);
end Mux;  

-------------------------------------------------

architecture behv1 of Mux is
begin
    process(S)
    begin
    
        -- use case statement
        case S is
	    when "00" => O <= I0;
	    when "01" => O <= I1;
	    when "10" => O <= I2;
	    when "11" => O <= I3;
	    when others => O <= 'Z';
	end case;

    end process;
end behv1;

--architecture behv2 of Mux is
--begin
--
--    -- use when.. else statement
--    O <=	I0 when S="00" else
--		I1 when S="01" else
--		I2 when S="10" else
--		I3 when S="11" else
--		'Z';
--
--end behv2;
