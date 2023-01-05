library IEEE;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_1164.ALL;

entity char_location is
   port(clk   : in  std_logic;
        start : in  std_logic;
	velocity_x	: in	signed(7 downto 0);
	vsync	: in std_logic;
	platform_vector: in std_logic_vector (255 downto 0);
	x	: out integer;
	y	: out integer);
end char_location;

