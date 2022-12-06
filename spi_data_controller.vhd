library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_controller is
	port (
		enable		:	in	std_logic;	--to turn on/off the driver
		clk		:	in	std_logic;
		reset		:	in	std_logic;
		spc_clk		:	in	std_logic;
		prev_spc_clk	:	in	std_logic;
		cycle		:	in	std_logic_vector(3 downto 0);  
		
		sdi_in		:	out	std_logic	--the sequence of bits sent to the chip for proper readout

	);
end entity data_controller;

architecture behaviour of data_controller is

type configuration_state is (reset_state, start_transmission

--create fsm which updates at falling edge of spc_clk, like the main fsm. 

begin

	process(clk, reset, spc_clk) 
	begin
		if (reset = '1') then
			state		<=	reset_state;
		else
			if (clk'event and clk = '1') then
				state 		<= 	new_state;
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