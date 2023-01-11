library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter is
   port(clk       : in  std_logic;
        reset     : in  std_logic;
        count_out : out std_logic_vector(18 downto 0));
        pixel_count: out integer;
end counter;

