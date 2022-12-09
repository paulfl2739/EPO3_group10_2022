library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity final_testbench is
end entity final_testbench;

architecture structural of final_testbench is

component l3gd20h_driver is
	port(
		clk:		in	std_logic; --25MHz main clock
		reset:		in	std_logic;
		start_switch:	in	std_logic; --used to keep sdi protocol off during 10ms gyro startup time
		drdy:		in	std_logic; --output from gyro when new data is ready to be read off
		sdo:		in	std_logic;

		cs:		out	std_logic;
		spc:		out	std_logic;
		sdi:		out	std_logic;
		data_ready:	out	std_logic;
		gyro_data:	out	std_logic_vector(7 downto 0)
		);
		

end component l3gd20h_driver;

signal clk, reset, start_switch, drdy, sdo, sdi, spc, cs,  data_ready:						std_logic;
signal gyro_data:												std_logic_vector(7 downto 0);

begin

	clk <=
		'1' after 0 ns,
		'0' after 20 ns when clk /= '0' else '1' after 20 ns;
	reset <=
		'1' after 0 ns,
		'0' after 100 ns;
	
	start_switch <=
			'0' after 0 ns,
			'1' after 500 ns;

	drdy <=
			'0' after 0 ns,
			'1' after 42000 ns,
			'0' after 48000 ns;

	sdo <=		
			'0' after 0 ns,	
			'1' after 48900 ns,	
			'0' after 50500 ns,
			'1' after 52100 ns,
			'0' after 52900 ns,
			'1' after 53700 ns,
			'0' after 54500 ns;

lb1: l3gd20h_driver port map(
				clk		=>		clk,
				reset		=>		reset,
				start_switch	=>		start_switch,
				drdy		=>		drdy,
				sdo		=>		sdo,

				cs		=>		cs,
				spc		=>		spc,
				sdi		=>		sdi,
				data_ready	=>		data_ready,
				gyro_data	=>		gyro_data
			);
			
end architecture structural;