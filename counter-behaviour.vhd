library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of counter is
signal count, new_count: unsigned(18 downto 0);

begin

process(clk)
begin
	if (rising_edge(clk) then
		if (reset = '1')
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

end behaviour;

