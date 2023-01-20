library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of platform_count_tb is
   component platform_count
      port(clk : in  std_logic;
   	reset : in std_logic;
   	column : out std_logic_vector(2 downto 0));
   end component;
   signal clk : std_logic;
   signal reset : std_logic;
   signal column : std_logic_vector(2 downto 0);
begin
   test: platform_count port map (clk, reset, column);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
end behaviour;

