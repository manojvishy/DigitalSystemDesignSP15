library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode_2to4 is
    Port ( A  : in  STD_LOGIC_VECTOR (1 downto 0);  -- 2-bit input
           X  : out STD_LOGIC_VECTOR (3 downto 0);  -- 4-bit output
           EN : in  STD_LOGIC);                     -- enable input
end decode_2to4;

architecture Behavioral of decode_2to4 is
begin
process (A)
begin
    X <= "1111";        -- default output value
    if (EN = '1') then  -- active high enable pin
        case A is
            when "00" => X <= "0111";
            when "01" => X <= "1011";
            when "10" => X <= "1101";
            when "11" => X <= "1110";
            when others => X <= "1111";
        end case;
    end if;
end process;
end Behavioral;

Architecture gate_level_low of decode_2to4 is 
begin 
process (A)
begin
if (EN = '1') then
X(0) <= not((not (A(0)) )  AND (not (A(1)) ));
X(1) <= not((not (A(0)) )  AND ( (A(1)) ));
X(2) <= not(( (A(0)) )  AND (not (A(1)) ));
X(3) <= not(((A(0)) )  AND ((A(1)) ));
end if;
end process;
end gate_level_low;
