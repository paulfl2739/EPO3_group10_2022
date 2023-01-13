library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of test_plat_tb is
   component test_plat
      port(clk    : in  std_logic;
           reset  : in  std_logic;
	   shift  : in  std_logic;
	   start  : in  std_logic;
	   death  : in  std_logic;
           output : out std_logic_vector(255 downto 0));
   end component;
   signal clk    : std_logic;
   signal reset  : std_logic;
   signal shift  : std_logic;
   signal start  : std_logic;
   signal death  : std_logic;
   signal output : std_logic_vector(255 downto 0);
begin
   test: test_plat port map (clk, reset, shift, start, death, output);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns,
	    '0' after 120 ns,
	    '0' after 580 ns,
	    '0' after 620 ns;
   shift <= '0' after 0 ns,
	    '1' after 250 ns,
	    '0' after 270 ns,
            '1' after 550 ns,
 	    '0' after 570 ns,
	    '1' after 850 ns,
	    '0' after 870 ns,
	    '1' after 1050 ns,
	    '0' after 1070 ns;
   start <= '1' after 0 ns,
	    '0' after 10 ns;
   death <= '0' after 0 ns;
end behaviour;

