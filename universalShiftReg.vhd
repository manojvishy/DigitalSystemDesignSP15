library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
use ieee.numeric_std.all;


entity USR is
Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
CLK, RST : in STD_LOGIC;  --remover rst
SIR, SIL : in STD_LOGIC;  -- let it be
S :in STD_LOGIC_VECTOR (2 downto 0); --2 downto 0
Q : out STD_LOGIC_VECTOR (3 downto 0));
end entity USR;

architecture Behavioral of USR is
--type Input_States is (SHL2,HOLD,SET,Reset,ParallelLoad, Johnson Counter,SHR3, ROR2);
begin

process(CLK, RST) is
variable REG : std_logic_vector(3 downto 0):=D;
variable Jreg : std_logic := not REG(3);
begin
if (RST = '0') then
REG := (others => '0');
elsif rising_edge(clk) then 
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
when "101" =>
REG := (REG(2 downto 0) & Jreg);	-- Johnson counter
----REG := (others => '0');
when "110" =>			-- SHR3
REG:= "000" & REG(3);
when "111" =>			--ROR2
--for i 0 to 2	loop
REG := REG(1) & REG(0) & REG(3 downto 2);
--end loop;		
when others =>
null;
end case;
end if;

Q <= REG;
end process;

end architecture;