library ieee;
use ieee.fixed_pkg.all;

entity signed_fp is 
port (x,y : in sfixed (9 downto -10);
	f: out sfixed(12 downto -10));
end entity signed_fp;

architecture behav of signed_fp is
--signal y_5 : sfixed(12 downto -10);
begin
--y_5 <= resize(to_sfixed(5.0,9,-10)*y, y_5);
f<= resize(x - 5*y,f'high,f'low);
end architecture;
