library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of char_location_tb is
   component char_location
      port(clk         : in  std_logic;
           start       : in  std_logic;
           velocity_x  : in  std_logic_vector(7 downto 0);
           vsync       : in  std_logic;
           platform_vector : in  std_logic_vector(255 downto 0);
           death       : out std_logic;
           x           : out integer;
           y           : out integer);
   end component;
   signal clk         : std_logic;
   signal start       : std_logic;
   signal velocity_x  : std_logic_vector(7 downto 0);
   signal vsync       : std_logic;
   signal platform_vector : std_logic_vector(255 downto 0);
   signal death       : std_logic;
   signal x           : integer;
   signal y           : integer;
begin
   test: char_location port map (clk, start, velocity_x, vsync, platform_vector, death, x, y);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   start <= '0' after 0 ns,
	    '1' after 10 ns,
	    '0' after 20 ns;
   death <= '0' after 10 ns;
   velocity_x <= "11100001" after 0 ns; 
   vsync <= '0' after 0 ns,
            '1' after 300 ns when vsync /= '1' else '0' after 300 ns;
   platform_vector <= (32 => '1', 224 => '1', 192 => '1', 160 => '1', 128 => '1', 96 => '1', 64 => '1', 0 => '1', others => '0')  after 0 ns;


end behaviour;

