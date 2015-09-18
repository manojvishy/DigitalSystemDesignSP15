library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode_2to4_active is
    Port ( A  : in  STD_LOGIC_VECTOR (1 downto 0);  -- 2-bit input
           X  : out STD_LOGIC_VECTOR (3 downto 0);  -- 4-bit output
           EN : in  STD_LOGIC);                     -- enable input
end decode_2to4_active;

architecture Behavioral of decode_2to4_active is
begin
process (A)
begin
    X <= "1111";        -- default output value
    if (EN = '1') then  -- active high enable pin
        case A is
             when "00" => X <= "1000";
            when "01" => X <= "0100";
            when "10" => X <= "0010";
            when "11" => X <= "0001";
            when others => X <= "1111";
        end case;
    end if;
end process;
end Behavioral;
Architecture gate_level of decode_2to4_active is 
begin 
process (A)
begin
if (EN = '1') then
X(0) <= (not (A(0)) )  AND (not (A(1)) );
X(1) <= (not (A(0)) )  AND ( (A(1)) );
X(2) <= ( (A(0)) )  AND (not (A(1)) );
X(3) <= ((A(0)) )  AND ((A(1)) );
end if;
end process;
end gate_level;