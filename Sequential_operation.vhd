library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.numeric_std.UNSIGNED;
use IEEE.fixed_pkg.all;

entity operations is 
port ( clk,reset : in std_logic;
	sel :in std_logic_vector(1 downto 0);
	y: in unsigned(2 downto 0);
	y_load :in std_logic;
	x: in signed (3 downto 0);
	sign_bit: in std_logic;
	Final : out signed(19 downto 0)
);
end entity operations;

architecture rtl of operations is 
signal x_in : signed  (4 downto 0);
signal done: std_logic :='0';
signal reg,nxt_reg: signed(19 downto 0 ):="00000000000000000000";
type operation_state is (wait_state,step1,step2,step3,step4,step5,step6,step7,step8,step9,done_state);
signal current_state: operation_state;
signal next_state: operation_state;
signal y_dec: unsigned (2 downto 0):= "000";
signal minus_one: signed (2 downto 0):="101";
signal reg_1: signed(19 downto 0 );

begin
Counter_ydec: process (clk,current_state) is 
begin
		if (falling_edge(clk))then
			if (y_load ='1' ) then
				y_dec <= y;
	--			done <='0';
			else if (y_dec > "000") then
				y_dec <= y_dec - "001";
		--		done <= '0';
			end if;
			end if;
		end if;
		

end process;

set_done : process(y_dec) is
begin
	if (y_dec = "000") then
	done <= '1';
	else 
	done <= '0';
	end if;	

end process;
state_register : process (clk,reset) is
begin 
	if (reset = '1') then
	current_state <= step1;
	else if (rising_edge(clk)) then 
		if (done = '1') then 
		current_state <= done_state;
		else
		current_state <= next_state;
		end if;
	end if;
	end if;
end process state_register;

update_output : process (clk) is
begin
if (done = '1' and falling_edge(clk)) then
Final <= reg;
end if;
end process;


next_state_logic: process(current_state) is
begin
	case current_state is
		when wait_state =>
			if (done = '0') then 
			next_state <= step1;
			else
			next_state <= wait_state;
			end if;
			
		when step1 =>
			if (done = '1') then 
			next_state<= done_state;
			else 
			next_state <=step2;
			end if;
		when step2 =>
			if (done = '1') then 
			next_state<= done_state;
			else 
			next_state <=step3;
			end if;
		when step3 =>
			if (done = '1') then 
			next_state<= done_state;
			else 
			next_state <=step4;
			end if;
		when step4 =>
			if (done = '1') then 
			next_state<= done_state;
			else 
			next_state <=step5;
			end if;
		when step5 =>
			if (done = '1') then 
			next_state<= done_state;
			else 
			next_state <=step6;
			end if;
		when step6 =>
			if (done = '1') then 
			next_state<= done_state;
			else 
			next_state <=step7;
			end if;
		when step7 =>
			if (done = '1') then 
			next_state<= done_state;
			else 
			next_state <=step8;
			end if;
		when step8 =>
			next_state<= done_state;
		when done_state =>
			next_state <= wait_state;
	--		done <='0';
		when others =>
			
end case;
end process next_state_logic;	

