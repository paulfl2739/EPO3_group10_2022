library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of test is
begin
process(clk)
begin
	if(rising_edge(clk)) then
		random <= std_logic_vector(to_unsigned(rand,4));
	end if;
end process;
end behaviour;

