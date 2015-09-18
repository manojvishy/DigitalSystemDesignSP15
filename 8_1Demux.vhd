library ieee;
use ieee.std_logic_1164.all;

entity dem_1_8 is
  port(	sel: in std_logic_vector (2 downto 0);
	output: out std_logic_vector (7 downto 0);
	din : in std_logic);
end entity dem_1_8;

architecture behav of dem_1_8 is 
--signal g : std_logic_vector (7 downto 0);
begin

  with sel select
    output<=     din & "0000000" when  "000",	
       		 '0' & din & "000000" when  "001",
                  "00" & din & "00000" when  "010",
                  "000" & din  & "0000" when  "011",
                   "0000" & din & "000" when  "100",
        	   "00000" & din & "00" when  "101",
                    "000000" & din & '0' when  "110",
        	     "0000000" & din  when  "111",
	              "00000000" when others;   

  

end architecture behav;


architecture base_build of dem_1_8 is
component dem_1_4 is
  port(	sel: in std_logic_vector (1 downto 0);
	output: out std_logic_vector (3 downto 0);
	din: in std_logic);
 end component dem_1_4;

component dem_1_2 is
  port(	sel: in std_logic;
	output: out std_logic_vector (1 downto 0);
	din: in std_logic);
end component dem_1_2;
signal output_2 : std_logic_vector(1 downto 0);
begin
demux0: dem_1_2 port map(sel(2),output_2,din); 
demux1: dem_1_4 port map (sel(1 downto 0),output(3 downto 0),output_2(0));
demux2: dem_1_4 port map (sel(1 downto 0),output(7 downto 4),output_2(1));         
end architecture base_build;
         
           
