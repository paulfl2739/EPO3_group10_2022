library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity driver is
	port (
		enable		:	in	std_logic;	--every time enable is pulled high, one transmission cycle is executed.
		clk		:	in	std_logic;	--25MHz chip clock
		reset		:	in	std_logic;	--Meant to be pulled high at the beginning
		spc_clk		:	in	std_logic;	--<10 MHz clk Rising edge synced to falling edge of clk, falling edge sinced to rising edge of clk.
		edge		:	in	std_logic;	--goes high whenever a falling edge of the spc_clk occurs, not used in this design
		high_edge	:	in	std_logic;	--inverse operation of above signal
		sdi_in		:	in	std_logic_vector(15 downto 0); --sequence of sdi bits needed for the current transmission cycle
		sdo		:	in	std_logic; --Data output from gyroscope
		--sdi_select	:	in	std_logic_vector(2 downto 0); --spi data controller sends an address when this module is finished
		
		sdi		:	out	std_logic;	--the sequence of bits sent to the chip for proper readout
		spc		:	out	std_logic;	--max 10MHz 
		cs		:	out	std_logic;	--when low, data is transmitted
		cycle		:	out	std_logic_vector(2 downto 0); --this vector will indicate which iteration of register writing is currently happening, it will be used in component register controller to send the right bits to this component.
		gyro_data	:	out	std_logic_vector(7 downto 0); --neat vector containing angular data
		data_ready	:	out	std_logic; --pulled high whenever gyro_data is correctly written
		prev_spc_clk	:	out	std_logic
	);
end entity driver;

architecture behaviour of driver is

type configuration_state is (reset_state, waiting, start_transmission, ms_state, address_0, address_1, address_2, address_3, address_4, address_5, data_7_read, data_7_exit, data_6_read, data_6_exit, data_5_read, data_5_exit, data_4_read, data_4_exit, data_3_read, data_3_exit, data_2_read, data_2_exit, data_1_read, data_1_exit, data_0_read, data_0_exit);

