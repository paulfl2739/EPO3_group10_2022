library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_1164.all;

entity hvsyncSimulator is
    port (
        clk : in std_logic;
        sixtyHz : out std_logic);
end entity hvsyncSimulator;

architecture behavioral of hvsyncSimulator is 
    signal vpos: integer range 0 to 800:= 0; 	-- vpos is the y position when monitor is as portret
    signal hpos: integer range 0 to 525:= 0; 	-- hpos is the x position when monitor is as portret

    signal x : integer range 0 to 480 := 0; -- only test, gone whene coupled with game logic, then we get it as input in the entity 
    signal y : integer range 0 to 640 := 0; -- only test, gone whene coupled with game logic, then we get it as input in the entity

    signal lfsr : std_logic_vector(255 downto 0) := "0011010010001000010000100001000010001001001000100100100001001000100010010010001000001000010001000010001000100100010001001000010000100000100010010001000010010001000100001000100010001001000100010000100001001000010010010001010001001001000001000100010001010010"; -- only test, gone whene coupled with game logic, then we get it as input in the entity

    --counters for the platforms
    signal countx : integer range 0 to 7 := 0; 
    signal county : integer range 0 to 31 := 0; 
    signal countxpixel : integer range 0 to 60 := 0;
    signal countypixel : integer range 0 to 20 := 0;
    signal syncx : std_logic;
    signal syncy : std_logic;
    
begin

    -- vsync and hsync 
    process (clk)
    begin 
        if(reset = '1') then
            hpos <= 0;
            vpos <= 0;
        elsif(clk'event and clk='1')then
            if(vpos<800)then
                vpos<= vpos+1;
            else
                vpos<=0;
            end if;

            if(hpos<525)then
                hpos<= hpos+1;
            else
                hpos<= 0;
            end if;
        end if;
        
        if(vpos> 640+16 and vpos< 640+112) then
            HSync<='0';
        else
            HSync<='1';
        end if;
        
        if(vpos> 639 and vpos < 800)	then	
            syncy <= '0';
        else 
            syncy <= '1';
        end if;
        
        if(hpos>490 and hpos<492) then 
            VSync<= '0';	
        else
            VSync<='1'; 
        end if;
        
        if(hpos > 479 and hpos < 525 )	then	
            syncx <= '0';
        else 
            syncx <= '1';
        end if;
    end if;
end process;

--60 Hz clock for external modules that they can use 
process(hpos, vpos)
begin
	if(hpos < 262 and vpos < 400) then 
		sixtyHz <= '1';
	else
		sixtyHz <= '0';
	end if;
end process;

end architecture behavioral;