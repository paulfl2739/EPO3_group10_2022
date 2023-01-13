library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of testing_tb is
   component testing
      port(clk : in  STD_LOGIC;
              reset : in  STD_LOGIC;
              frame_passed : in  STD_LOGIC;
              start : in  STD_LOGIC;
	      collision : in std_logic;
              velocity_x : in  std_logic_vector(7 downto 0);
              x : out  INTEGER range 0 to 480 := 0;
              y : out  INTEGER range 0 to 640 := 0;
              death : out  STD_LOGIC := '0');
   end component;
   signal clk : STD_LOGIC;
   signal reset : STD_LOGIC;
   signal frame_passed : STD_LOGIC;
   signal start : STD_LOGIC;
   signal collision : std_logic;
   signal velocity_x : std_logic_vector(7 downto 0);
   signal x : INTEGER range 0 to 480;
   signal y : INTEGER range 0 to 640;
   signal death : STD_LOGIC;
begin
   test: testing port map (clk, reset, frame_passed, start, collision, velocity_x, x, y, death);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '0' after 0 ns,
	    '1' after 1000 ns,
            '0' after 1080 ns;
   frame_passed <=  '0' after 0 ns,
          '1' after 300 ns when frame_passed /= '1' else '0' after 300 ns;
   start <= '0' after 0 ns;
   velocity_x <= (others => '0');
   collision <= '0' after 0 ns,
		'1' after 200 ns,
		'0' after 275 ns,
		'1' after 800 ns,
		'0' after 875 ns;
end behaviour;

