library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reset_wrapper is
	port(
		clk:		in	std_logic; --25mhz main clock
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
end entity reset_wrapper;

architecture structural of reset_wrapper is

signal internal_reset, clk60hz_intern:		std_logic;

component l3gd20h_driver is
	port(
		clk:		in	std_logic; --25mhz main clock
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

component reset_module is
	port (
		clk:		in	std_logic;
		reset:		in	std_logic;
		clk60hz: 	in	std_logic;
		
		internal_reset: out	std_logic
);

end component reset_module;

component clk60hz_gen is
	port (
		clk		:	in	std_logic; -- 25 MHz
		reset		:	in	std_logic;
		
		clk60hz		:	out	std_logic 
	);
end component clk60hz_gen;

begin

lb0: l3gd20h_driver port map(
				clk		=>		clk,
				reset		=>		internal_reset,
				start_switch	=>		start_switch,
				drdy		=>		drdy,
				sdo		=>		sdo,

				cs		=>		cs,
				spc		=>		spc,
				sdi		=>		sdi,
				data_ready	=>		data_ready,
				gyro_data	=>		gyro_data
			);

lb1: reset_module port map(
				clk		=>		clk,
				reset		=>		reset,
				clk60hz		=>		clk60hz_intern,

				internal_reset	=>		internal_reset 
			);

lb2: clk60hz_gen port map(
				clk		=>		clk,
				reset		=>		reset,

				clk60hz		=>		clk60hz_intern
			);
end architecture;


	


	




