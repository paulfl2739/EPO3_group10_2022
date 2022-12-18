library IEEE;
use IEEE.std_logic_1164.ALL;

entity full_register is
   port(clk    : in  std_logic;
        reset  : in  std_logic;
	inputt : in std_logic_vector(255 downto 0);
        start   : in  std_logic;
        lfsr : out std_logic_vector(255 downto 0));
end full_register;

