--Manoj Vishwanathan
-- Lec 1B

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_dem_1_8 is
end entity tb_dem_1_8;


architecture verify of tb_dem_1_8 is
  signal din : std_logic;
  signal sel : std_logic_vector (2 downto 0);
  signal fout : std_logic_vector (7 downto 0);
  signal input1 : std_logic := '1';
   signal input2 : std_logic_vector (2 downto 0) := "000";
   
begin
  duv: entity work.dem_1_8(base_build)
    port map (sel=> sel, output=>fout,din =>din);

  test : process is
    procedure test
      (sel_test : in std_logic_vector (2 downto 0);data_in :in std_logic) is
      
    begin
      sel<= sel_test;
      din<= data_in; 
	wait for 1ms;
    end procedure test;
  begin
    for x in 0 to 8 loop
	--input1 <='0';
        --test(input2,input1);
        input1 <= '1';
	test(input2,input1);
	input2<= input2 + "001";
    	
end loop;
      wait;
  end process test;
end architecture verify;
