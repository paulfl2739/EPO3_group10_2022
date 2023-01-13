library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of testing is

constant gravity : INTEGER := 375;
signal x_position : INTEGER range 0 to 480 := 0;
signal y_position : INTEGER range 0 to 640 := 0;
signal y_velocity : INTEGER := 16000;

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                x_position <= 0;
                y_position <= 0;
                death <= '0';
            elsif start = '1' then
                x_position <= 240;
                y_position <= 300;
            elsif frame_passed = '1' then
                if (velocity_x(7) = '1') and (x_position >= 475) then --Add x position for normal scenarios
                    x_position <= to_integer(signed(velocity_x));
                elsif (velocity_x(7) = '0') and (x_position <= 5) then
                    x_position <= 480 - to_integer(signed(velocity_x));
                end if;
		if (collision = '1') then
		    y_velocity <= 16000;
		else
		    y_velocity <= y_velocity - gravity;
		end if;
                if y_position = 0 then
                    death <= '1';
                end if;

		y_position <= (1000*y_position + y_velocity) / 1000;
            end if;
        end if;
    end process;
    x <= x_position;
    y <= y_position;
end behaviour;


