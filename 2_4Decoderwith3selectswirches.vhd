library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode_2to4_enable is
    Port ( A  : in  STD_LOGIC_VECTOR (1 downto 0);  -- 2-bit input
           X  : out STD_LOGIC_VECTOR (3 downto 0);  -- 4-bit output
           EN : in  STD_LOGIC_VECTOR  (2 DOWNTO 0));                     -- enable input
end decode_2to4_enable;

architecture Behavioral_3signal of decode_2to4_enable is
begin
process (A)
begin
    X <= "1111";        -- default output value
    if (EN = "100") then  -- enable high enable pin
        case A is
            when "00" => X <= "1000";
            when "01" => X <= "0100";
            when "10" => X <= "0010";
            when "11" => X <= "0001";
            when others => X <= "1111";
        end case;
    end if;
end process;
end Behavioral_3signal;
