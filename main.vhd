library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity driver is
	port (
		enable		:	in	std_logic;	--to turn on/off the driver
		clk		:	in	std_logic;
		reset		:	in	std_logic;
		spc_clk		:	in	std_logic;	--8.33bar MHz clk Rising edge synced to falling edge of clk, falling edge sinced to rising edge of clk.
		edge		:	in	std_logic;	--goes high whenever a falling edge of the spc_clk occurs
		high_edge	:	in	std_logic;
		sdi_in		:	in	std_logic;
		
		sdi		:	out	std_logic;	--the sequence of bits sent to the chip for proper readout
		spc		:	out	std_logic;	--max 10MHz 
		cs		:	out	std_logic;	--when low, data is transmitted
		cycle		:	out	std_logic_vector(3 downto 0); --this vector will indicate which iteration of register writing is currently happening, it will be used in component register controller to send the right bits to this component.
		prev_spc_clk	:	out	std_logic
	);
end entity driver;

architecture behaviour of driver is

type configuration_state is (reset_state, start_transmission, ms_state, adress_0, adress_1, adress_2, adress_3, adress_4, adress_5, data_7, data_6, data_5, data_4, data_3, data_2, data_1, data_0);

signal state, new_state:				configuration_state;
signal count, new_count:				unsigned(3 downto 0 );
--signal prev_spc_clk:					std_logic;


begin

	process(clk, reset, new_count) --simple 4 bit counter
	begin
		if (reset = '1') then
			count		<= 	(others => '0');
		else
			if (clk'event and clk = '1') then
				count	<= 	new_count;
			end if;
		end if;
	end process;

	cycle	<=	std_logic_vector(count);

	process(clk, reset, spc_clk) 
	begin
		if (reset = '1') then
			state		<=	reset_state;
			prev_spc_clk	<=	'0';
		else
			if (clk'event and clk = '1') then
				state 		<= 	new_state;
				prev_spc_clk	<=	spc_clk;
			end if;

		end if;
	end process;

	process(state, enable, spc_clk, edge, count, prev_spc_clk, sdi_in)
	begin
		case state is
			when reset_state =>
				cs		<=	'1';
				spc		<=	'1';

				sdi		<=	'0';
				new_count 	<= 	count; 
			
--s
			if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then--remember spc clk value, old value 1 new value 0 

				new_state	<=	start_transmission; --go to start transmission when spc_clk 1 -> 0, 
			else
				new_state	<=	reset_state;
			end if;


			when start_transmission =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
			if (edge = '1') then --this will increment the count, every time edge equals zero in this state, edge is used as it only becomes zero once in this state. 
				new_count 	<= 	count + 1; 
			else
				new_count	<=	count;
			end if;

			
			if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
				new_state	<=	ms_state;

			else
				new_state	<=	start_transmission;
			end if;

				

			when ms_state =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
				new_state	<=	adress_5;
			else
				new_state	<=	ms_state;
			end if;


			when adress_5 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'1';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	adress_4;
				else
					new_state	<=	adress_5;
				end if;

			when adress_4 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	adress_3;
				else
					new_state	<=	adress_4;
				end if;

			when adress_3 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	adress_2;
				else
					new_state	<=	adress_3;
				end if;

			when adress_2 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	adress_1;
				else
					new_state	<=	adress_2;
				end if;

			when adress_1 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	adress_0;
				else
					new_state	<=	adress_1;
				end if;

			when adress_0 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'1';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	data_7;
				else
					new_state	<=	adress_0;
				end if;

			when data_7 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	data_6;
				else
					new_state	<=	data_7;
				end if;

			when data_6 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	data_5;
				else
					new_state	<=	data_6;
				end if;

			when data_5 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	data_4;
				else
					new_state	<=	data_5;
				end if;

			when data_4 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	data_3;
				else
					new_state	<=	data_4;
				end if;

			when data_3 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	data_2;
				else
					new_state	<=	data_3;
				end if;


			when data_2 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	data_1;
				else
					new_state	<=	data_2;
				end if;

			when data_1 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	data_0;
				else
					new_state	<=	data_1;
				end if;

			when data_0 =>
				cs	<=	'0';
				spc	<=	spc_clk;

				sdi	<=	'0';
			
				if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then
					new_state	<=	reset_state;
				else
					new_state	<=	data_0;
				end if;





		end case;
	end process;
end architecture behaviour;








	