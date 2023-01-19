library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity platform_count is
   port(clk : in  std_logic;
	reset : in std_logic;
	column : out std_logic_vector(2 downto 0));
end platform_count;

