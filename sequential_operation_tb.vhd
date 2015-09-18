library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.fixed_pkg.all;

entity operations_tb is 
end entity operations_tb;

architecture verify of operations_tb is 
constant tc : time := 50 ns;
--signal x,y : signed(3 downto 0);
--signal F: signed(19 downto 0):="00000000000000000000";
--signal	Clk: std_logic;

Signal	clk,reset,y_load :  std_logic;
Signal	sel : std_logic_vector(1 downto 0);
Signal	y:  unsigned(2 downto 0);
Signal	x:  signed (3 downto 0);
Signal	sign_bit:  std_logic;
Signal	Final :  signed(19 downto 0):="00000000000000000000";

begin
--Final <= "00000000000000000000";
	
dut: entity work.operations(rtl)
	port map (clk, reset, sel, y,y_load , x, sign_bit,Final);

clk_process: process is 
begin
wait for tc/2 ; clk <='1';
wait for tc/2 ; clk <='0';
end process clk_process;


apply_test_cases: process is
procedure apply_test(x_test: in signed(3 downto 0);y_test :in unsigned (2 downto 0);
	 sel_in: in std_logic_vector (1 downto 0);
sign_bit_in: in  std_logic;reset_in : in std_logic) is
	begin
	
	x <= x_test ;
	y_load <= '1';
	y <= y_test;	
wait for 2*tc;
	y_load <='0';	
	
	sel <= sel_in;
	sign_bit <= sign_bit_in;	
	reset <= reset_in;
wait for 400 ns;
end procedure apply_test;
begin

--apply_test("1000","001","00",'1','0');
--apply_test("1010","001","10",'1','0');
--apply_test("0101","001","00",'0','0');
--apply_test("0101","110","10",'0','0');
--apply_test("0101","101","00",'0','0');
apply_test("0101","011","01",'0','0');
--apply_test("0100","011","01",'0','0');

end process apply_test_cases;
end architecture verify;