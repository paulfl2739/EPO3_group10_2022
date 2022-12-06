library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clockgen is
	port (
		clk		:	in	std_logic;
		reset		:	in	std_logic;
		
		tick10mhz	:	out	std_logic
	);
end entity clockgen;

architecture behaviour of clockgen is

type counter_state is (count_1, count_2, count_3, count_4, count_5);

signal state, new_state		:	counter_state;

begin

	process (clk, reset)
	begin
		if (clk'event) then
			if (reset = '1') then
				state <= count_1;
			else
				state <= new_state;
			end if;
		end if;
	end process;
	
	process (state)
	begin
		case state is
			when count_1 =>
			tick10mhz <= '1';
			
			new_state <= count_2;

			when count_2 =>
			tick10mhz <= '0';
			
			new_state <= count_3;

			when count_3 =>
			tick10mhz <= '0';
			
			new_state <= count_4;

			when count_4 =>
			tick10mhz <= '0';
			
			new_state <= count_5;

			when count_5 =>
			tick10mhz <= '1';
			
			new_state <= count_1;
		end case;
	end process;
end architecture behaviour;

	
