library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of control is
	
	component char_location
  		port(	clk   : in  std_logic;
        		start : in  std_logic;
			velocity_x	: in	signed(7 downto 0);
			vsync	: in std_logic;
			platform_vector: in std_logic_vector (255 downto 0);
			death	: out std_logic;
			x	: out integer;
			y	: out integer);
		end component;
	
	component platform
		port(clk    : in  std_logic;
        	     reset  : in  std_logic;
        	     start   : in  std_logic;
		     counter : in std_logic;
		     player_score : out integer;
        	     lfsr : out std_logic_vector(255 downto 0));
	end component;
	
	component counter
		port(	clk       : in  std_logic;
        		reset     : in  std_logic;
		     	death	  : in std_logic;
        		count_out : out std_logic_vector(18 downto 0);
        		pixel_count_out : out std_logic_vector(4 downto 0));
	
	--type	game_state is(	home_state,
				--send_data_state,
				--calculation_state,
			      	--play_state,
				--death_state
				--);
	--signal state, new_state: game_state;
	signal intermediate_count: unsigned(4 downto 0);
	signal intermediate_death: std_logic;
--begin 
--	process (clk)
--	begin 
--	if (rising_edge(clk)) then
--		if (reset = '1') then
--		state <= home_state;
--		else 
--		state <= new_state;
--		end if;
--	end if;
--end process;

--process ( state , reset)
--begin
--	case state is
--		when home_state => 
--			death <= '1';
--			if (start = '1') then
-- 					new_state <= play_state; --send_data_state;
--			else
--				new_state <= home_state;
--			end if;	
		
		-- when send_data_state => 
		--	x_out <= x;
		--	y_out <= y;
		--	death <= '0';
		--	platform_grid_out <= platform_grid;
		--	if (v_sync_clk = '0') then
		--		new_state <= calculation_state;
		--	else
		--		new_state <= send_data_state;
		--	end if; 
		
		-- when calculation_state =>
		--	death = '0';
		--	if (v_sync_clk = '1' and death ) then
		--		new_state <= send_data_state;
		--	elsif (death = '1') then
		--		new_state <= death_state;
		--	else
		--		new_state <= calculation_state;
		--	end if;
				
--		when play_state =>
--			death <= '0';
--			x_out <= x; 		
--			y_out <= y;		
--			platform_grid_out <= platform_grid; 
--        		if (y = '0') then
--				new_state <= death_state;
--			end if;
		
--		 when death_state =>
--			death <= '1';
--			if (start = '1') then
--				new_state <= home_state;
--			else
--				new_state <= death_state;
--			end if;
--				
--		end case;
--	end process;

counter port map(clk => clk,
         	 reset => reset,
         	 pixel_count_out => pixel_count_out,
         	 count_out => intermediate_count);
				
platform port map(clk => clk,
		  start => start,
		  reset => reset,
		  counter => intermediate_count,
		  player_score => player_score,
		  lfsr => platform_grid);
	
char_location port map(clk => clk,
		       start => start,
		       reset => reset,
		       velocity_x => velocity_x)
	
	
end architecture behaviour; 

