library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spc_clockgen is
   port(clk     : in  std_logic;
        reset   : in  std_logic;
        spc_clk : out std_logic);
end spc_clockgen;

