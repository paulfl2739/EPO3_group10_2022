library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;



architecture behavioral of counter is
    signal counter : unsigned(24 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if (clk'event and clk = '1') then
		if death = '0' then
            			if (counter = 24_999) then
                				update <= '1';
                				counter <= (others => '0');
            			else
                				update <= '0';
                				counter <= counter + 1;
            			end if;	
		else
			update <= '0';
                			counter <= (others => '0');
		end if;
	 
        end if;
    end process;
end behavioral;
