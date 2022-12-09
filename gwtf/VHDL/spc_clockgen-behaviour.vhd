library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture behaviour of spc_clockgen is

type counter_state is (reset_state, count_1, count_2, count_3, count_4, count_5, count_6, count_7, count_8, count_9, count_10, count_11, count_12, count_13, count_14, count_15, count_16, count_17, count_18, count_19, count_20);

signal state, new_state		:	counter_state;


begin

	process (clk, reset)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				state <= reset_state;
			else
				state <= new_state;
			end if;
		end if;
	end process;
	
	process (state)
	begin
		case state is
			when reset_state =>
			spc_clk		<= '0';
			
			new_state <= count_1;
			
			when count_1 =>
			spc_clk 	<= '0';
			
			new_state <= count_2;

			when count_2 =>
			spc_clk 	<= '0';
			
			new_state <= count_3;

			when count_3 =>
			spc_clk 	<= '0';
			
			new_state <= count_4;

			when count_4 =>
			spc_clk 	<= '0';

			new_state <= count_5;

			when count_5 =>
			spc_clk 	<= '0';
			
			new_state <= count_6;
			
			when count_6 =>
			spc_clk 	<= '0';
			
			new_state <= count_7;

			when count_7 =>
			spc_clk 	<= '0';
			
			new_state <= count_8;

			when count_8 =>
			spc_clk 	<= '0';
			
			new_state <= count_9;

			when count_9 =>
			spc_clk 	<= '0';
			
			new_state <= count_10;

			when count_10 =>
			spc_clk 	<= '1';
			
			new_state <= count_11;

			when count_11 =>
			spc_clk 	<= '1';
			
			new_state <= count_12;

			when count_12 =>
			spc_clk 	<= '1';
			
			new_state <= count_13;

			when count_13 =>
			spc_clk 	<= '1';
			
			new_state <= count_14;

			when count_14 =>
			spc_clk 	<= '1';
			
			new_state <= count_15;

			when count_15 =>
			spc_clk 	<= '1';
			
			new_state <= count_16;

			when count_16 =>
			spc_clk 	<= '1';
			
			new_state <= count_17;

			when count_17 =>
			spc_clk 	<= '1';
			
			new_state <= count_18;

			when count_18 =>
			spc_clk 	<= '1';
			
			new_state <= count_19;

			when count_19 =>
			spc_clk 	<= '1';
			
			new_state <= count_20;

			when count_20 =>
			spc_clk 	<= '1';
			
			new_state <= count_1;
		end case;
	end process;
end architecture behaviour;
