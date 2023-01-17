library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
architecture structural of control is
	component char_location
  		port(	clk   : in  std_logic;
			reset : in std_logic;
			frame_passed : in std_logic;
        			start : in  std_logic;
			collision : in std_logic;
			velocity_x	: in std_logic_vector(7 downto 0);
			x	: out std_logic_vector(8 downto 0);
			y	: out std_logic_vector(9 downto 0);
			death	: out std_logic);
		end component;
	
	component platform
		port(	clk    : in  std_logic;
        	     		reset  : in  std_logic;
        	     		shift   : in  std_logic;
		     	start : in std_logic;
        	     		grid : out std_logic_vector(255 downto 0));
	end component;
	
	component counter
		port(	clk       : in  std_logic;
        		     	death	: in std_logic;
			update  : out std_logic);
	end component;

	component offset_count
		port( clk	: in std_logic;
			death : in std_logic;
			count	: out std_logic_vector( 4 downto 0));
	end component;
	signal intermediate_update: std_logic;
	signal intermediate_death: std_logic;
BEGIN
a1: counter port map(clk => clk,
         	 death => intermediate_death,
	   update => intermediate_update);

a2: offset_count port map( clk => clk,
			 death => intermediate_death,
			 count => pixel_count_out);
				
a3: platform port map(clk => clk,
		  reset => reset,
		  shift => intermediate_update,
		  start => start,
		  grid =>  platform_grid);
	
a4: char_location port map(clk => clk,
			   reset => reset,
			   frame_passed => frame_passed,
		      	   start => start,
			collision => collision,
		       velocity_x => velocity_x,
		       death => intermediate_death,
		       x => x,
		       y => y);
-- Here we find the output signals of the control top level entity
death <= intermediate_death;
end architecture structural;

