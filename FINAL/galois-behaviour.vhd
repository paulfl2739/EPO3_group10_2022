library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;



architecture behaviour of galois is
constant toggle_mask : std_logic_vector(7 downto 0) := "10110100";
begin
	process(clk)
	variable lfsr : std_logic_vector(7 downto 0) := "10001011";
	begin
	if (rising_edge(clk)) then
		if(lfsr(0) = '1') then
			lfsr := '0' & lfsr(7 downto 1);
			lfsr := lfsr xor toggle_mask;
		else
			lfsr := '0' & lfsr(7 downto 1);
		end if;
	end if;
	platforms <= lfsr;
	end process;

end behaviour;

