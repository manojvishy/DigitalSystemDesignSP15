library ieee;
use ieee.fixed_pkg.all;

entity usigned_fp is 
port (x,y : in ufixed (9 downto -10);
	f: out sfixed(13 downto -10));
end entity usigned_fp;

architecture behav of usigned_fp is
signal y_5 : ufixed(12 downto -10);
signal f_temp: sfixed(13 downto -10);
begin
y_5 <= resize(to_ufixed(5.0,9,-10)*y, y_5);
f<= sfixed(x) - sfixed(y_5);
--f<= resize(f_temp);
end architecture;
