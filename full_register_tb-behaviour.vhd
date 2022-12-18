library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of full_register_tb is
   component full_register
      port(clk    : in  std_logic;
           reset  : in  std_logic;
	   inputt : in std_logic_vector(255 downto 0);
           start   : in  std_logic;
           lfsr : out std_logic_vector(255 downto 0));
   end component;
   signal clk    : std_logic;
   signal reset  : std_logic;
   signal start   : std_logic;
   signal lfsr : std_logic_vector(255 downto 0);
   signal inputt : std_logic_vector(255 downto 0);
begin
   test: full_register port map (clk, reset, inputt, start, lfsr);
   inputt <= "0011001101001010110001011001010101111110100111100001111100100101100110000010001100011100001101110100010000111010110011001111001101100110000010110100010100100000100011000011001111010101010101010001101101001000001001000011110001111001011010100011000001101101" after 0 ns;
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 20 ns,
            '0' after 80 ns;
   start <= '0' after 0 ns,
	    '1' after 80 ns,
	    '0' after 100 ns;
end behaviour;

