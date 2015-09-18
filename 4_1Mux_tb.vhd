library ieee;
use ieee.std_logic_1164.all;
--
entity Mux_tb is
end Mux_tb;
--


architecture tb of Mux_tb is
   signal I0, I1, I2, I3, O: std_logic;
   signal S : std_logic_vector(1 downto 0);
	begin

dut: entity work.Mux(behv1) 
	port map( I3=>I3,I2=>I2,I1=>I1,I0=>I0,S=>S,O=>O);
	
  --Concurrent processes
  process 
   begin	
	I0<='1';
	I1<='0';
	I2<='1';
	I3<='0';
      S <= "00";wait for 5 ns;
      S <="01";wait for 5 ns;
      S <= "10";wait for 5 ns;
      S <= "11";wait for 5 ns;
  end process;
end architecture tb;
