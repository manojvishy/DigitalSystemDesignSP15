
library ieee;
use ieee.std_logic_1164.all;

entity dem_1_4 is
  port(	sel: in std_logic_vector (1 downto 0);
	output: out std_logic_vector (3 downto 0);
	din : in std_logic);
end entity dem_1_4;

architecture behav of dem_1_4 is 
signal temp : std_logic_vector (3 downto 0);
begin

with sel select
    output <= din &"000" when  "00",	
              '0' & din & "00" when  "01",
              "00" & din & '0' when  "10",
              "000" & din when  "11",
              "0000" when  others;   

 end architecture behav;
