--Manoj Vishwanathan
--Mini Project 5
--------------------------------------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

 ENTITY Seq_operator IS
 PORT ( X,Y : IN signed (3 downto 0);
CLK,RESET,W: IN std_logic;
 Q : OUT signed(19 downto 0));
 END;

 ARCHITECTURE BEHAVIOR OF Seq_operator IS
 SIGNAL sreg : std_logic_vector (1 DOWNTO 0);
 SIGNAL next_sreg : std_logic_vector (1 DOWNTO 0);
 variable temp_reg_result,temp_reg_x,temp_reg_y : signed(19 downto 0));
 CONSTANT STATE0 : std_logic_vector (1 DOWNTO 0) :="00";
 CONSTANT STATE1 : std_logic_vector (1 DOWNTO 0) :="01";
 CONSTANT STATE2 : std_logic_vector (1 DOWNTO 0) :="10";
 CONSTANT STATE3 : std_logic_vector (1 DOWNTO 0) :="11";

 BEGIN
 PROCESS (CLK, RESET, next_sreg)
 BEGIN
 IF ( RESET='1' ) THEN
 sreg <= STATE0;
 ELSIF CLK='0' AND CLK'event THEN
 sreg <= next_sreg;
 END IF;
 END PROCESS;

 PROCESS (sreg,W)
BEGIN
 Q <= "00000000000000000000";
next_sreg<=STATE0;

 CASE sreg IS
 
WHEN STATE0 =>
 Q<='0';
 IF ( W='1' ) THEN
 next_sreg<=STATE1;
 END IF;
IF ( W='0' ) THEN
 next_sreg<=STATE0;
 END IF;
 

WHEN STATE1 =>
 Q<='1';
 IF ( W='0' ) THEN
 next_sreg<=STATE2;
 END IF;
IF ( W='1' ) THEN
 next_sreg<=STATE1;
 END IF;
 

WHEN STATE2 =>
 Q<='1';
 IF ( W='1' ) THEN
 next_sreg<=STATE3;
 END IF;
 IF ( W='0' ) THEN
 next_sreg<=STATE2;
 END IF;
 

WHEN STATE3 =>
 Q<='0';
 IF ( W='0' ) THEN
 next_sreg<=STATE0;
 END IF;
 IF ( W='1' ) THEN
 next_sreg<=STATE3;
 END IF;
 WHEN OTHERS =>
 END CASE;
 END PROCESS;
 END BEHAVIOR;