library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk60hz_gen is
	port (
		clk		:	in	std_logic; -- 25 MHz
		reset		:	in	std_logic;
		
		clk60hz		:	out	std_logic 
	);
end entity clk60hz_gen;

architecture behaviour of clk60hz_gen is

signal count, new_count:	unsigned(18 downto 0);
signal counter_stop:		std_logic;


begin

	process(clk, reset, new_count, count, counter_stop)
	begin
		if (reset = '1' or counter_stop = '1') then
			count <= (others => '0');
		else	
			if (clk'event and clk = '1') then
				count <= new_count;
			else
				count <= count;
			end if;
		end if;
	end process;

	process(clk, count, new_count)
	begin
		if (clk'event and clk = '1') then
			new_count <= count + 1;
		else
			new_count <= new_count;
		end if;
	end process;

	process(count) --416667 is what will be counted towards  
	begin
		if (count < "110010110111001110") then
			clk60hz	<= '1';
		else
			clk60hz <= '0';
		end if;

		if (count = "1100101101110011011") then
			counter_stop <= '1';
		else
			counter_stop <= '0';
		end if;
	end process;
	
	
end architecture behaviour;

	
