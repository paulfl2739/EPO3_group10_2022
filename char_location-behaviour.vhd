library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of char_location is
x_new signal std_logic;
y_new signal std_logic;
constant start_x : integer := 170;
constant	start_y : integer := 100
begin
process(clk)
begin
if (rising_edge(clk) and start = '1')
	then
		x <= start_x;
		y <= start_y;
else
		x <= x_new;
		y <= y_new;


end behaviour;

