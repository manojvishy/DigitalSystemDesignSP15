library ieee;
use ieee.fixed_pkg.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

--entity REG_20 is
-- port(d_i : in SIGNED(19 downto 0);
-- d_o : out SIGNED(19 downto 0);
-- clk : in STD_LOGIC;
-- rst : in STD_LOGIC);
--end REG_20;
--
--architecture REG_20_ARCH of REG_20 is
--
--variable val : SIGNED(19 downto 0);
--begin
-- process(rst, clk)
-- begin
-- if( rst = '1') then
-- val <= "00000000000000000000";
-- elsif( clk'event and clk = '0' ) then
-- val <= d_i;
-- end if;
-- end process;
-- d_o <= val;
--end REG_20_ARCH;

entity ADD_20 is
 port(a : in SIGNED(19 downto 0);
 b : in SIGNED(19 downto 0);
 z : out SIGNED(19 downto 0));
end ADD_20;

architecture ADD_20_ARCH of ADD_20 is
begin
 process(a, b)
 begin
 z <= a + b;
 end process;
end ADD_20_ARCH;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity Multiplier_VHDL is
   port
   (
      Nibble1, Nibble2: in std_logic_vector(3 downto 0);
 
      Result: out std_logic_vector(7 downto 0)
   );
end entity Multiplier_VHDL;
 
architecture Behavioral of Multiplier_VHDL is
begin
 
   Result <= std_logic_vector(unsigned(Nibble1) * unsigned(Nibble2));
 
end architecture Behavioral;



