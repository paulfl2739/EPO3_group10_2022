library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of control_tb is
   component control
      port(start         : in  std_logic;
           clk           : in  std_logic;
           reset         : in  std_logic;
           frame_passed    : in  std_logic;
   	velocity_x    : in std_logic_vector(7 downto 0);
   	collision	    : in std_logic;
           x             : out integer;
           y             : out integer;		
   	platform_grid : out std_logic_vector(255 downto 0);
   	death	      : out std_logic;
   	pixel_count_out : out std_logic_vector(4 downto 0));
   end component;
   signal start         : std_logic;
   signal clk           : std_logic;
   signal reset         : std_logic;
   signal frame_passed    : std_logic;
   signal velocity_x    : std_logic_vector(7 downto 0);
   signal collision	    : std_logic;
   signal x             : integer;
   signal y             : integer;
   signal platform_grid : std_logic_vector(255 downto 0);
   signal death	      : std_logic;
   signal pixel_count_out : std_logic_vector(4 downto 0);
begin
   test: control port map (start, clk, reset, frame_passed, velocity_x, collision, x, y, platform_grid, death, pixel_count_out);
   start <= '1' after 0 ns,
	    '0' after 80 ns;
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
   frame_passed <= '0' after 0 ns,
          		   '1' after 17 ms when frame_passed /= '1' else '0' after 17 ms;
   velocity_x <= "01001011";
   collision <= '0' after 0 ns,
		'1' after 100 ns,
		'0' after 120 ns,
		'1' after 250 ns,
		'0' after 300 ns;
end behaviour;

