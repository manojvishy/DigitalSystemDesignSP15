library ieee;
use ieee.std_logic_1164.all;

entity dem_1_2 is
  port(	sel: in std_logic;
	output: out std_logic_vector (1 downto 0);
	din: in std_logic);
end entity dem_1_2;

architecture behav of dem_1_2 is 
signal temp : std_logic_vector (3 downto 0);
begin

with sel select
    output <=   din & '0'  when  '0',	
         	'0' & din when  '1',
         	"00" when  others;   

 end architecture behav;
