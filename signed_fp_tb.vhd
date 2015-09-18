library ieee;
use ieee.fixed_pkg.all;

entity tb_signed_fp is
end entity tb_signed_fp;

architecture verify of tb_signed_fp is
signal x,y :sfixed (9 downto -10);
signal f : sfixed(12 downto -10);
begin
dut: entity work.signed_fp(behav)
	port map (x =>x , y=>y , f=>f);
apply_test_cases: process is
procedure apply_test
(x_test:in sfixed (9 downto -10);
  y_test: in sfixed (9 downto -10)  ) is
begin
x <= x_test;
y <= y_test;
wait for 1 ms;
end procedure apply_test;
begin
apply_test(to_sfixed(67.234,9,-10),to_sfixed(-103.374,9,-10));
apply_test(to_sfixed(-103.374,9,-10),to_sfixed(67.234,9,-10));
wait for 2 ms;
end process apply_test_cases;
end architecture verify;
