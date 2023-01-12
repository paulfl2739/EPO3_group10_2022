library IEEE;
use IEEE.std_logic_1164.ALL;

entity char_location is
   port(clk         : in  std_logic;
        start       : in  std_logic;
	--reset	    : in  std_logic;
        velocity_x  : in  std_logic_vector(7 downto 0);
        vsync       : in  std_logic;
        platform_vector : in  std_logic_vector(255 downto 0);
        death       : out std_logic;
        x           : out integer; -- Update to 9 bit vector for hardware
        y           : out integer); -- Aswell
end char_location;
