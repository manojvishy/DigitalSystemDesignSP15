library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
use ieee.numeric_std.all;


--X-5Y
architecture Behavioral of USR is
--type Input_States is (SHL2,HOLD,SET,Reset,ParallelLoad, Johnson Counter,SHR3, ROR2);
begin
process(CLK, RST) is
variable REG : std_logic_vector(3 downto 0);

begin
if (RST = '0') then
REG := (others => '0');
elsif falling_edge(clk) then 
case S is
when "000" =>			-- SHIFT Left 2bits
REG := REG(1 downto 0) & "00";
when "001" =>			--  Hold
REG := D;
when "010" =>			-- Reset
REG := (others => '0');
--REG := SIR & REG(3 downto 1);
when "011" =>			-- Set
REG := "1111";
when "100" =>			-- Parallel Load 
REG := (others => '0');
--when "101" =>
--REG := (REG(2 downto 0) & (not(REG(3)));	-- Johnson counter
----REG := (others => '0');
when "110" =>			-- SHR3
REG:= "000" & REG(3);
--when "111" =>	
--REG ror 2;			--ROR2
when others =>
null;
end case;
end if;

Q <= REG;
end process;

end architecture;
