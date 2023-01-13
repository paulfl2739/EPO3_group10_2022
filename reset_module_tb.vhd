library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reset_module_tb is
end entity reset_module_tb;

architecture structural of reset_module_tb is

component reset_module is
	port (
		clk:		in	std_logic;
		reset:		in	std_logic;
		clk60hz: 	in	std_logic;
		
		internal_reset: out	std_logic
);

end component reset_module;

signal clk, reset, clk60hz, internal_reset: std_logic;

begin

	clk <=
		'1' after 0 ns,
		'0' after 20 ns when clk /= '0' else '1' after 20 ns;
	reset <=
		'1' after 0 ns,
		'0' after 100 ns;
	
	clk60hz <=
			'1' after 0 ms,
			'0' after 8 ms when clk60hz /= '0' else '1' after 8 ms;

lb1: reset_module port map(
				clk		=>	clk,
				reset		=>	reset,
				clk60hz		=>	clk60hz,

				internal_reset  =>	internal_reset
			);

end architecture structural;
