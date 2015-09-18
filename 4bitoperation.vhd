library ieee;
use ieee. std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.NUMERIC_STD.SIGNED;

entity operation_4bit is
port ( x,y : in signed(3 downto 0);
	F: out signed (19 downto 0 );
	Clk: in std_logic
);
end entity operation_4bit;

architecture rtl of operation_4bit is

signal step1,step2,step3: signed (19 downto 0 );
signal register1,register2,register3 : signed (19 downto 0 );
signal step4,register4 : signed (19 downto 0);
begin
--step1

step1 <= resize(x,step1'length);

reg1: process(clk) is
	begin 
	if falling_edge(clk) then 
	register1 <= step1;
	end if;
      end process;
--step 2 
step2 <= resize(y,step2'length);

reg2: process(clk) is
	begin 
	if falling_edge(clk) then 
	register2 <= step2;
	end if;
      end process;
--step 3 
step3 <= resize(to_signed(5,4)*step2,step3'length);

reg3: process(clk) is
	begin 
	if falling_edge(clk) then 
	register3 <= step3;
	end if;
      end process;
--step 4 
step4 <= (step1 - step3);

reg4: process(clk) is
	begin 
	if falling_edge(clk) then 
	register4 <= step4;
	end if;
      end process;
F <= register4;
end rtl;