library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of char_location_tb is
   component char_location
      port(clk   : in  std_logic;
           start : in  std_logic;
   	velocity_x	: in	signed(7 downto 0);
   	vsync	: in std_logic;
   	x	: out integer;
   	y	: out integer;
   	platformjanee	:	out std_logic);
   end component;
   signal clk   : std_logic;
   signal start : std_logic;
   signal velocity_x	: signed(7 downto 0);
   signal vsync	: std_logic;
   signal x	: integer;
   signal y	: integer;
   signal platformjanee	: std_logic;
begin
   test: char_location port map (clk, start, velocity_x, vsync, x, y, platformjanee);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   start <= '1' after 20 ns,
	'0' after 40 ns;
   velocity_x <= "10000000" after 0 ns;
   vsync <= '0' after 0 ns,
	'1' after 20 ns when clk /= '1' else '0' after 20 ns;
end behaviour;

