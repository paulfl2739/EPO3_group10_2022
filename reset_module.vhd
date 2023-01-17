library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reset_module is
	port (
		clk:		in	std_logic;
		reset:		in	std_logic;
		clk60hz: 	in	std_logic;
		
		internal_reset: out	std_logic
);

end reset_module;

architecture behavioural of reset_module is

signal count, new_count:				unsigned(5 downto 0);
signal clk60hz_prev, temp_reset:				std_logic;

begin

internal_reset <= temp_reset or reset; 

process(clk, reset, new_count, count, clk60hz) --asynchronous counter, synced to clk
begin
	if (reset = '1') then
		count 	 <= "000000";
	else
		if (clk'event and clk = '1') then
			count <= new_count;
		else
			count <= count;
		end if;
	end if;
end process;

process(clk60hz,clk60hz_prev, count, new_count) --every time the 60hz clk rises, we increment count
begin
	if (clk60hz_prev = '0' and clk60hz = '1') then
		new_count <= count + 1;
	else
		new_count <= count;
	end if;
end process;

process(clk, reset, clk60hz, clk60hz_prev) --rembering the old value of clk60hz, so we can detect a rising edge of clk60hz, used above
begin
        if (reset = '1') then
            clk60hz_prev <= '0';
        else
            if (clk'event and clk = '1') then
                clk60hz_prev <= clk60hz;
	    else
		clk60hz_prev <= clk60hz_prev;
            end if;

        end if;
end process;

process(new_count, clk) --when count equals 60, 60 ticks of the clk60hz have passed, every second we send an internal reset.
begin
	if(clk'event and clk = '1') then
		if count = "111111" then
			temp_reset <= '1';
		else
			temp_reset <= '0';
		end if;
	end if;
end process;
end architecture;

