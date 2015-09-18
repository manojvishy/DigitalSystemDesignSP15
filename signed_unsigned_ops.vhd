-- Manoj Vishwanathan
-- Mini Project 4 Signed Adder	
----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;


entity Mul_Ops is
port (x: in signed (4 downto 0);
	sign_bit: in std_logic;
	sel: in std_logic_vector(1 downto 0);
	F: out sfixed(20 downto -5));
end entity Mul_ops;

architecture behav of Mul_ops is
signal temp:   signed (5 downto 0);

begin 

with sign_bit select 
temp <= '0' & x(4 downto 0) when'0',
	x(4) &  x(4 downto 0) when others;

with sel select 
F <=  resize(to_sfixed(temp)*to_sfixed(temp)*to_sfixed(temp)*to_sfixed(temp),20,-5) when "00",
      resize(to_sfixed(100,20,-5)/to_sfixed(temp) , 20, -5)  when "01",
      resize(to_sfixed(2,20,-5)*to_sfixed(temp) - to_sfixed(40,20,-5),20,-5)  when "10"	,
      resize(to_sfixed(5,20,-5) - to_sfixed(temp)*to_sfixed(10,20,-5),20,-5)  when others;
end architecture behav;
