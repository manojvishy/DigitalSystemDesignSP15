library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
use ieee.numeric_std.all;


entity USR_tb is
end entity USR_tb;

architecture verify of USR_tb is
constant clk_period : time := 50 ns;
Signal D :  STD_LOGIC_VECTOR (3 downto 0);
signal CLK, RST :  STD_LOGIC;  --remover rst
signal SIR, SIL : STD_LOGIC;  -- let it be
signal S : STD_LOGIC_VECTOR (2 downto 0); --2 downto 0
signal Q : STD_LOGIC_VECTOR (3 downto 0);

begin

DUT: entity work.USR(Behavioral)
	port map (D,CLK,RST,SIR,SIL,S,Q);

clk_process :process
begin
        CLK <= '0';
        wait for clk_period/2;
        CLK <= '1';
        wait for clk_period/2;
end process;

apply_inputs: process is

procedure apply_test(D_test : in STD_LOGIC_VECTOR (3 downto 0);
  S_test : in STD_LOGIC_VECTOR (2 downto 0)) is
begin
D <= D_test;
S <= S_test;
wait for 1 ms;
end procedure apply_test;
--Stimulus
begin
apply_test("0010","000");
apply_test("0101","001");
apply_test("1011","010");
apply_test("0111","011");
apply_test("1010","100");
apply_test("1101","101");
apply_test("1011","110");
apply_test("1111","111");


end process apply_inputs;




end architecture verify;