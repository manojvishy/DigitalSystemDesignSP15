 
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity multiplexer8_1 is
     port(
         din : in STD_LOGIC_VECTOR(7 downto 0);
         sel : in STD_LOGIC_VECTOR(2 downto 0);
         dout : out STD_LOGIC
         );
end multiplexer8_1;

architecture multiplexer8_1_arc of multiplexer8_1 is
begin
	process(sel)
    begin
    case sel is
	    when "000" => dout <= din(0);
	    when "001" => dout <= din(1);
	    when "010" => dout <= din(2);
	    when "011" => dout <= din(3);
	     when "100" => dout <= din(4);
	    when "101" => dout <= din(5);
	    when "110" => dout <= din(6);
	    when "111" => dout <= din(7);
	    when others => dout <= 'Z';
	end case;
	end process;
end multiplexer8_1_arc;

architecture behav2 of multiplexer8_1 is

component Mux is
port ( i0,i1,i2,i3 : in std_logic ; 
	s: in std_logic_vector (1 downto 0);
	o: out std_logic); 
end component Mux;
component Mux2 is
port ( i0,i1,s : in std_logic ; 
	o: out std_logic); 
end component Mux2;
signal out1,out2,final_out : std_logic;
begin
mux00: Mux port map (din(0),din(1),din(2),din(3),sel(1 downto 0),out1);
mux01: Mux port map (din(4),din(5),din(6),din(7),sel(1 downto 0),out2);
mux10: Mux2 port map (out1,out2,sel(2),final_out);
end architecture behav2;
