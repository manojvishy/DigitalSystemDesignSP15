library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--entity declaration with port definitions
entity JK_MS_TB is
end JK_MS_TB;

--architecture of entity
architecture verify of JK_MS_TB is

Signal clk: std_logic;
Signal J, K: std_logic;
Signal Q, Qbar:std_logic;
Signal reset: std_logic;
constant clk_period:time := 50 ns;
begin

dut: entity work.JK_MS(Behavioral)
	port map (clk,J,K,Q,Qbar,reset);

clk_process: process is 
begin
clk <= '1';
wait for clk_period/2;
clk <='0';
wait for clk_period/2;
end process;

apply_test: process is
begin
reset <='1';
wait for clk_period*2;
reset <='0';

J <='0';
K <='0';
wait for clk_period*2;

J <='0';
K <='1';
wait for clk_period*2;

J <='1';
K <='0';
wait for clk_period*2;

J <='1';
K <='1';
wait for clk_period*2;

end process;

end architecture;