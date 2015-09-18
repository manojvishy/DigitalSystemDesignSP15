library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity t_trigger_tb is
end t_trigger_tb;
 
architecture verify of t_trigger_tb is	
constant clk_period : time := 50 ns;
signal T,Reset,CLK,CLK_enable,Q: std_logic;
BEGIN
dut: entity work.t_trigger(beh_t_trigger)
	port map (T,Reset,CLK,CLK_enable,Q);

clk_process :process
begin
        CLK <= '0';
        wait for clk_period/2;
        CLK <= '1';
        wait for clk_period/2;
end process;

-- Stimulus process
stim_proc: process
begin
	Reset <= '1';
	wait for clk_period*2;
	Reset<= '0';
	CLK_enable <='1';
	
	T <='1';
	wait for clk_period*2;
	T<='0';
	wait for clk_period*2;

end process;

end architecture verify;