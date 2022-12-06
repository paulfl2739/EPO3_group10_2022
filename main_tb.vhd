library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main_testbench is
end entity main_testbench;

architecture structural of main_testbench is

component driver is
	port (
		enable		:	in	std_logic;	--to turn on/off the driver
		clk		:	in	std_logic;
		reset		:	in	std_logic;
		spc_clk		:	in	std_logic;
		edge		:	in	std_logic;
		high_edge	:	in	std_logic;
		sdi_in		:	in	std_logic;
		
		sdi		:	out	std_logic;	--the sequence of bits sent to the chip for proper readout
		spc		:	out	std_logic;	--max 10MHz 
		cs		:	out	std_logic;	--when low, data is transmitted
		cycle		:	out	std_logic_vector(3 downto 0);
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

signal enable, clk, reset, spc_clk_out, sdi, spc, cs, edge, high_edge, sdi_in, prev_spc_clk:			std_logic;
signal	cycle:													std_logic_vector(3 downto 0);

begin
	clk <=
		'1' after 0 ns,
		'0' after 20 ns when clk /= '0' else '1' after 20 ns;
	reset <=
		'1' after 0 ns,
		'0' after 100 ns;
	enable	<= 
		'0' after 0 ns,
		'1' after 200 ns;

		

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
		
		sdi		=>		sdi,
		spc		=>		spc,
		cs		=>		cs,
		cycle		=>		cycle,
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
end architecture structural;
