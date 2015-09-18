library ieee;
use ieee.std_logic_1164.all;
use ieee.fixed_pkg.all;

entity tb_temp_conv is 
end entity tb_temp_conv;

architecture verify of tb_temp_conv is 
signal in_temp :sfixed (9 downto -6);
signal out2ftemp,out1_Ktemp: sfixed(10 downto -6);
signal sel: std_logic;
begin
dut: entity work.temp_conv(behav)
	port map (in_temp=>in_temp , sel=>sel , out2ftemp=>out2ftemp,out1_Ktemp=>out1_Ktemp);
apply_test_cases: process is
procedure apply_test
(in_temp_test:in sfixed (9 downto -6);
  sel_test: in std_logic  ) is
begin
in_temp <= in_temp_test;
sel <= sel_test;
wait for 1 ms;
end procedure apply_test;
begin
apply_test(to_sfixed(-40.00,9,-6),'0');
wait for 2 ms;
apply_test(to_sfixed(-40.0,9,-6),'1');
wait for 2 ms;

apply_test(to_sfixed(100.0,9,-6),'1');
wait for 2 ms;

apply_test(to_sfixed(100,9,-6),'0');
wait for 2 ms;

apply_test(to_sfixed(0.0,9,-6),'1');
wait for 2 ms;

apply_test(to_sfixed(0.0,9,-6),'0');
wait for 2 ms;

end process apply_test_cases;

end architecture verify;