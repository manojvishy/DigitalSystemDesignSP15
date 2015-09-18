---------------------------------------------------
-- Manoj Vishwanathan
-- Mini Project 3 Signed Adder	
----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity multi_func_sys is
port (x_sign: in signed (4 downto 0);
      x_unsig: in unsigned (4 downto 0);
	sign_bit: in std_logic;
	Sel: in std_logic_vector(1 downto 0);	
      F_sign: out signed(19 downto 0);
	F_unsign: out unsigned(19 downto 0));
end entity multi_func_sys;

architecture behav of multi_func_sys is
--signal sign_bit: std_logic := Sel(2);

begin
process(sign_bit)
begin
if (sign_bit = '0') then
with Sel select 
F_unsign <= x_unsig*x_unsig*x_unsig*x_unsig when "00" ,
           to_unsigned(100,5)/x_unsig	when "01" ,
	   to_unsigned(2,5)*x_unsig - to_unsigned(40,5) when "10",		-- 2*X - 40
	    to_unsigned(5,5) - to_unsigned(10,5)*x_unsig  when others;		--5 - 10X
else if (sign_bit = '1') then
with Sel select 
F_sign <= x_sign*x_sign*x_sign*x_sign when "00" ,
           to_signed(100,5)/x_sign	when "01" ,
	   to_signed(2,5)*x_sign - to_signed(40,5) when "10",		-- 2*X - 40
	    to_signed(5,5) - to_signed(10,5)*x_sign  when others;		--5 - 10X
end if;
end process;


end architecture behav; 