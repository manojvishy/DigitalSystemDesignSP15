library ieee;
use ieee. std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.NUMERIC_STD.SIGNED;
use ieee.fixed_pkg.all;

entity operation_4bit_tb is
end entity operation_4bit_tb;

architecture rtl of operation_4bit_tb is
constant tc : time := 50 ns;
signal x,y : signed(3 downto 0);
signal F: signed(19 downto 0):="00000000000000000000";
signal	Clk: std_logic;

begin
dut: entity work.operation_4bit(rtl)
	port map (x,y, F ,Clk);

clk_process: process is 
begin
wait for tc/2 ; clk <='1';
wait for tc/2 ; clk <='0';
end process clk_process;

apply_test_cases: process is
procedure apply_test(x_in,y_in: in signed(3 downto 0)) is
	begin
	x <= x_in ;
	y <= y_in;
wait for tc*5;
end procedure apply_test;
begin
apply_test("1000","1000");
apply_test("0111","0111");
apply_test("0111","1000");
apply_test("0010","0001");
end process apply_test_cases;

end architecture rtl;
