library ieee;
use ieee.std_logic_1164.all;
use ieee.fixed_pkg.all;

entity temp_conv is 
port (in_temp: in sfixed (9 downto -6);
	sel: in std_logic;
	out2ftemp: out sfixed(10 downto -6);
	out1_Ktemp: out sfixed (10 downto -6));
end entity temp_conv;

architecture behav of temp_conv is 
signal tempk,tempf: sfixed (10 downto -6) ;
--signal tempc,tempf: sfixed (10 downto -6) ;
begin

tempf <= resize ((in_temp - 32)/1.8,tempf) when sel ='1' else
 	 resize ((in_temp*1.8) + 32,tempf);
out1_Ktemp <= resize(tempf + 273.15, tempk ) when sel = '1' else
	      resize(in_temp + 273.15,tempk);
out2ftemp <= tempf;
end architecture behav;