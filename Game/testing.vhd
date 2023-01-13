library IEEE;
use IEEE.std_logic_1164.ALL;

entity testing is
   port(clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           frame_passed : in  STD_LOGIC;
           start : in  STD_LOGIC;
	   collision : in STD_LOGIC;
           velocity_x : in  std_logic_vector(7 downto 0);
           x : out  INTEGER range 0 to 480 := 240;
           y : out  INTEGER range 0 to 640 := 100;
           death : out  STD_LOGIC := '0');
end testing;

