library IEEE;
use IEEE.std_logic_1164.ALL;

entity control is
   port(start         : in  std_logic;
        clk           : in  std_logic;
        reset         : in  std_logic;
        v_sync_clk    : in  std_logic;
	velocity_x    : in std_logic_vector(7 downto 0);
        x             : out integer;
        y             : out integer;		
	platform_grid : out std_logic_vector(255 downto 0);
	death	      : out std_logic;
	pixel_count_out : out std_logic_vector(4 downto 0);
	player_score  : out	integer);
end entity control;

