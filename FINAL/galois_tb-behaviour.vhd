library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of galois_tb is
   component galois
      port(clk : in  std_logic;
   	reset : in std_logic;
   	platforms : out std_logic_vector(7 downto 0));
   end component;
   signal clk : std_logic;
   signal reset : std_logic;
   signal platforms : std_logic_vector(7 downto 0);
begin
   test: galois port map (clk, reset, platforms);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 40 ns;
end behaviour;

