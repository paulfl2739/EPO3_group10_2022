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

-- Grid coordinates for the character location (used for platform collision)
signal character_column : integer;
signal character_row : integer;
signal platform_vector_X : std_logic_vector(31 downto 0);

constant start_x : integer := 240;
constant start_y : integer := 100;
constant gravity : integer := 375;

-- Logic for when character goes all the way to right or left of the screen
-- Character reaches top of the screen

begin
process(clk)
begin
if (rising_edge(clk)) then
	if(start = '1') then -- A game starts, here we initiate all necessary values
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
	
	-- Divide x_pos by 20 to find out what column the character is in 
	character_column <= x_pos / 20;
	
	-- Select the proper platform vector column
	case character_column is
		when 0 => platform_vector_X <= platform_vector(255 downto 224);
		when 1 => platform_vector_X <= platform_vector(223 downto 192);
		when 2 => platform_vector_X <= platform_vector(191 downto 160);
		when 3 => platform_vector_X <= platform_vector(159 downto 128);
		when 4 => platform_vector_X <= platform_vector(127 downto 96);
		when 5 => platform_vector_X <= platform_vector(95 downto 64);
		when 6 => platform_vector_X <= platform_vector(63 downto 32);
		when 7 => platform_vector_X <= platform_vector(31 downto 1);
		when others => platform_vector_X <= (others => '0');

	-- Divide y_pos by 40 to find out what row the character is in
	character_row <= y_pos / 40;
	
	-- If there is a platform, increase V_y back to 16000 and let it decrease from there again
	if(platform_vector_X(character_row - 1) = '1') then
		V_y_1000 <= 16000;  -- Character will initiate jump
	end if;
		
	-- If character hits a platform, then we need to start from a higher y_velocity. We need to make it 16000 everytime it jumps.
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
		
	if (y_pos = '0') then
		death <= '1';
	elsif (y_pos = '620') then
		V_y <= 0;
		V_y_1000 <= 0;
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
