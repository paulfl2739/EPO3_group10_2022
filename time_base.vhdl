library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity timebase is
	port (	clk		: in	std_logic;
		reset		: in	std_logic;

		count_out	: out	std_logic;
	);
end entity timebase;

architecture behavioural of timebase is 
	signal count, new_count: unsigned(24 downto 0);

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
	
	if count = (others => '1') then
		count_out <= '1';
	else
		count_out <= '0';
	end if;	
			
end architecture behavioural;
