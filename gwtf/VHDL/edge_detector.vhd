library IEEE;
use IEEE.std_logic_1164.ALL;

entity edgedetector is
   port(clk     : in  std_logic;
        spc_clk : in  std_logic;
        edge    : out std_logic);
end edgedetector;

