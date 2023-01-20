library IEEE;
use IEEE.std_logic_1164.ALL;

entity vhsync is
   port(clk    : in  std_logic;
        reset : in  std_logic;
        hsync  : out std_logic;
        vsync  : out std_logic);
end vhsync;

