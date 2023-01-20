library IEEE;
use IEEE.std_logic_1164.ALL;

entity galois is
   port(clk : in  std_logic;
	reset : in std_logic;
	platforms : out std_logic_vector(7 downto 0));
end galois;

