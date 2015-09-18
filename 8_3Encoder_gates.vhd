library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ENC2 is
    Port ( S : in std_logic;
           T : in std_logic;
           U : in std_logic;
           V : in std_logic;
           W : in std_logic;
           X : in std_logic;
           Y : in std_logic;
           Z : in std_logic;
           OUT0 : out std_logic;
           OUT1 : out std_logic;
           OUT2 : out std_logic);
end ENC2;
architecture Behavioral of ENC2 is
begin
            process(S,T,U,V,W,X,Y,Z)
            begin
            OUT0 <= T OR V OR X OR Z;
            OUT1 <= U OR V OR Y OR Z;
            OUT2 <= W OR X OR Y OR Z;
            end process;
end Behavioral;
