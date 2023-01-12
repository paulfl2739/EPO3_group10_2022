library IEEE;
use IEEE.std_logic_1164.ALL;

entity platform is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
        start        : in  std_logic;
        counter      : in  std_logic;
        player_score : out integer;
        grid         : out std_logic_vector(255 downto 0));
end platform;
