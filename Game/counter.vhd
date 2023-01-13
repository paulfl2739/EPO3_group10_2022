library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter is
   port(clk       : in  std_logic;
        death     : in std_logic;
        update : out std_logic);
end counter;

