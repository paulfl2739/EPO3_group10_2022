library ieee;
use ieee.std_logic_1164.all;

entity hvsyncSimulator is
    port (
        clk : in std_logic;
        reset : in std_logic;
        sixtyHz : out std_logic);
end entity hvsyncSimulator;

architecture behavioral of hvsyncSimulator is 
    signal vpos: integer range 0 to 800:= 0; 	-- vpos is the y position when monitor is as portret
    signal hpos: integer range 0 to 525:= 0; 	-- hpos is the x position when monitor is as portret
    
begin

-- vsync and hsync 
process (clk)
begin 
    if(reset = '1') then
        hpos <= 0;
        vpos <= 0;
    ELSIF(CLK'EVENT and CLK='1')then
        if(vpos<800)then
            vpos<= vpos+1;
        else
            vpos<=0;
            if(hpos<525)then
                hpos<= hpos+1;
            else
                hpos<= 0;
            end if;
        end if;
    end if;
end process;

--60 Hz clock for external modules that they can use 
process(hpos, vpos)
begin
	if((hpos < 262) and (vpos < 400)) then 
		sixtyHz <= '1';
	else
		sixtyHz <= '0';
	end if;
end process;

end architecture behavioral;