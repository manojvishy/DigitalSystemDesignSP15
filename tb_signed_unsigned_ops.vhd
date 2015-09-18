-- Manoj Vishwanathan
-- Mini Project 4 Signed Adder	
----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;


entity tb_Mul_Ops is
end entity tb_Mul_ops;

architecture behav of tb_Mul_ops is
signal x:   signed (4 downto 0);
signal sign_bit: std_logic;
signal sel: std_logic_vector(1 downto 0);
signal F: sfixed(20 downto -5);
begin
dut: entity work.Mul_ops(behav)
	port map (x =>x , sign_bit=>sign_bit,sel=>sel, F=>F);
apply_test_cases: process is
procedure apply_test
(x_test:in signed (4 downto 0);
  sign_bit_test: in std_logic;
   sel_test: in std_logic_vector(1 downto 0)  ) is
begin
x <= x_test;
sign_bit <= sign_bit_test;
sel<=sel_test;
wait for 1 ms;
end procedure apply_test;
begin
apply_test("11111",'1',"00");
apply_test("11111",'1',"01");
apply_test("11111",'1',"10");
apply_test("11111",'1',"11");
apply_test("11111",'0',"00");
apply_test("11111",'0',"01");
apply_test("11111",'0',"10");
apply_test("11111",'0',"11");

wait for 2 ms;
end process apply_test_cases;


end architecture behav;