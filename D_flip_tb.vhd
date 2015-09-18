library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity D_FF_VHDL_TB is
end entity D_FF_VHDL_TB;
 
architecture verify of D_FF_VHDL_TB is
  
SIgnal clk :  std_logic;
Signal  rst :  std_logic;
Signal pre :  std_logic;
Signal ce  :  std_logic; 
Signal d : std_logic; 
Signal q : std_logic;
Signal q_bar :std_logic;
COnstant clk_period : time := 50 ns ;
--constant clk_period : time := 50 ns;

begin
DUT: entity work.D_FF_VHDL(Behavioral)
	port map (clk,rst,pre,ce,d,q,q_bar);
clk_process: process
begin
clk <= '1';
 wait for clk_period/2;
clk <='0';
wait for clk_period/2;
end process;

apply_test: process is 
begin
rst <='1';
wait for clk_period*2;
rst<='0';

pre <='1';
wait for clk_period*2;
pre <='0';

ce <= '1';
d <= '0';
wait for clk_period*2;
d<='1';
end process;

end architecture;