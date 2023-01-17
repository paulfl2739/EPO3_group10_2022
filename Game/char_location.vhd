library IEEE;
use IEEE.std_logic_1164.ALL;

entity char_location is
   port(clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           frame_passed : in  STD_LOGIC;
           start : in  STD_LOGIC;
	   collision : in STD_LOGIC;
           velocity_x : in  std_logic_vector(7 downto 0);
           x : out  std_logic_vector(7 downto 0);
           y : out  std_logic_vector(7 downto 0);
           death : out  STD_LOGIC := '1');
end char_location;


