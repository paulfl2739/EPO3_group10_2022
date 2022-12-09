library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of platform is
signal platformvector: std_logic_vector(7 downto 0);
type statetype is (begin_screen, play_screen); -- state of the machine when you begin 
signal state, new_state: statetype;
begin

lbl1: process(reset,clk)
begin
	if(rising_edge(clk) and reset = '1') then
		state <= begin_screen;
	elsif(start = '1') then
		state <= play_screen;  --when start button has been clickd go to play_state
		
			
		end if;
	end process; 
lbl2: process(state, reset) 
begin
	case state is
	when begin_screen => 				--state of the beginscreen
		platformvector <= "11111111";
 	
	when play_screen =>
		platformvector <= "11111111"; 
	end  case;
end process;
end architecture behaviour;
