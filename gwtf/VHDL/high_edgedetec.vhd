library IEEE;
use IEEE.std_logic_1164.ALL;

entity high_edgedetec is
   port(clk       : in  std_logic;
        spc_clk   : in  std_logic;
        high_edge : out std_logic);
end high_edgedetec;

