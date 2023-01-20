library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour_tb of vhsync_tb is
   component vhsync
      port(clk    : in  std_logic;
           reset : in  std_logic;
           hsync  : out std_logic;
           vsync  : out std_logic);
   end component;
   signal clk    : std_logic;
   signal reset : std_logic;
   signal hsync  : std_logic;
   signal vsync  : std_logic;
begin
   test: vhsync port map (clk, reset, hsync, vsync);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
end behaviour_tb;

