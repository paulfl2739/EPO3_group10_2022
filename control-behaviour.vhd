library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of control is
	type	game_state is(		home_state,
				send_data_state,
				calculation_state,
				death_state
				);
	signal state, new_state: game_state;

begin 
	process (clk)
	begin 
	if (rising_edge(clk)) then
		if (reset = '1') then
		state <= home_state;
		else 
		state <= new_state;
		end if;
	end if;
end process;

process ( state , reset)
begin
	case state is
		when home_state => 
			death <= '1';
			if (start = '1') then
					new_state <= send_data_state;
			else
				new_state <= home_state;
			end if;	
		
		when send_data_state => 
			x_out <= x;
			y_out <= y;
			platform_grid_out <= platform_grid;
			if (v_sync_clk = '0') then
				new_state <= calculation_state;
			else
				new_state <= send_data_state;
			end if;
		
		when calculation_state =>
			
			????
			
			if (v_sync_clk = '1' and death) then
				new_state <= send_data_state;
			elsif (death = '1') then
				new_state <= death_state;
			else
				new_state <= calculation_state;
			end if;
		
		when death_state =>
					
			
			
			
end behaviour; 