signal state, new_state:				configuration_state;
signal count, new_count:				unsigned(2 downto 0 );
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

	process(state, enable, spc_clk, count, prev_spc_clk, sdi_in) --we want to take count out so that this fsm only outputs what is sent by the spi data controller.
	begin
		case state is
			when reset_state =>
				cs		<=	'1';
				spc		<=	'1';

				sdi		<=	'0';
				gyro_data	<=	(others => '0');
				data_ready	<=	'1';
				new_count 	<= 	count; 
			

			if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then--remember spc clk value, old value 1 new value 0 

				new_state	<=	start_transmission; --go to start transmission when spc_clk 1 -> 0, 
				new_count 	<= 	count + 1; 
			else
				new_state	<=	reset_state;
				new_count	<=	count;
			end if;


			when start_transmission =>
				cs		<=	'0';
				spc		<=	spc_clk;

				sdi		<=	sdi_in(15);
				gyro_data	<=	(others => '0');
				data_ready	<=	'0';
			
			if (spc_clk = '0' and prev_spc_clk = '1') then
				new_state	<=	ms_state;
			end if;

				

			when ms_state =>
				cs		<=	'0';
				spc		<=	spc_clk;

				sdi		<=	sdi_in(14);
				gyro_data	<=	(others => '0');
				data_ready	<=	'0';
			
			if (spc_clk = '0' and prev_spc_clk = '1') then
				new_state	<=	address_5;
			end if;


			when address_5 =>
				cs		<=	'0';
				spc		<=	spc_clk;

				sdi		<=	sdi_in(13);
				gyro_data	<=	(others => '0');
				data_ready	<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	address_4;
				end if;

			when address_4 =>
				cs		<=	'0';
				spc		<=	spc_clk;

				sdi		<=	sdi_in(12);
				gyro_data	<=	(others => '0');
				data_ready	<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	address_3;
				end if;

			when address_3 =>
				cs		<=	'0';
				spc		<=	spc_clk;

				sdi		<=	sdi_in(11);
				gyro_data	<=	(others => '0');
				data_ready	<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	address_2;
				end if;

			when address_2 =>
				cs		<=	'0';
				spc		<=	spc_clk;

				sdi		<=	sdi_in(10);
				gyro_data	<=	(others => '0');
				data_ready	<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	address_1;
				end if;

			when address_1 =>
				cs		<=	'0';
				spc		<=	spc_clk;

				sdi		<=	sdi_in(9);
				gyro_data	<=	(others => '0');
				data_ready	<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	address_0;
				end if;

			when address_0 =>
				cs		<=	'0';
				spc		<=	spc_clk;

				sdi		<=	sdi_in(8);
				gyro_data	<=	(others => '0');
				data_ready	<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	data_7_read;
				end if;

			when data_7_read =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(7);
				gyro_data(7)		<=	sdo;

				data_ready		<=	'0';
			
				if (spc_clk = '1' and prev_spc_clk = '0') then
					new_state	<=	data_7_exit;
				end if;


			when data_7_exit =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(7);

				data_ready		<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	data_6_read;
				end if;

			when data_6_read =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(6);
				gyro_data(6)		<=	sdo;

				data_ready		<=	'0';
			
				if (spc_clk = '1' and prev_spc_clk = '0') then
					new_state	<=	data_6_exit;
				end if;


			when data_6_exit =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(6);

				data_ready		<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	data_5_read;
				end if;

			when data_5_read =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(5);
				gyro_data(5)		<=	sdo;

				data_ready		<=	'0';
			
				if (spc_clk = '1' and prev_spc_clk = '0') then
					new_state	<=	data_5_exit;
				end if;


			when data_5_exit =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(5);

				data_ready		<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	data_4_read;
				end if;

			when data_4_read =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(4);
				gyro_data(4)		<=	sdo;

				data_ready		<=	'0';
			
				if (spc_clk = '1' and prev_spc_clk = '0') then
					new_state	<=	data_4_exit;
				end if;


			when data_4_exit =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(4);

				data_ready		<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	data_3_read;
				end if;

			when data_3_read =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(3);
				gyro_data(3)		<=	sdo;

				data_ready		<=	'0';
			
				if (spc_clk = '1' and prev_spc_clk = '0') then
					new_state	<=	data_3_exit;
				end if;


			when data_3_exit =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(3);

				data_ready		<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	data_2_read;
				end if;


			when data_2_read =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(2);
				gyro_data(2)		<=	sdo;

				data_ready		<=	'0';
			
				if (spc_clk = '1' and prev_spc_clk = '0') then
					new_state	<=	data_2_exit;
				end if;


			when data_2_exit =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(2);

				data_ready		<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	data_1_read;
				end if;

			when data_1_read =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(1);
				gyro_data(1)		<=	sdo;

				data_ready		<=	'0';
			
				if (spc_clk = '1' and prev_spc_clk = '0') then
					new_state	<=	data_1_exit;
				end if;


			when data_1_exit =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(1);

				data_ready		<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	data_0_read;
				end if;

			when data_0_read =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(0);
				gyro_data(0)		<=	sdo;

				data_ready		<=	'0';
			
				if (spc_clk = '1' and prev_spc_clk = '0') then
					new_state	<=	data_0_exit;
				end if;


			when data_0_exit =>
				cs			<=	'0';
				spc			<=	spc_clk;

				sdi			<=	sdi_in(0);

				data_ready		<=	'0';
			
				if (spc_clk = '0' and prev_spc_clk = '1') then
					new_state	<=	waiting;
				end if;

			when waiting => --gyro_data must be remebered from previous states, thus it is undefined here
				cs		<=	'1';
				spc		<=	'1';

				sdi		<=	'0';
				data_ready	<=	'1';
				new_count 	<= 	count; 
			

			if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then--remember spc clk value, old value 1 new value 0 

				new_state	<=	start_transmission; 
				new_count 	<= 	count + 1; 
			else
				new_state	<=	waiting;
				new_count	<=	count;
			end if;

		end case;
	end process;
end architecture behaviour;









	