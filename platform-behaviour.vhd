library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of platform is
signal temp_output : std_logic_vector(255 downto 0) := "0011001101001010110001011001010101111110100111100001111100100101100110000010001100011100001101110100010000111010110011001111001101100110000010110100010100100000100011000011001111010101010101010001101101001000001001000011110001111001011010100011000001101101";
signal next_game_vector : std_logic_vector(255 downto 0) := "0011001101001010110001011001010101111110100111100001111100100101100110000010001100011100001101110100010000111010110011001111001101100110000010110100010100100000100011000011001111010101010101010001101101001000001001000011110001111001011010100011000001101101";
begin
	process(start, shift, reset) -- This process will shift the register or load a value into it
	begin
		if(reset = '1') then
			temp_output <= next_game_vector;
		end if;

		if (shift = '1') then
			temp_output <= temp_output(254 downto 224) & (temp_output(15) xor temp_output(30))
				     & temp_output(222 downto 192) & (temp_output(15) xor temp_output(30))
				     & temp_output(190 downto 160) & (temp_output(15) xor temp_output(30))
				     & temp_output(158 downto 128) & (temp_output(15) xor temp_output(30))
				     & temp_output(126 downto 96) & (temp_output(15) xor temp_output(30))
				     & temp_output(94 downto 64) & (temp_output(15) xor temp_output(30))
				     & temp_output(62 downto 32) & (temp_output(15) xor temp_output(30))
				     & temp_output(30 downto 0) & (temp_output(15) xor temp_output(30));
		end if;

		if (start = '1') then
			next_game_vector <= temp_output;
			temp_output(224) <= '1';
			temp_output(192) <= '1';
			temp_output(160) <= '1';
			temp_output(128) <= '1';
			temp_output(96) <= '1';
			temp_output(64) <= '1';
			temp_output(32) <= '1';
			temp_output(0) <= '1';
		end if;
	end process;


	grid <= temp_output;
end behaviour;


