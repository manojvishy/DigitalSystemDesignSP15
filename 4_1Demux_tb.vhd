library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb2_1_4 is
end entity tb2_1_4;


architecture verify of tb2_1_4 is
 signal din_final: std_logic;
 signal sel : std_logic_vector (1 downto 0);
  signal finalout : std_logic_vector (3 downto 0);
  signal input1 : std_logic_vector (1 downto 0) := "00";
  signal input2: std_logic:='0';
begin
  duv: entity work.dem_1_4(behav)
    port map (sel=> sel, output=>finalout,din=>din_final);

  test : process is
    procedure test
      ( sel_test : in std_logic_vector (1 downto 0);din_test: in std_logic) is
      
    begin
         sel<= sel_test;
         din_final<= din_test;
	wait for 1ms;
    end procedure test;
  begin
    for x in 0 to 4 loop
       input2<='1';
 test(input1,input2);
	input2<='0';
	test(input1,input2);
	
      input1<= input1 + "01";
    end loop;
      wait;
  end process test;
end architecture verify;
