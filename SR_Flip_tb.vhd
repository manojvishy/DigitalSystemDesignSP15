library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;

entity SR_FF_TB is
end SR_FF_TB;

Architecture VERIFY of SR_FF_TB is
constant clk_period: time := 50 ns;
signal S,R,CLOCK,CLR,PRESET:  std_logic;
signal Q, QBAR:  std_logic;
begin
Dut: entity work.SR_FF(behavioral)
	port map (S,R,CLR,PRESET,Q,QBAR);

clk_process: process is
begin
CLOCK <='1';
wait for clk_period/2;
CLOCK <= '0';
wait for clk_period/2;
end process;

apply_inputs: process is
begin
CLR <='1';
wait for clk_period*2;
CLR<='0';
wait for clk_period*2;
PRESET <='1';
wait for clk_period*2;
PRESET <='0';
wait for clk_period*2;

S<='0';
R<='1';
wait for clk_period*2;
S<='1';
R<='1';
wait for clk_period*2;
S<='0';
R<='0';
wait for clk_period*2;
S<='1';
R<='0';
wait for clk_period*2;

end process;
end architecture;