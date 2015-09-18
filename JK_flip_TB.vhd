

--libraries to be used are specified here
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;


architecture behavior of testbench is
--Signal declarations
signal clk,J,K,reset,Q,Qbar : std_logic := '0';

-- Clock period definitions
constant clk_period : time := 1 ns;
begin
-- Instantiate the Unit Under Test (UUT)
UUT : entity work.JK_Flipflop port map (clk,J,K,Q,Qbar,reset);
-- Clock process definitions
clk_process :process
begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
end process;
-- Stimulus process
stim_proc: process
begin         
J<='1';
K<='0';
wait for clk_period*2;


J<='1';
K<='1';
wait for clk_period*2;


J<='0';
K<='1';
wait for clk_period*2;

J<='0';
K<='0';
wait for clk_period*2;

J<='1';
K<='0';
wait for clk_period*2;

reset <='1';
J<='1';
K<='1';
wait for clk_period*2;

J<='0';
K<='1';
wait for clk_period*2;

reset <='0';
J<='1';
K<='1';
wait;
end process;

end;