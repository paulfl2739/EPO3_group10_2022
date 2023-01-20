library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of platform_count is
signal count, new_count : unsigned(2 downto 0) := "000";
signal index : unsigned(7 downto 0);
begin
process(clk, reset)
begin
	if(reset = '1') then
		count <= (others => '0');
		index <= (others => '0');
	elsif(rising_edge(clk)) then
		count <= new_count;
	else
		count <= count;
	end if;
	index <= (others => '0');
	index(to_integer(count)) <= '1';
column <= std_logic_vector(index);
end process;

comb : process(count)
begin
	new_count <= count + 1;
end process;
end behaviour;

