
--Samuel Purcell
--Lecture 1B (MST)
--1:4 demuxlibrary ieee;

library ieee;
use ieee.std_logic_1164.all;

entity dem_1to8 is
  port( a: in std_logic;
  	sel: in std_logic_vector (2 downto 0);
	f: out std_logic_vector (7 downto 0));
end entity dem_1to8;

architecture abstr of dem_1to8 is 
signal g : std_logic_vector (7 downto 0);
begin

  with sel select
    g<= "00000001" when  "000",	
        "00000010" when  "001",
        "00000100" when  "010",
        "00001000" when  "011",
        "00010000" when  "100",
        "00100000" when  "101",
        "01000000" when  "110",
        "10000000" when  others;   

  with a select
    f <= g when '1',
         "00000000" when others;

end architecture abstr;

architecture twopiece of dem_1to8 is

  component dem_1to4 is 
    port (a: in std_logic;
	  sel: in std_logic_vector (1 downto 0);
	  f: out std_logic_vector (3 downto 0));
  end component dem_1to4;
  
  component and_gate is
    port (a, b: in std_logic;
          f: out std_logic);
  end component and_gate;

  component not_gate is
    port (a: in std_logic;
          f: out std_logic);
  end component not_gate; 

signal output: std_logic_vector (8 downto 0);
signal g: std_logic_vector (7 downto 0);

begin
    dem1 : dem_1to4 port map (a, sel(1 downto 0 ), g(3 downto 0));
    dem2 : dem_1to4 port map (a, sel(1 downto 0 ), g(7 downto 4)); 
    
    not1 : not_gate port map (sel(2), output(0));
    and1 : and_gate port map (output(0), g(0), output(1));
    and2 : and_gate port map (output(0), g(1), output(2));
    and3 : and_gate port map (output(0), g(2), output(3));
    and4 : and_gate port map (output(0), g(3), output(4));
    and5 : and_gate port map (sel(2), g(4), output(5));
    and6 : and_gate port map (sel(2), g(5), output(6));
    and7 : and_gate port map (sel(2), g(6), output(7));
    and8 : and_gate port map (sel(2), g(7), output(8));

    f<=output(8 downto 1);

end architecture twopiece;

architecture behavior of dem_1to8 is

begin
  with sel select
    f <= "0000000" & a when "000",
         "000000" & a & '0' when "001",
         "00000" & a & "00" when "010",
         "0000" & a & "000" when "011",
         "000" & a & "0000" when "100",
         "00" & a & "00000" when "101",
         '0' & a & "000000" when "110",
         a & "0000000"      when others;
         
end architecture behavior;
         
           