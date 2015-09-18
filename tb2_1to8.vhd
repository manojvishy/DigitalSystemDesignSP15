--Samuel Purcell
--Lecture 1B (MST)
--Test Bench for 1:8 demultiplexor

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb2_1to8 is
end entity tb2_1to8;


architecture verify of tb2_1to8 is
   signal sel : std_logic_vector (2 downto 0);
  signal fout : std_logic_vector (7 downto 0);
   signal input2 : std_logic_vector (2 downto 0) := "000";

begin
  duv: entity work.dem_1_8(behav)
    port map (sel=> sel, f=>fout);

  test : process is
    procedure test
      (sel_test : in std_logic_vector (2 downto 0)) is
      
    begin
      sel<= sel_test;
       
	wait for 1ms;
    end procedure test;
  begin
    for x in 0 to 8 loop
        test(input2);
        input2<= input2 + "001";
    end loop;
      wait;
  end process test;
end architecture verify;
