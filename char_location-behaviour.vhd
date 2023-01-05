library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of char_location is

--component char_location is
  -- port(clk   : in  std_logic;
    --    start : in  std_logic;
--	velocity_x	: in	signed(7 downto 0);
--	vsync	: in std_logic;
--	x	: out integer;
--	y	: out integer);
--end component char_location;


signal x_new : integer;
signal y_new : integer;
signal x_pos : integer;
signal y_pos : integer;
signal V_y_1000: integer := 16000;
signal V_y : integer;

constant start_x : integer := 240;
constant start_y : integer := 100;
constant gravity : integer := 375;

-- Logic for when character goes all the way to right or left of the screen
-- Character reaches top of the screen


begin
process(clk)
begin
if (rising_edge(clk)) then
	if(start = '1') then 
		x_pos <= start_x;
		y_pos <= start_y;
	elsif (vsync = '1') then
		x_pos <= x_new;
		y_pos <= y_new;

	end if;
end if;
end process;


process(vsync)
begin
if(rising_edge(vsync)) then  -- Signal from VGA that denotes whether a frame has been successfully rendered
	
	-- If character hits a platform, then we need to start from a higher y_velocity. We need to make it 160000 everytime it jumps.
	V_y_1000 <= V_y_1000 - gravity;
	V_y <= V_y_1000/1000;
	
	if (x_pos > '319') then
		-- Velocity x is in the right direction
		if (velocity_x(7) = '0') then
			x_new <= x_new + to_integer(velocity_x) - 320;
		else
			x_new <= x_new + to_integer(velocity_x);
	elsif (x_pos < '1') then
		-- Velocity x is in the left direction
		if (velocity_x(7) = '1') then
			x_new <= x_new + to_integer(velocity_x) + 320;
		else
			x_new <= x_new + to_integer(velocity_x);
	else
		x_new <= x_new + to_integer(velocity_x);
	end if;
	y_new <= y_new + V_y;
	
else
	x_new <= x_new ;
	y_new <= y_new ;
end if;
end process;

--a1: char_location port map( x_pos => x,
--	 y_pos => y,
--	clk => clk,
--	start => start,
--	velocity_x => velocity_x,
--	vsync => vsync);

end behaviour;


	
