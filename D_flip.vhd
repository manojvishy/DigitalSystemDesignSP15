library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity D_FF_VHDL is
   port
   (
      clk : in std_logic;
 
      rst : in std_logic;
      pre : in std_logic;
      ce  : in std_logic;
 
      d : in std_logic;
 
      q : out std_logic;
      q_bar : out std_logic
   );
end entity D_FF_VHDL;
 
architecture Behavioral of D_FF_VHDL is
begin
   process (clk) is
   begin
      if rising_edge(clk) then  
         if (rst='1') then   
            q <= '0';
	    q_bar <= '1';
         elsif (pre='1') then
            q <= '1';
 	    q_bar <= '0';
         elsif (ce='1') then
            q <= d;
	 q_bar <= not(d);
         end if;
      end if;
   end process;
end architecture Behavioral;

architecture Behavioral_N of D_FF_VHDL is
begin
   process (clk) is
   begin
      if falling_edge(clk) then  
        if (rst='1') then   
            q <= '0';
	    q_bar <= '1';
         elsif (pre='1') then
            q <= '1';
 	    q_bar <= '0';
         elsif (ce='1') then
            q <= d;
	 q_bar <= not(d);  
         end if;
      end if;
   end process;
end architecture Behavioral_N;