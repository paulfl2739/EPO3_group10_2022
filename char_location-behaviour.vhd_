library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of char_location is

constant gravity : INTEGER := 375;
signal x_position : INTEGER := 240;
signal y_position : INTEGER:= 340;
signal y_velocity : INTEGER := 1600;
signal x_decimal : integer := 0;
signal frame_passed_prev : std_logic := '0'; 
signal ready : std_logic := '0'; -- Signal denoting when it is ready to update

begin
    process(clk, reset)
    begin
        if rising_edge(clk) then
            		if reset = '1' then
              			x <= std_logic_vector(to_unsigned(240,8));
                			y <= std_logic_vector(to_unsigned(275,8));
                			death <= '1';
		end if;
		
		if y_position = 0 then
                    death <= '1';
                end if;

		if(start = '1') then
			x_position <= 240;
			y_position <= 300;
			death <= '0';
		end if;

		if(frame_passed = '1' and ready = '1') then  -- Rising edge of frame_passed			
			x_decimal <= to_integer(signed(velocity_x));
			
			if (velocity_x(7) = '1') then --Check the bounds of the screen
				if (x_position >= 475) then
                    					x_position <= x_decimal;
				else
					x_position <= x_position + x_decimal;
				end if;
                			elsif (velocity_x(7) = '0') then
				if(x_position <= 5) then
                    					x_position <= 480 - x_decimal;
				else
					x_position <= x_position - x_decimal;
				end if;
                			end if;

			if (collision = '1') then
		    		y_velocity <= 1600;
			else
		    		y_velocity <= y_velocity - gravity;
			end if;
			y_position <= (1000*y_position + y_velocity) / 1000; -- Adjust values for jump
		end if;
		
		
        end if;
	
	x <= std_logic_vector(to_unsigned(x_position,8));
	y <= std_logic_vector(to_unsigned(y_position,8));
    end process;  

	process(clk)
	begin
	if rising_edge(clk) then
		if(frame_passed ='1' and frame_passed_prev = '0') then
			ready <= '1';
		end if;
		frame_passed_prev <= frame_passed;
	end if;
	end process;
end behaviour;

