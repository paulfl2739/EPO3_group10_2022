library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of platform_count is
signal count, new_count : unsigned(2 downto 0) := "000";
begin
process(clk)
begin
	if(rising_edge(clk)) then
		if(reset = '1' or count = "111") then
			count <= "000";
		else
			count <= new_count;
		end if;
		
	end if;
end process;

comb : process(count)
begin
	new_count <= count + '1';
end process;

column <= std_logic_vector(count);

end behaviour;

