library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


architecture behaviour of vga_platforms is

signal vpos: integer range 0 TO  800;     -- vpos is the y position when monitor is as portret
signal hpos: integer range 0 to  525;     -- hpos is the x position when monitor is as portret

signal x : integer range 0 to 480; -- signal for x_logic
signal y : integer range 0 to 640; -- signal for y_logic

--counters for the platforms
signal countx : integer range 0 to 7; 
signal county : integer range 0 to 31; 
signal countxpixel : integer range 0 to 60;
signal countypixel : integer range 0 to 20;

signal offset : integer range 0 to 19; -- signal for offset_logic

--collision  signals
signal collision_reg : std_logic;
signal new_collision_reg : std_logic; 
signal count_col : integer range 0 to 1;

--score signals
signal score_count : integer range 0 to 120;
signal score_first, score_second, score_third : integer range 0 to 9;

begin

offset <= to_integer(unsigned(offset_logic));
x <= to_integer(unsigned(x_logic));
y <= to_integer(unsigned(y_logic));
collision <= collision_reg;


--process for when a frame is passed
process(clk)
begin
if(clk'event and clk = '1') then
   if (reset = '1') then
		frame_count <= '0';
	else
		if (hpos = 480 and vpos = 0) then
			frame_count <= '1';
		else
			frame_count <= '0';
		end if;
	end if;
end if;
end process;


-- vsync and hsync 
process (clk, reset)
begin 

if (clk'event and clk = '1') then 
	collision_reg <= new_collision_reg;
	if(reset = '1') then
		collision_reg <= '0';
		hpos <= 0;
		vpos <= 0; -- also reset v-/hsync?
	else
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
end if;
end process;

--score count 
process(clk)
begin

--counters for score
	if (clk'event and clk = '1')  then
		if (reset = '1') then
			score_count <= 0;
			score_first <= 0;
			score_second <= 0;
			score_third <= 0;    
		else
			if (hpos = 0 and vpos = 0) then
				if (score_count < 60) then
					score_count <= score_count  + 1;
				elsif (score_count  = 60) then
					score_count <= 0;
					if (score_first < 9) then
						score_first <= score_first + 1;
					elsif (score_first = 9) then
						score_first <= 0;
						if (score_second < 9 ) then
							score_second <= score_second +1;
						elsif (score_second = 9) then
							score_second <= 0;
							if (score_third < 9) then
								score_third <= score_third + 1;
							elsif (score_third = 9) then 
								score_third <= 0;
							else 
								score_third <= score_third;
							end if; --score_third
						else 
							score_second <= score_second;
						end if; --score_second
					else 
						score_first <= score_first;
					end if; --score_first
				else
					score_count <= score_count;
				end if;
			else
				score_first <= score_first;
				score_second <= score_second;
				score_third <= score_third;
				score_count <= score_count;
			end if;
		end if;
	end if;

end process;



-- process rgb assign
process(clk, death, collision_reg, hpos, vpos, lfsr, countx, county, x, y, score_first, score_second, score_third)
variable groen_getekend : std_logic; 
begin
groen_getekend  := '0';

if death = '0' then -- game code

------ standard values
    r<=(others=> '0');
    g<=(others=> '0');    
    b<=(others=> '0');  

-- don't color in blanking area
	if (hpos >= 480 and hpos < 0 and vpos >= 640 and vpos < 0) then
		r<=(others=> '0');
      g<=(others=> '0');    
      b<=(others=> '0'); 
	end if;

	-- color a platform green in the places where a plafrom should be 
	if (lfsr(32*countx + county) = '1'  and  hpos >= 0 and hpos < 479 and vpos >= 20 and vpos < 619 ) then 
		r<=(others=> '0');
      g<=(others=> '1');    
      b<=(others=> '0');
		groen_getekend := '1'; 
--	else
	--	groen_getekend:= '0';
	end if;
	
--color character and check for collision with platform			
	if ((hpos >= 0 and hpos < 479) and (vpos >= 20 and vpos < 619)) then	
-- topleft rood	
		if (( y < vpos and vpos < y + 17 ) and ( x - 10 < hpos and hpos < x - 3 ))then
			r <= (others => '1');
			g <= (others => '0' );
			b <= (others => '0' );
		end if;

--tweede rode segment
		if (( y + 17 < vpos and vpos < y + 21 ) and ( x - 10 < hpos and hpos < x - 3 ))then
			r <= (others => '1' );
			g <= (others => '0' );
			b <= (others => '0' );
		end if;

--eerste blauwe segment
		if (( y < vpos and vpos < y + 17 ) and ( x-4 < hpos and hpos < x + 10 ))then
			r <= (others => '0');
			g <= (others => '0' );
			b <= (others => '1' );
		end if;

--tweede blauwe segment
		if (( y + 17 < vpos and vpos < y + 21 ) and ( x -4 < hpos and hpos < x + 10 ))then
			r <= (others => '0' );
			g <= (others => '0' );
			b <= (others => '1' );
		end if;

--zwarte segment
		if (( y + 16 < vpos and vpos < y + 18 ) and ( x - 7 < hpos and hpos < x + 7 ))then
			r <= (others => '0' );
			g <= (others => '0' );
			b <= (others => '0' );
		end if;
--pixel for collision
		if ((vpos = y) and (hpos = x))then
			r <= (others => '0');
			g <= (others => '0');
			b <= (others => '1');
			if (groen_getekend = '1') then
				new_collision_reg <= '1';
			else			
				new_collision_reg <= '0';
			end if;
		end if;
	-- else 
		--... -- no else yet
	end if;
	


end if;
if( death = '1') then
--if death = 1
-- end game code 
-- sta2rtscreen code
	r<=(others=> '0');
   g<=(others=> '0');    
   b<=(others=> '0');    

	new_collision_reg <= '1';
		  
--start text
	if ((313 < vpos and vpos < 322) and (129+12 < hpos and hpos < 154+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;

	if ((305 < vpos and vpos < 314) and (121+12 < hpos and hpos < 130+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;

	if ((297 < vpos and vpos < 306) and (129+12 < hpos and hpos < 146+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;

	if ((289 < vpos and vpos < 298) and (145+12 < hpos and hpos < 154+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((281 < vpos and vpos < 290) and (121+12 < hpos and hpos < 146+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((313 < vpos and vpos < 322) and (161+12 < hpos and hpos < 202+12)) then
 		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((281 < vpos and vpos < 314) and (177+12 < hpos and hpos < 186+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((281 < vpos and vpos < 314) and (209+12 < hpos and hpos < 218+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((297 < vpos and vpos < 306) and (217+12 < hpos and hpos < 234+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((281 < vpos and vpos < 314) and (233+12 < hpos and hpos < 242+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((313 < vpos and vpos < 322) and (217+12 < hpos and hpos < 234+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((281 < vpos and vpos < 322) and (249+12 < hpos and hpos < 258+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((297 < vpos and vpos < 306) and (249+12 < hpos and hpos < 274+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((289 < vpos and vpos < 298) and (265+12 < hpos and hpos < 274+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((313 < vpos and vpos < 322) and (249+12 < hpos and hpos < 274+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((305 < vpos and vpos < 314) and (273+12 < hpos and hpos < 282+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((281 < vpos and vpos < 290) and (273+12 < hpos and hpos < 282+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((313 < vpos and vpos < 322) and (289+12 < hpos and hpos < 330+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;
	if ((281 < vpos and vpos < 314) and (305+12 < hpos and hpos < 314+12)) then
		r<=(others=> '1');
      g<=(others=> '1');
      b<=(others=> '1');
	end if;


-- electro jump
--e
	if ((118 < hpos and hpos < 147) and (569 < vpos and vpos < 577)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((118 < hpos and hpos < 126) and (548 < vpos and vpos < 570)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((125 < hpos and hpos < 140) and (555 < vpos and vpos < 563)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((118 < hpos and hpos < 147) and (541 < vpos and vpos < 549)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
--l
	if ((153 < hpos and hpos < 161) and (541 < vpos and vpos < 577)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((160 < hpos and hpos < 182) and (541 < vpos and vpos < 549)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
--e
	if ((188 < hpos and hpos < 217) and (569 < vpos and vpos < 577)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((188 < hpos and hpos < 196) and (548 < vpos and vpos < 570)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((195 < hpos and hpos < 210) and (555 < vpos and vpos < 563)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((188 < hpos and hpos < 217) and (541 < vpos and vpos < 549)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
--c
	if ((223 < hpos and hpos < 231) and (548 < vpos and vpos < 570)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((230 < hpos and hpos < 245) and (569 < vpos and vpos < 577)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((230 < hpos and hpos < 245) and (541 < vpos and vpos < 549)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((244 < hpos and hpos < 252) and (562 < vpos and vpos < 570)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((244 < hpos and hpos < 252) and (548 < vpos and vpos < 556)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
--t
	if ((258 < hpos and hpos < 294) and (569 < vpos and vpos < 577)) then
  		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((272 < hpos and hpos < 280) and (541 < vpos and vpos < 570)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
--r
	if ((300 < hpos and hpos < 322) and (569 < vpos and vpos < 577)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((300 < hpos and hpos < 308) and (541 < vpos and vpos < 570)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((307 < hpos and hpos < 322) and (555 < vpos and vpos < 563)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((321 < hpos and hpos < 329) and (562 < vpos and vpos < 570)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((314 < hpos and hpos < 322) and (548 < vpos and vpos < 556)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((321 < hpos and hpos < 329) and (541 < vpos and vpos < 549)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
--o
	if ((335 < hpos and hpos < 343) and (548 < vpos and vpos < 570)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((342 < hpos and hpos < 357) and (541 < vpos and vpos < 549)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((342 < hpos and hpos < 357) and (569 < vpos and vpos < 577)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((356 < hpos and hpos < 364) and (548 < vpos and vpos < 570)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
--j
	if ((167 < hpos and hpos < 175) and (479 < vpos and vpos < 487)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((174 < hpos and hpos < 189) and (472 < vpos and vpos < 480)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((188 < hpos and hpos < 196) and (479 < vpos and vpos < 508)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
--u
	if ((202 < hpos and hpos < 210) and (479 < vpos and vpos < 508)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((209 < hpos and hpos < 224) and (472 < vpos and vpos < 480)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((223 < hpos and hpos < 231) and (479 < vpos and vpos < 508)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
--m
	if ((237 < hpos and hpos < 245) and (472 < vpos and vpos < 508)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((244 < hpos and hpos < 252) and (493 < vpos and vpos < 501)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((251 < hpos and hpos < 259) and (486 < vpos and vpos < 494)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((258 < hpos and hpos < 266) and (493 < vpos and vpos < 501)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((265 < hpos and hpos < 273) and (472 < vpos and vpos < 508)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
--p
	if ((279 < hpos and hpos < 287) and (472 < vpos and vpos < 508)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((286 < hpos and hpos < 301) and (500 < vpos and vpos < 508)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((286 < hpos and hpos < 301) and (486 < vpos and vpos < 494)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
	if ((300 < hpos and hpos < 308) and (493 < vpos and vpos < 501)) then
		r<=(others=> '0');
      g<=(others=> '0');
      b<=(others=> '1');
	end if;
end if; -- end startscreen code

--score displayed as 888 (score_third, score_second, score_first)
--score_first seven segement 
if ((635 < vpos and vpos < 640) and (261 < hpos and hpos < 274))  and (score_first = 0 or score_first = 2 or score_first = 3 or score_first = 5 or score_first = 6 or score_first = 7 or score_first = 8 or score_first = 9)  then --uppermid
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((623 < vpos and vpos < 636) and (257 < hpos and hpos < 262))  and (score_first = 0 or score_first = 4 or score_first = 5 or score_first = 6 or score_first = 8 or score_first = 9)  then --upperleft
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((623 < vpos and vpos < 636) and (273 < hpos and hpos < 278))  and (score_first = 0 or score_first = 1 or score_first = 2 or score_first = 3 or score_first = 4 or score_first = 7 or score_first = 8 or score_first = 9)  then  --upperright
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((619 < vpos and vpos < 624) and (261 < hpos and hpos < 274))  and (score_first = 2 or score_first = 3 or score_first = 4 or score_first = 5 or score_first = 6 or score_first = 8 or score_first = 9)  then --mid
	r <= (others => '1'); 
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((607 < vpos and vpos < 620) and (257 < hpos and hpos < 262))  and (score_first = 0 or score_first = 2 or score_first = 6 or score_first = 8)  then --lowerleft
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((607 < vpos and vpos < 620) and (273 < hpos and hpos < 278))  and (score_first = 0 or score_first = 1 or score_first = 3 or score_first = 4 or score_first = 5 or score_first = 6 or score_first = 7 or score_first = 8 or score_first = 9)  then --lowerright
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((603 < vpos and vpos < 608) and (261 < hpos and hpos < 274))  and (score_first  = 0 or score_first = 2 or score_first = 3 or score_first = 5 or score_first = 6 or score_first = 8 or score_first = 9)  then --lowermid
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;

--score_second seven segement
if ((635 < vpos and vpos < 640) and (261-28 < hpos and hpos < 274-28))  and (score_second = 0 or score_second = 2 or score_second = 3 or score_second = 5 or score_second = 6 or score_second = 7 or score_second = 8 or score_second = 9)  then --uppermid
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((623 < vpos and vpos < 636) and (257-28 < hpos and hpos < 262-28))  and (score_second = 0 or score_second = 4 or score_second = 5 or score_second = 6 or score_second = 8 or score_second = 9)  then --upperleft
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((623 < vpos and vpos < 636) and (273-28 < hpos and hpos < 278-28))  and (score_second = 0 or score_second = 1 or score_second = 2 or score_second = 3 or score_second = 4 or score_second = 7 or score_second = 8 or score_second = 9)  then  --upperright
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((619 < vpos and vpos < 624) and (261-28 < hpos and hpos < 274-28))  and (score_second = 2 or score_second = 3 or score_second = 4 or score_second = 5 or score_second = 6 or score_second = 8 or score_second = 9)  then --mid
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((607 < vpos and vpos < 620) and (257-28 < hpos and hpos < 262-28))  and (score_second = 0 or score_second = 2 or score_second = 6 or score_second = 8)  then --lowerleft
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((607 < vpos and vpos < 620) and (273-28 < hpos and hpos < 278-28))  and (score_second = 0 or score_second = 1 or score_second = 3 or score_second = 4 or score_second = 5 or score_second = 6 or score_second = 7 or score_second = 8 or score_second = 9)  then --lowerright
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((603 < vpos and vpos < 608) and (261-28 < hpos and hpos < 274-28))  and (score_second = 0 or score_second = 2 or score_second = 3 or score_second = 5 or score_second = 6 or score_second = 8 or score_second = 9)  then --lowermid
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;

--score_third seven segement
if ((635 < vpos and vpos < 640) and (261-56 < hpos and hpos < 274-56))  and (score_third = 0 or score_third = 2 or score_third = 3 or score_third = 5 or score_third = 6 or score_third = 7 or score_third = 8 or score_third = 9)  then --uppermid
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((623 < vpos and vpos < 636) and (257-56 < hpos and hpos < 262-56))  and (score_third = 0 or score_third = 4 or score_third = 5 or score_third = 6 or score_third = 8 or score_third = 9)  then --upperleft
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((623 < vpos and vpos < 636) and (273-56 < hpos and hpos < 278-56))  and (score_third = 0 or score_third = 1 or score_third = 2 or score_third = 3 or score_third = 4 or score_third = 7 or score_third = 8 or score_third = 9)  then  --upperright
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((619 < vpos and vpos < 624) and (261-56 < hpos and hpos < 274-56))  and (score_third = 2 or score_third = 3 or score_third = 4 or score_third = 5 or score_third = 6 or score_third = 8 or score_third = 9)  then --mid
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((607 < vpos and vpos < 620) and (257-56 < hpos and hpos < 262-56))  and (score_third = 0 or score_third = 2 or score_third = 6 or score_third = 8)  then --lowerleft
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((607 < vpos and vpos < 620) and (273-56 < hpos and hpos < 278-56))  and (score_third = 0 or score_third = 1 or score_third = 3 or score_third = 4 or score_third = 5 or score_third = 6 or score_third = 7 or score_third = 8 or score_third = 9)  then --lowerright
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;
if ((603 < vpos and vpos < 608) and (261-56 < hpos and hpos < 274-56))  and (score_third = 0 or score_third = 2 or score_third = 3 or score_third = 5 or score_third = 6 or score_third = 8 or score_third = 9)  then --lowermid
	r <= (others => '1');
	g <= (others => '1');
	b <= (others => '1');
end if;



end process; 


-- counters for the platform positions
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
		--else
			--... -- no else
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
			--else 
			--	... -- no else
			end if;
	--	else 
		--	... -- no else
		end if;

		if vpos = 0 and hpos = 0 then
			county <= 0;
			countx <= 0;
			countypixel <= 0;
			countxpixel <= 0;
	--	else
	--		... -- no else
		end if;
	--else
--		... -- no else
	end if;
end if;

end process;

end behaviour;
