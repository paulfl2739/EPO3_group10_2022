library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;


architecture Behavioral of offset_count is
  signal offset : unsigned(4 downto 0) := "00000";
  signal counter : integer range 0 to 1250000 := 0;
begin
  process(clk)
  begin
    if (rising_edge(clk)) then
	if death = '0' then
      		if counter = 1250000-1 then
        			offset <= unsigned(offset) + '1';
        			if offset > "10010" then
          				offset <= "00000";
        			end if;
        		counter <= 0;
      		else
        			counter <= counter + 1;
      		end if;
	else
		counter <= 0; 
		offset <= "00000";
		
	end if;
	
    end if;
  end process;
  count <= std_logic_vector(offset);
end Behavioral;

