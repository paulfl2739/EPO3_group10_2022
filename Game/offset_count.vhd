library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
entity offset_count is
  Port ( clk : in STD_LOGIC;
         death : in STD_LOGIC;
         count : out std_logic_vector(4 downto 0));
end entity;



