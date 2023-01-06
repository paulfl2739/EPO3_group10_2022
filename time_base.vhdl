library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity timebase is
	port (	clk		: in	std_logic;
		reset		: in	std_logic;

		count_out	: out	std_logic_vector (19 downto 0)
	);
end entity timebase;

architecture behavioural of timebase is 
	signal count, new_count: unsigned(19 downto 0);

begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				count <= (others => '0');
			else
				count <= new_count;
			end if;
		end if;
	end process;

	process(count)
	begin
		new_count <= count + 1;
	end process;
	count_out <= std_logic_vector(count);
end architecture behavioural;
