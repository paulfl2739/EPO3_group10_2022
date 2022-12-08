library IEEE;
use IEEE.std_logic_1164.ALL;

entity platform is
   port(clk     : in  std_logic;
        reset   : in  std_logic;
	start	: in std_logic;
        row: in std_logic_vector(4 downto 0);
	total_vector : in std_logic_vector(29 downto 0); --randomm
	platform_vector : out std_logic_vector(7 downto 0));
end platform;

