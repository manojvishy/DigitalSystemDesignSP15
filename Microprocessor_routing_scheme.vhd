library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
port(	I2: 	in std_logic_vector(7 downto 0); --- Output from bypass block
	I1: 	in std_logic_vector(7 downto 0); --- Output from arithmetic block
	I0: 	in std_logic_vector(7 downto 0); --- Output from logic block
	S:	in std_logic_vector(3 downto 0); --- Instruction top 4 bits
	O:	out std_logic_vector(7 downto 0) --- Output to accumulator
);
end decoder;  

-------------------------------------------------

architecture behv1 of decoder is
begin
    process(S)
    begin
   
        -- use case statement
        case S is
	    when "0011" =>	O <= I0;	--logic
	    when "0100" =>	O <= I0;	--logic
	    when "0010" =>	O <= I0;	--logic
	    when "1110" =>	O <= I0;	--logic
	    when "1010" =>	O <= I1;	--Arithmetic
	    when "1011" =>	O <= I1;	--Arithmetic
	    when "1100" =>	O <= I1;	--Arithmetic
	    when "1111" =>	O <= I2;	--Bypass
	when others =>	O <= "ZZZZZZZZ";
	end case;

    end process;
end behv1;

