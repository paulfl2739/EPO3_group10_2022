library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of vhsync is

signal vpos : integer range 0 to 800;
signal hpos : integer range 0 to 525;

begin


process(clk,reset)
begin


if (clk'event and clk='1') then
   if (reset = '1') then
	hpos <= 0;
	vpos <= 0;
   else
	if (vpos<800) then
	   vpos <= vpos + 1;
	else
	   vpos <= 0;
	   if (hpos<525) then
		hpos <= hpos + 1;
	   else
		hpos <= 0;
	   end if;
	end if;
	if (vpos > 640+16 and vpos < 640+112) then
	   hsync <= '0';
	else
	   hsync <= '1';
	end if;
	if (hpos >490 and hpos <492) then
	   vsync <= '0';
	else
	   vsync <= '1';
	end if;
   end if;
end if;

end process;


end behaviour;
