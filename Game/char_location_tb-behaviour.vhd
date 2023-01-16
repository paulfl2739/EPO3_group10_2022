library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of char_location_tb is
   component char_location
      port(clk : in  STD_LOGIC;
              reset : in  STD_LOGIC;
              frame_passed : in  STD_LOGIC;
              start : in  STD_LOGIC;
	      collision : in std_logic;
              velocity_x : in  std_logic_vector(7 downto 0);
              x : out  std_logic_vector(7 downto 0);
              y : out  std_logic_vector(7 downto 0);
              death : out  STD_LOGIC := '0');
   end component;
   signal clk : STD_LOGIC;
   signal reset : STD_LOGIC;
   signal frame_passed : STD_LOGIC;
   signal start : STD_LOGIC;
   signal collision : std_logic;
   signal velocity_x : std_logic_vector(7 downto 0);
   signal x : std_logic_vector(7 downto 0);
   signal y : std_logic_vector(7 downto 0);
   signal death : STD_LOGIC;
begin
   test: char_location port map (clk, reset, frame_passed, start, collision, velocity_x, x, y, death);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '0' after 0 ns,
	    '0' after 100 ns,
            '0' after 1080 ns;
   frame_passed <=  '0' after 0 ns,
          '1' after 30 ns when frame_passed /= '1' else '0' after 30 ns;
   start <= '0' after 0 ns,
		'1' after 10 ns,
		'0' after 70 ns;
   velocity_x <= "01011010";
   collision <= '0' after 0 ns,
		'1' after 200 ns,
		'0' after 275 ns,
		'1' after 2800 ns,
		'0' after 2875 ns;
end behaviour;


