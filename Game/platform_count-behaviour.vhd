library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of platform_count is
signal count : unsigned(2 downto 0) := "000";
begin
process(clk)
begin
	if(rising_edge(clk)) then
		if(reset = '1' or count = "111") then
			count <= "000";
		else
			count <= count + '1';
		end if;
		column <= std_logic_vector(count);
	end if;
end process;
end behaviour;