--computing the final output.
--output_logic: process(current_state) is
--begin
--	case current_state is
--		when step1 =>
--			if (sel = "00") then 
--			reg <= reg + resize(x_in,reg'length);	--reg=reg + x
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "01") then
--			reg <="00000000000000000001";
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "10") then
--			reg <=reg - resize(x_in, reg'length);
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			end if;
--			end if;
--			end if;
--		when step2 =>
--			if (sel = "00") then 
--			reg <= reg + resize(x_in,reg'length);	--reg=reg + x
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "01") then
--			reg <=resize(reg * resize(x_in,reg'length),reg'length) ;
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "10") then
--			reg <=reg - resize(x_in, reg'length);
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			end if;
--			end if;
--			end if;if (sel = "00") then 
--			reg <= reg + resize(x_in,reg'length);	--reg=reg + x
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "01") then
--			reg <="00000000000000000001";
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "10") then
--			reg <=reg - resize(x_in, reg'length);
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			end if;
--			end if;
--			end if;
--		when step3 =>
--			if (sel = "00") then 
--			reg <= reg + resize(x_in,reg'length);	--reg=reg + x
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "01") then
--			reg <=resize(reg * resize(x_in,reg'length),reg'length);
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "10") then
--			reg <=reg - resize(x_in, reg'length);
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			end if;
--			end if;
--			end if;
--		when step4 =>
--			if (sel = "00") then 
--			reg <= reg + resize(x_in,reg'length);	--reg=reg + x
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "01") then
--			reg <=resize(reg * resize(x_in,reg'length),reg'length) ;
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "10") then
--			reg <=reg - resize(x_in, reg'length);
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			end if;
--			end if;
--			end if;
--		when step5 =>
--			if (sel = "00") then 
--			reg <= reg + resize(x_in,reg'length);	--reg=reg + x
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "01") then
--			reg <=resize(reg * resize(x_in,reg'length),reg'length) ;
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "10") then
--			reg <=reg - resize(x_in, reg'length);
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			end if;
--			end if;
--			end if;
--		when step6 =>
--			if (sel = "00") then 
--			reg <= reg + resize(x_in,reg'length);	--reg=reg + x
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "01") then
--			reg <=resize(reg * resize(x_in,reg'length),reg'length) ;
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "10") then
--			reg <=reg - resize(x_in, reg'length);
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			end if;
--			end if;
--			end if;
--		when step7 =>
--			if (sel = "00") then 
--			reg <= reg + resize(x_in,reg'length);	--reg=reg + x
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "01") then
--			reg <=resize(reg * resize(x_in,reg'length),reg'length);
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "10") then
--			reg <=reg - resize(x_in, reg'length);
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			end if;
--			end if;
--			end if;
--		when step8 =>
--			if (sel = "00") then 
--				reg <= reg + resize(x_in,reg'length);	--reg=reg + x
--				y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--				if (y_dec = "000") then
--					done <= '1';
--				end if;
--			else if (sel = "01") then
--				reg <=resize(reg * resize(x_in,reg'length),reg'length);
--				y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--				if (y_dec = "000") then
--				done <= '1';
--				end if;
--			else if (sel = "10") then
--				reg <=reg - resize(x_in, reg'length);
--				y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--				done <= '1';
--			end if;
--			end if;
--			end if;
--			end if;
--		when step9 =>
--		if (sel = "00") then 
--			reg <= reg + resize(x_in,reg'length);	--reg=reg + x
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "01") then
--			reg <=resize(reg * resize(x_in,reg'length),reg'length) ;
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			else if (sel = "10") then
--			reg <=reg - resize(x_in, reg'length);
--			y_dec<= resize(y_dec - "001",y_dec'length);	--resize
--			if (y_dec = "000") then
--			done <= '1';
--			end if;
--			end if;
--			end if;
--			end if;
--		when done_state =>
--			NULL;
--			
--		when others =>
--			reg <= "00000000000000000000";
--			x_in <= "00000";
--			y_dec <= "000";
--			NULL;
--
--
--			
--end case;
	
--end process output_logic;	
updating_outputs: process (clk,current_state) is 
begin
	if (rising_edge(clk) ) then
	if(current_state = wait_state) then
	
	case sign_bit is
	when '0' =>
		x_in <= '0' & x(3 downto 0) ;
		reg_1 <= resize(x_in,reg_1'length);
--		y_dec <= y;
	when others =>	
		x_in<= x(3) &  x(3 downto 0);
		reg_1 <= resize(x_in,reg_1'length);
	--	y_dec <= y; 
	end case;
	else if (current_state = done_state) or (reset ='1') then
		reg <= "00000000000000000000";
	
	else if (sel = "00") then 
			reg <= reg + resize(x_in,reg'length);	--reg=reg + x
	else if (sel = "10") then
			reg <=reg - resize(x_in, reg'length);	--reg = reg - x 
	else if (sel = "01") then
		if  (y ="000") then				--reg = reg*X ; 
			reg <= "00000000000000000001" ;
		else if (current_state = step1) then
			reg <= reg_1;
		else
			reg <=resize(reg*x_in,reg'length) ;
		end if;
		end if;
	
	end if;
	end if;
	end if;
	end if;
	end if;	
	end if;
	
end process;
--decrement_Y: process (clk,done) is
--begin
--if (y_dec = "000") then
--	done <= '1';
--else 
----y_dec<= resize(y_dec - 1,y_dec'length);	--resize
--y_dec <= y_dec - "001";
--end if;
--
--end process;

end architecture ;

--Clk