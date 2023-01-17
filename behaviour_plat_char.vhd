library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


architecture behaviour of vga_platforms is

signal vpos: integer range 0 TO  800;     -- vpos is the y position when monitor is as portret
signal hpos: integer range 0 to  525;     -- hpos is the x position when monitor is as portret

signal x : integer range 0 to 480; -- only test, gone when coupled with game logic, then we get it as input in the entity 
signal y : integer range 0 to 640; -- only test, gone when coupled with game logic, then we get it as input in the entity

--signal lfsr : std_logic_vector(255 downto 0); -- only test, gone whene coupled with game logic, then we get it as input in the entity

--counters for the platforms
signal countx : integer range 0 to 7; 
signal county : integer range 0 to 31; 
signal countxpixel : integer range 0 to 60;
signal countypixel : integer range 0 to 20;

signal offset : integer range 0 to 19; -- signal so offset

signal collision_reg : std_logic;
signal new_collision_reg : std_logic; 
--signal start : std_logic; -- initial voor signals (ook in entity), moet in reset


begin

offset <= to_integer(unsigned(offset_logic));
x <= to_integer(unsigned(x_logic));
y <= to_integer(unsigned(y_logic));
collision <= collision_reg;

process(clk)
begin
if(clk'event and clk = '1') then
	if (hpos = 0 and vpos = 0) then
		frame_count <= '1';
	else
		frame_count <= '0';
	end if;
end if;
end process;


-- vsync and hsync 
process (clk, reset)
begin 

if(reset = '1') then
  collision_reg <= '0';
  --new_collision_reg <= '0';
  hpos <= 0;
  vpos <= 0;
elsif(clk'event and clk='1')then
    collision_reg <= new_collision_reg;
    if (vpos<800) then  
      vpos<= vpos+1;
        else
      vpos<=0;
      if (hpos<525) then
        hpos<= hpos+1;
      else
        hpos<= 0;
      end if;
     end if;
     if(vpos> 640+16 and vpos< 640+112) then
    hsync<='0';
     else
    hsync<='1';
     end if;
    if(hpos>490 and hpos<492) then 
      vsync<= '0';    
    else
      vsync<='1'; 
    end if;
end if;
end process;
        


process(clk, start, collision_reg, hpos, vpos, lfsr, countx, county, x, y)-- click gone if all implemented
variable groen_getekend : std_logic; 
begin
groen_getekend  := '0'; 
new_collision_reg <= collision_reg; 

if start = '0' then -- game code

-- don't color in blanking area
if hpos >= 480 and hpos < 0 and vpos >= 640 and vpos < 0 then
        r<=(Others=> '0');
        g<=(Others=> '0');
        b<=(Others=> '0');
end if;

-- standard values (could be implemented into entity directly)

        r<=(others=> '0');
        g<=(others=> '0');    
        b<=(others=> '0');    

-- counters for the platform positions

--if( falling_edge(click)) then -- click gone when all implemented
--offset <= offset + 1;-- click gone when all implemented
--  if( offset >= 19) then -- click gone when all implemented
--    offset <= 0; -- click gone when all implemented
--    lfsr <= "0110100100010000100001000010000100010010010001001001000010010001000100100100010000010000100010000100010001001000100010010000100001000001000100100010000100100010001000010001000100010010001000100001000010010000100100100010100010010010000010001000100010100100"; -- click gone when all implemented
--  end if ; -- click gone when all implemented
--end if; -- click gone when all implemented


-- color a platform green in the places where a plafrom should be 
if (lfsr(32*countx + county) = '1'  and  hpos >= 0 and hpos < 479 and vpos >= 0 and vpos < 619 ) then 
        r<=(Others=> '0');
        g<=(Others=> '1');
        b<=(Others=> '0');
        groen_getekend := '1'; 
end if;





--character in red

--x <= 100;
--y <= 400;


if (((x-10) < hpos and hpos < (x+10)) and (y < vpos and vpos < (y+20))) then
  if ((hpos >= 0 and hpos < 479) and (vpos >= 0 and vpos < 619)) then 
            r<=(Others=> '1');
            g<=(Others=> '0');
            b<=(Others=> '0');
        if (groen_getekend = '1') then
            new_collision_reg <= '1';
        end if;
  end if;
end if;

if vpos = 0 and hpos = 0 then
    new_collision_reg <= '0';  
end if;

end if; -- end game code 

-- startscreen code 


if start = '1' then 

--start text code

        r<=(Others=> '0');
        g<=(Others=> '0');    
        b<=(Others=> '0');    

--lfsr <= "1010101010101010101010101010101001010101010101010101010101010101101010101010101010101010101010100101010101010101010101010101010110101010101010101010101010101010010101010101010101010101010101011010101010101010101010101010101001010101010101010101010101010101";


--start text
if ((313 < vpos and vpos < 322) and (129+12 < hpos and hpos < 154+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;

if ((305 < vpos and vpos < 314) and (121+12 < hpos and hpos < 130+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;

if ((297 < vpos and vpos < 306) and (129+12 < hpos and hpos < 146+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;

if ((289 < vpos and vpos < 298) and (145+12 < hpos and hpos < 154+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((281 < vpos and vpos < 290) and (121+12 < hpos and hpos < 146+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((313 < vpos and vpos < 322) and (161+12 < hpos and hpos < 202+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((281 < vpos and vpos < 314) and (177+12 < hpos and hpos < 186+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((281 < vpos and vpos < 314) and (209+12 < hpos and hpos < 218+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((297 < vpos and vpos < 306) and (217+12 < hpos and hpos < 234+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((281 < vpos and vpos < 314) and (233+12 < hpos and hpos < 242+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((313 < vpos and vpos < 322) and (217+12 < hpos and hpos < 234+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((281 < vpos and vpos < 322) and (249+12 < hpos and hpos < 258+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((297 < vpos and vpos < 306) and (249+12 < hpos and hpos < 274+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((289 < vpos and vpos < 298) and (265+12 < hpos and hpos < 274+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((313 < vpos and vpos < 322) and (249+12 < hpos and hpos < 274+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((305 < vpos and vpos < 314) and (273+12 < hpos and hpos < 282+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((281 < vpos and vpos < 290) and (273+12 < hpos and hpos < 282+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((313 < vpos and vpos < 322) and (289+12 < hpos and hpos < 330+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;
if ((281 < vpos and vpos < 314) and (305+12 < hpos and hpos < 314+12)) then
            r<=(Others=> '1');
            g<=(Others=> '1');
            b<=(Others=> '1');
end if;



-- electro jump
--e
if ((118 < hpos and hpos < 147) and (569 < vpos and vpos < 577)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((118 < hpos and hpos < 126) and (548 < vpos and vpos < 570)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((125 < hpos and hpos < 140) and (555 < vpos and vpos < 563)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((118 < hpos and hpos < 147) and (541 < vpos and vpos < 549)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
--l
if ((153 < hpos and hpos < 161) and (541 < vpos and vpos < 577)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((160 < hpos and hpos < 182) and (541 < vpos and vpos < 549)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
--e
if ((188 < hpos and hpos < 217) and (569 < vpos and vpos < 577)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((188 < hpos and hpos < 196) and (548 < vpos and vpos < 570)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((195 < hpos and hpos < 210) and (555 < vpos and vpos < 563)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((188 < hpos and hpos < 217) and (541 < vpos and vpos < 549)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
--c
if ((223 < hpos and hpos < 231) and (548 < vpos and vpos < 570)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((230 < hpos and hpos < 245) and (569 < vpos and vpos < 577)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((230 < hpos and hpos < 245) and (541 < vpos and vpos < 549)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((244 < hpos and hpos < 252) and (562 < vpos and vpos < 570)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((244 < hpos and hpos < 252) and (548 < vpos and vpos < 556)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
--t
if ((258 < hpos and hpos < 294) and (569 < vpos and vpos < 577)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((272 < hpos and hpos < 280) and (541 < vpos and vpos < 570)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
--r
if ((300 < hpos and hpos < 322) and (569 < vpos and vpos < 577)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((300 < hpos and hpos < 308) and (541 < vpos and vpos < 570)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((307 < hpos and hpos < 322) and (555 < vpos and vpos < 563)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((321 < hpos and hpos < 329) and (562 < vpos and vpos < 570)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((314 < hpos and hpos < 322) and (548 < vpos and vpos < 556)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((321 < hpos and hpos < 329) and (541 < vpos and vpos < 549)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
--o
if ((335 < hpos and hpos < 343) and (548 < vpos and vpos < 570)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((342 < hpos and hpos < 357) and (541 < vpos and vpos < 549)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((342 < hpos and hpos < 357) and (569 < vpos and vpos < 577)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((356 < hpos and hpos < 364) and (548 < vpos and vpos < 570)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
--j
if ((167 < hpos and hpos < 175) and (479 < vpos and vpos < 487)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((174 < hpos and hpos < 189) and (472 < vpos and vpos < 480)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((188 < hpos and hpos < 196) and (479 < vpos and vpos < 508)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
--u
if ((202 < hpos and hpos < 210) and (479 < vpos and vpos < 508)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((209 < hpos and hpos < 224) and (472 < vpos and vpos < 480)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((223 < hpos and hpos < 231) and (479 < vpos and vpos < 508)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
--m
if ((237 < hpos and hpos < 245) and (472 < vpos and vpos < 508)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((244 < hpos and hpos < 252) and (493 < vpos and vpos < 501)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((251 < hpos and hpos < 259) and (486 < vpos and vpos < 494)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((258 < hpos and hpos < 266) and (493 < vpos and vpos < 501)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((265 < hpos and hpos < 273) and (472 < vpos and vpos < 508)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
--p
if ((279 < hpos and hpos < 287) and (472 < vpos and vpos < 508)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((286 < hpos and hpos < 301) and (500 < vpos and vpos < 508)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((286 < hpos and hpos < 301) and (486 < vpos and vpos < 494)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;
if ((300 < hpos and hpos < 308) and (493 < vpos and vpos < 501)) then
            r<=(Others=> '0');
            g<=(Others=> '0');
            b<=(Others=> '1');
end if;



end if; -- end startscreen code






-- end startscreen code
end process; 


process (clk, reset, hpos, vpos)
begin 
if (clk'event and clk='1') then
   if (hpos >= 0 and hpos < 479 and vpos >= 0 and vpos < 639)  then
   
    countypixel <= countypixel + 1;
    if countypixel = 19 then
        countypixel <= 0;
        if county < 31 then
            county <= county + 1;
        else
            county <= 0;
        end if;
    end if;
    
    countxpixel <= countxpixel;
    if vpos = 19 - offset then
        county <= 0;
        countypixel <= 0;
        countxpixel <= countxpixel + 1;
        if countxpixel = 59 then
            countxpixel <= 0;
            if countx < 7 then
                countx <= countx + 1;
            else 
                countx <= 0; 
            end if;
        end if;
    end if;

    if vpos = 0 and hpos = 0 then
    county <= 0;
    countx <= 0;
    countypixel <= 0;
    countxpixel <= 0;
    end if;

  end if;
end if;
end process;


-- startscreen
--process(clk,hpos,vpos, start)
--begin


--end process;

end behaviour;
