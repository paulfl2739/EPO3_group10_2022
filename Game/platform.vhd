library IEEE;
use IEEE.std_logic_1164.ALL;

entity platform is
   port(clk : in  std_logic;
        reset : in std_logic;
        shift : in std_logic;
        start : in std_logic;
        grid : out std_logic_vector(255 downto 0)
   );
end platform;

