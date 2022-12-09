library IEEE;
use IEEE.std_logic_1164.ALL;

entity full_register is
   port(clk    : in  std_logic;
        reset  : in  std_logic;
        dead   : in  std_logic;
        column : out std_logic);
end full_register;

