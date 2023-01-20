library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of galois is
constant toggle_mask : std_logic_vector(7 downto 0) := "10110100"; -- Do not change
begin
	process(clk)
	variable index : unsigned(7 downto 0);
	variable lfsr : std_logic_vector(7 downto 0) := "10001011";
	begin
	if(reset = '1') then 
		lfsr := "10001011";
		index := (others => '0');
	elsif (rising_edge(clk)) then
		if(lfsr(0) = '1') then
			lfsr := '0' & lfsr(7 downto 1);
			lfsr := lfsr xor toggle_mask;
		else
			lfsr := '0' & lfsr(7 downto 1);
		end if;
	end if;
	index := (others => '0');
	index(to_integer(unsigned(lfsr(2 downto 0)))) := '1';
	platforms <= std_logic_vector(index);
	end process;

end behaviour;

