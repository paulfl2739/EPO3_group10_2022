library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;



architecture behavioral of counter is
    signal counter : unsigned(24 downto 0) := (others => '0');
    --signal frame_counter : unsigned(18 downto 0) := (others => '0');
begin
    process(clk)
    begin
        if (clk'event and clk = '1') then
		if death = '0' then
            			if (counter = 24_999_999) then
                				update <= '1';
                				counter <= (others => '0');
						--if (frame_counter = 416_667) then
							--new_frame = '1';
							--frame_counter <= (others => '0');
						--else
							--new_frame <= '0';
							--frame_counter <=
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
