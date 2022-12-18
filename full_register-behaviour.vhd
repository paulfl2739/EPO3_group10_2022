library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of full_register is
	-- Signal declaration for intermediate values
	
	signal lfsr_next : std_logic_vector(255 downto 0);
	signal next_game_vector : std_logic_vector(255 downto 0) := "0011001101001010110001011001010101111110100111100001111100100101100110000010001100011100001101110100010000111010110011001111001101100110000010110100010100100000100011000011001111010101010101010001101101001000001001000011110001111001011010100011000001101101";
	signal start_counting : std_logic;

begin
	lfsr_sequential: process(clk, reset)
	begin
		if((reset = '1')) then -- Home screen (launched)
			lfsr <= next_game_vector;
		else
			if(rising_edge(clk) and start = '0') then -- Start: 0 = We are still in home screen, 1= The game has started
				lfsr <= lfsr_next;
				start_counting <= '1';
			else 
				next_game_vector <= lfsr; -- Start = 1: The game starts and next_game_vector saves the old lfsr value (for the next game)
				start_counting <= '0';
			end if;
		end if;
	end process lfsr_sequential;
	
	shift_lfsr: process(start_counting, lfsr)
	begin
		-- Shift the contents of each column one to the left
		lfsr_next(255 downto 224) <= lfsr(254 downto 223);
		lfsr_next(223 downto 192) <= lfsr(222 downto 191);
		lfsr_next(191 downto 160) <= lfsr(190 downto 159);
		lfsr_next(159 downto 128) <= lfsr(158 downto 127);
		lfsr_next(127 downto 96) <= lfsr(126 downto 95);
		lfsr_next(95 downto 64) <= lfsr(94 downto 63);
		lfsr_next(63 downto 32) <= lfsr(62 downto 31);
		lfsr_next(31 downto 1) <= lfsr(30 downto 0);

		-- New MSB for each column will be a random value, with their own logic function
		lfsr_next(223) <= lfsr(20) xor lfsr(5); -- Column 1
		lfsr_next(191) <= lfsr(144) xor lfsr(12); -- Column 2
		lfsr_next(159) <= lfsr(60) xor lfsr(23); -- Column 3
		lfsr_next(127) <= lfsr(11) xor lfsr(111); -- Column 4
		lfsr_next(95) <= lfsr(88) xor lfsr(12); -- Column 5
		lfsr_next(63) <= lfsr(56) xor lfsr(78); -- Column 6
		lfsr_next(31) <= lfsr(43) xor lfsr(99); -- Column 7
		lfsr_next(0) <= lfsr(3) xor lfsr(222); -- Column 8

	end process shift_lfsr;
end behaviour;

