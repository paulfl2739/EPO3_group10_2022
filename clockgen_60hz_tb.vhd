library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clockgen_60hz_tb is
end entity clockgen_60hz_tb;

architecture structural of clockgen_60hz_tb is

component clk60hz_gen is
	port (
		clk		:	in	std_logic; -- 25 MHz
		reset		:	in	std_logic;
		
		clk60hz		:	out	std_logic 
	);
end component clk60hz_gen;

signal clk, reset, clk60hz: std_logic;

begin

	clk <=
		'1' after 0 ns,
		'0' after 20 ns when clk /= '0' else '1' after 20 ns;
	reset <=
		'1' after 0 ns,
		'0' after 100 ns;

lb1: clk60hz_gen port map(
				clk		=>	clk,
				reset		=>	reset,

				clk60hz		=>	clk60hz
			);

end architecture structural;
