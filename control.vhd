library IEEE;
use IEEE.std_logic_1164.ALL;

entity control is
   port(start         : in  std_logic;
        clk           : in  std_logic;
        reset         : in  std_logic;
        v_sync_clk    : in  std_logic;
        x             : out integer;
        y             : out integer;		
	platform_grid : out std_logic_vector(255 downto 0);
	death		: out std_logic); 
end control;

