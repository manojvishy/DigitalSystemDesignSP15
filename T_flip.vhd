library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity t_trigger is
   port (T,Reset,CLK,CLK_enable: in std_logic;
	 Q: out std_logic);
end t_trigger;
 
architecture beh_t_trigger of t_trigger is	 
	signal temp: std_logic;
begin
   process (Reset,CLK) 
   begin   
	   if Reset='1' then   
		  temp <= '0'; 
	      elsif (rising_edge(CLK)) then 		
	         if CLK_enable ='1' then
	 	    temp <= T xor temp;
		 end if;
           end if; 
   end process;
   Q <= temp;	   
end beh_t_trigger;


architecture beh_t_trigger_n of t_trigger is	 
	signal temp: std_logic;
begin
   process (Reset,CLK) 
   begin   
	   if Reset='1' then   
		  temp <= '0'; 
	      elsif (falling_edge(CLK)) then 		
	         if CLK_enable ='1' then
	 	    temp <= T xor temp;
		 end if;
           end if; 
   end process;
   Q <= temp;	   
end beh_t_trigger_n;