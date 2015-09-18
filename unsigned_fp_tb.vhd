library ieee;
use ieee.fixed_pkg.all;

entity tb_unsigned_fp is
end entity tb_unsigned_fp;

architecture verify of tb_unsigned_fp is
signal x,y :ufixed (9 downto -10);
signal f : sfixed(13 downto -10);
begin
dut: entity work.usigned_fp(behav)
	port map (x =>x , y=>y , f=>f);
apply_test_cases: process is
procedure apply_test
(x_test:in ufixed (9 downto -10);
  y_test: in ufixed (9 downto -10)  ) is
begin
x <= x_test;
y <= y_test;
wait for 1 ms;
end procedure apply_test;
begin
apply_test(to_ufixed(67.234,9,-10),to_ufixed(0.0,9,-10));
apply_test(to_ufixed(0.0,9,-10),to_ufixed(67.234,9,-10));
apply_test(to_ufixed(10,9,-10),to_ufixed(20,9,-10));
apply_test(to_ufixed(20,9,-10),to_ufixed(36.234,9,-10));
wait for 2 ms;
end process apply_test_cases;
end architecture verify;
