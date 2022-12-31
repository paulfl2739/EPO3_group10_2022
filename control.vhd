library IEEE;
use IEEE.std_logic_1164.ALL;

entity control is
   port(start         : in  std_logic;
        clk           : in  std_logic;
        reset         : in  std_logic;
        v_sync_clk    : in  std_logic;
        x             : in integer;
        y             : in integer;
	platform_grid : in  std_logic_vector(255 downto 0);		
	x_out		: out integer;
	y_out		: out integer;
	platform_grid_out : out std_logic_vector(255 downto 0);
        v_sync_clk_out    : out std_logic;
	death		: out std_logic); 
end control;

