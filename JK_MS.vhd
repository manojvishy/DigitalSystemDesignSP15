--libraries to be used are specified here
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SR_FF is
PORT( S,R,CLOCK,CLR,PRESET: in std_logic;
       Q, QBAR: out std_logic);
end SR_FF;

Architecture behavioral of SR_FF is
begin
P1: PROCESS(CLOCK,CLR,PRESET)
variable x: std_logic;
begin
if(CLR='0') then
 x:='0';

elsif(PRESET='0')then
 x:='1';

elsif(CLOCK='0' and CLOCK'EVENT) then

if(S='0' and R='0')then
 x:=x;
 elsif(S='1' and R='1')then
 x:='Z';

elsif(S='0' and R='1')then
 x:='0';

else
 x:='1';

end if;
end if;

   Q<=x;
   QBAR<=not x;
end PROCESS;
end behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
port ( In1: in std_logic;
	out1: out std_logic
);
end not_gate;

architecture behav of not_gate is
begin 
out1 <= not (In1);
end behav;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
port ( In1,In2: in std_logic;
	out1: out std_logic
);
end and_gate;

architecture behav of and_gate is
begin 
out1 <= (In1 and In2);
end behav;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--entity declaration with port definitions
entity JK_MS is
port ( clk:     in std_logic;
          J, K:               in std_logic;
          Q, Qbar:       out std_logic;
           reset:              in std_logic
);
end JK_MS;

--architecture of entity
architecture Behavioral of JK_MS is
--signal declaration.
signal qtemp,qbartemp : std_logic :='0';
begin
Q <= qtemp;
Qbar <= qbartemp;

process(clk,reset)
begin
if(reset = '1' ) then           --Reset the output.
 qtemp <= '0';
 qbartemp <= '1';
elsif( rising_edge(clk)) then
if(J='0' and K='0') then       --No change in the output
if( falling_edge(clk) ) then 
NULL;
end if;
elsif(J='0' and K='1') then    --Set the output.
 if( falling_edge(clk) ) then
qtemp <= '0';
 qbartemp <= '1';
end if;
elsif(J='1' and K='0') then    --Reset the output.
 if( falling_edge(clk) ) then
 qtemp <= '1';
 qbartemp <= '0';
end if;
else                           --Toggle the output.
if( falling_edge(clk) ) then
 qtemp <= not qtemp;
 qbartemp <= not qbartemp;
end if;
end if;
end if;
end process;

end Behavioral;

--architecture Behavioral_component of JK_MS is
--
--component SR_FF is
--PORT( S,R,CLOCK,CLR,PRESET: in std_logic;
--       Q, QBAR: out std_logic);
--end component SR_FF;
--
--
--component not_gate is
--port ( In1: in std_logic;
--	out1: out std_logic
--);
--end component not_gate;
--
--
--component and_gate is
--port ( In1,In2: in std_logic;
--	out1: out std_logic
--);
--end component and_gate;
--
----signal declaration.
--signal qtemp,qbartemp,JMaster,Qbarmaster,Smaster,KMaster,Qmaster,Rmaster,nclk,SSlave,RSlave: std_logic :='0';
--signal preset: std_logic :='1';
--
--begin
--
--AND1: and_gate (JMaster,Qbarmaster,Smaster);
--AND2: and_gate(KMaster,Qmaster,Rmaster);
--NOT1: not_gate(clk,nclk);
--SR_Master: SR_FF(Smaster,Rmaster,clk,reset,preset,SSlave,RSlave);
--SR_Slave: SR_FF(SSlave,RSlave,nclk,reset,preset,qtemp,qbartemp);
--
--
--Q <= qtemp;
--Qbar <= qbartemp;
--
--
--
--end Behavioral_component;
--
--

