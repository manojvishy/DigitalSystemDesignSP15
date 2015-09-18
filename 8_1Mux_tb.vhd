library ieee;
use ieee.std_logic_1164.all;
--
entity Mux_tb_8 is
end Mux_tb_8;
--


architecture tb of Mux_tb_8 is

 
   signal din: std_logic_vector (7 downto 0);
   signal sel : std_logic_vector(2 downto 0);
   signal O: std_logic;
	

begin

dut: entity work.multiplexer8_1(multiplexer8_1_arc) 
port map(din =>din, sel=>sel,dout=>O);
	
  --Concurrent processes
  process 
  
  begin	
	din<="11001111";
      sel <= "000";wait for 5 ns;
      sel <="001";wait for 5 ns;
      sel <= "010";wait for 5 ns;
      sel <= "011";wait for 5 ns;
      sel <= "100";wait for 5 ns;
      sel <="101";wait for 5 ns;
      sel <="110";wait for 5 ns;
      sel <= "111";wait for 5 ns;
  end process;
end architecture;
