library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
architecture structural of control is
	component char_location
  		port(	clk   : in  std_logic;
        			start : in  std_logic;
			velocity_x	: in std_logic_vector(7 downto 0);
			v_sync_clk	: in std_logic;
			platform_vector: in std_logic_vector (255 downto 0);
			death	: out std_logic;
			x	: out integer;
			y	: out integer);
		end component;
	
	component platform
		port(	clk    : in  std_logic;
        	     		reset  : in  std_logic;
        	     		start   : in  std_logic;
		     	update : in std_logic;
		     	player_score : out integer;
        	     		grid : out std_logic_vector(255 downto 0));
	end component;
	
	component counter
		port(	clk       : in  std_logic;
        		     	death	: in std_logic;
			update  : out std_logic);
	end component;

	component offset_counter
		port( clk	: in std_logic;
			death : in std_logic;
			count	: out std_logic_vector( 4 downto 0));
	end component;
	signal intermediate_update: std_logic;
	signal intermediate_death: std_logic;
	signal intermediate_grid: std_logic_vector(255 downto 0);
BEGIN
a1: counter port map(clk => clk,
         	 death => intermediate_death,
	   update => intermediate_update);

a2: offset_counter port map( clk => clk,
			 death => intermediate_death,
			 count => pixel_count_out);
				
a3: platform port map(clk => clk,
		  start => start,
		  reset => reset,
		  update => intermediate_update,
		  player_score => player_score,
		  grid =>  intermediate_grid);
	
a4: char_location port map(clk => clk,
		       start => start,
		       velocity_x => velocity_x,
		       v_sync_clk => v_sync_clk,
		       platform_vector => intermediate_grid,
		       death => death,
		       x => x,
		       y => y);

platform_grid <= intermediate_grid;	
end architecture structural;
