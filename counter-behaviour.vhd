library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of counter is
signal count, new_count: unsigned(18 downto 0);
signal pixel_count, new_pixel_count: integer;

begin

process(clk)
begin
	if (rising_edge(clk) then
		if (reset = '1')
			count <= (others => '0');
	    		pixel_count <= 0;
		else
			count <= new_count;
	    		pixel_count <= new_pixel_count; 
		end if;
	end if;
end process;

process(count)
begin
	new_count <= count + 1;
	if (pixel_count < 1250000)
		new_pixel_count <= pixel_count + 1;
	else
	    pixel_count <= 0;
	end if;
	    
end process;

count_out <= std_logic_vector(count);
pixel_count_out <= to_unsigned(pixel_count, 5);

end behaviour;

