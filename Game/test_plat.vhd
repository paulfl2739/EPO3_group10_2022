library IEEE;
use IEEE.std_logic_1164.ALL;

entity test_plat is
   port(clk    : in  std_logic;
        reset  : in  std_logic;
	shift  : in  std_logic;
	start  : in  std_logic;
	death  : in  std_logic;
        output : out std_logic_vector(255 downto 0));
end test_plat;

