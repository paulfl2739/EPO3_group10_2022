library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main_testbench is
end entity main_testbench;

architecture structural of main_testbench is

component driver is
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
end component driver;


component spc_clockgen is
	port (
		clk		:	in	std_logic;
		reset		:	in	std_logic;
		
		spc_clk		:	out	std_logic
	);
end component spc_clockgen;

component edgedetector is
   port (
      clk 	     :in std_logic;
      spc_clk        :in std_logic;
      edge 	     :out std_logic
   );
end component edgedetector;

component high_edgedetector is
   port (
      clk 	     	:in std_logic;
      spc_clk        	:in std_logic;
      high_edge		:out std_logic
   );
end component high_edgedetector;

   component spi_rom is
      port(
		address:	in	 std_logic_vector(2 downto 0);
           	spi_data: 	out 	 std_logic_vector(15 downto 0)
	);
   end component spi_rom; 

component spi_data_controller is
	port (
		clk		:	in	std_logic;
		reset		:	in	std_logic;
		start_switch	:	in	std_logic;
		
		data_ready	:	in	std_logic; --output from spi driver when new data can be sent/read
		drdy		:	in	std_logic; --output from gyro chip, when chip has calculated new data this pin is pulled high.

		enable		:	out	std_logic;	--to turn on/off the drive
		sdi_select	:	out	std_logic_vector(2 downto 0)
	);
end component spi_data_controller;

signal enable, clk, reset, spc_clk_out, sdi, spc, cs, edge, high_edge, prev_spc_clk, sdo, data_ready, drdy, start_switch:	std_logic;
signal cycle, address:														std_logic_vector(2 downto 0);
signal sdi_in:															std_logic_vector(15 downto 0);
signal gyro_data:														std_logic_vector(7 downto 0);

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


		

lb1: spc_clockgen port map(
		clk		=>	clk,
		reset		=>	reset,
		spc_clk		=>	spc_clk_out
		);

lb2: driver port map(
		enable		=>		enable,
		clk		=>		clk,
		reset		=>		reset,
		spc_clk		=>		spc_clk_out,
		edge		=>		edge,
		high_edge	=>		high_edge,
		sdi_in		=>		sdi_in,
		sdo		=>		sdo,
		
		sdi		=>		sdi,
		spc		=>		spc,
		cs		=>		cs,
		cycle		=>		cycle,
		gyro_data	=>		gyro_data,
		data_ready	=>		data_ready,
		prev_spc_clk	=>		prev_spc_clk
		);

lb3: edgedetector port map(
		clk		=>		clk,
		spc_clk		=>		spc_clk_out,
		edge		=>		edge
		); 

--lb4: spc_prev_gen port map(
		--clk		=>		clk,
		--reset		=>		reset,
		--spc_clk		=>		spc_clk_out,
		--high_edge	=>		high_edge,

		--spc_prev_clk	=>		spc_prev_clk_out
		--);

lb5: high_edgedetector port map(
		clk		=>		clk,
		spc_clk		=>		spc_clk_out,
		high_edge	=>		high_edge
		);

lb6: spi_rom port map(
		address		=>		address,
		spi_data	=>		sdi_in
		);

lb7: spi_data_controller port map(
			clk		=>		clk,
			reset		=>		reset,
			start_switch	=>		start_switch,
			
			data_ready	=>		data_ready,
			drdy		=>		drdy,

			enable		=>		enable,
			sdi_select	=>		address
			);

		
end architecture structural;
