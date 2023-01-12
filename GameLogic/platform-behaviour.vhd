library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of platform is
	-- Signal declaration for intermediate values
	signal grid_next : std_logic_vector(255 downto 0) := "0011001101001010110001011001010101111110100111100001111100100101100110000010001100011100001101110100010000111010110011001111001101100110000010110100010100100000100011000011001111010101010101010001101101001000001001000011110001111001011010100011000001101101";
	signal next_game_vector : std_logic_vector(255 downto 0);
	signal start_counting : std_logic := '1';
	signal next_player_score : integer;

begin
	grid_sequential: process(clk, reset)
	begin
		if((reset = '1')) then -- Home screen (launched)
			grid <= next_game_vector;
			start_counting <= '1';
			player_score <= 0;
		else
			if(rising_edge(clk)) then
				grid <= grid_next;
				player_score <= next_player_score;
				if (start = '1') then -- Game starts, save current grid value (for next game) and stop counting
					next_game_vector <= grid;
					start_counting <= '0';
				end if;
			else 
				grid <= grid;
			end if;
		end if;
	end process grid_sequential;
	
	shift_grid: process(counter) --grid)
	begin
		-- We shift the contents of the grid (and thus the vector) only when the signal 'counter' = 1
		if (counter = '1') then
			next_player_score <= player_score + 1;
			-- Shift the contents of each column one to the left
			grid_next(255 downto 224) <= grid(254 downto 223);
			grid_next(223 downto 192) <= grid(222 downto 191);
			grid_next(191 downto 160) <= grid(190 downto 159);
			grid_next(159 downto 128) <= grid(158 downto 127);
			grid_next(127 downto 96) <= grid(126 downto 95);
			grid_next(95 downto 64) <= grid(94 downto 63);
			grid_next(63 downto 32) <= grid(62 downto 31);
			grid_next(31 downto 1) <= grid(30 downto 0);

			-- New MSB for each column will be a random value, with their own logic function
			grid_next(223) <= grid(20) xor grid(5); -- Column 1
			grid_next(191) <= grid(144) xor grid(12); -- Column 2
			grid_next(159) <= grid(60) xor grid(23); -- Column 3
			grid_next(127) <= grid(11) xor grid(111); -- Column 4
			grid_next(95) <= grid(88) xor grid(12); -- Column 5
			grid_next(63) <= grid(56) xor grid(78); -- Column 6
			grid_next(31) <= grid(43) xor grid(99); -- Column 7
			grid_next(0) <= grid(3) xor grid(222); -- Column 8
		else 
			grid_next <= grid_next; -- Otherwise the grid will stay the same --> the vector will keep its old values
		end if;
			
		if (start = '1') then -- If we start the game, the bottom row should be filled with platforms.
			grid_next(223) <= '1';
			grid_next(191) <= '1';
			grid_next(159) <= '1';
			grid_next(127) <= '1';
			grid_next(95) <= '1';
			grid_next(63) <= '1';
			grid_next(31) <= '1';
			grid_next(0) <= '1';
		end if;	
	end process shift_grid;
			
constant_shift: process(clk)
	begin
		-- We shift the contents of the grid (and thus the vector) constantly as long as start_counting = '1'
		if (rising_edge(clk) and start_counting = '1') then
			-- Shift the contents of each column one to the left
			grid_next(255 downto 224) <= grid(254 downto 223);
			grid_next(223 downto 192) <= grid(222 downto 191);
			grid_next(191 downto 160) <= grid(190 downto 159);
			grid_next(159 downto 128) <= grid(158 downto 127);
			grid_next(127 downto 96) <= grid(126 downto 95);
			grid_next(95 downto 64) <= grid(94 downto 63);
			grid_next(63 downto 32) <= grid(62 downto 31);
			grid_next(31 downto 1) <= grid(30 downto 0);

			-- New MSB for each column will be a random value, with their own logic function
			grid_next(223) <= grid(20) xor grid(5); -- Column 1
			grid_next(191) <= grid(144) xor grid(12); -- Column 2
			grid_next(159) <= grid(60) xor grid(23); -- Column 3
			grid_next(127) <= grid(11) xor grid(111); -- Column 4
			grid_next(95) <= grid(88) xor grid(12); -- Column 5
			grid_next(63) <= grid(56) xor grid(78); -- Column 6
			grid_next(31) <= grid(43) xor grid(99); -- Column 7
			grid_next(0) <= grid(3) xor grid(222); -- Column 8
		end if;
	end process constant_shift;
end behaviour;

