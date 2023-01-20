library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity determine_position is
    port(   clk         : in std_logic; --25 MHz internal 
            reset       : in std_logic;

            frame_passed: in std_logic; -- '1' when frame has passed for 1 clock cycle
            collision   : in std_logic; -- from VGA, duration not very important
            x_velocity   : in std_logic_vector(7 downto 0); -- from SPI

            x_position  : out std_logic_vector(8 downto 0);
            y_position  : out std_logic_vector(9 downto 0));
end entity determine_position;

architecture behavioral of determine_position is

    signal current_y_vel, next_y_vel1, next_y_vel2, sum_y_vel : signed;
    signal current_y_pos, next_y_pos, sum_y_pos: signed;

    signal next_x_pos1, next_x_pos2, current_x_pos, sum_x_pos, overflow_sum_x_pos: signed;

    begin

sum_y_vel <= current_y_vel -375; -- '-375' is 'gravitational' acceleration
next_y_vel1 <= sum_y_vel when (frame_passed = '1') else current_y_vel;
next_y_vel2 <= (1500) when (collision = '1') else next_y_vel1;

y_velocity_latch: process(clk, reset, next_y_vel)
begin
    if(rising_edge(clk)) then
        if(reset = '1') then
            current_y_vel <= 0;
        else
            current_y_vel <= next_y_vel2;
        end if;
    end if;
end process;

sum_y_pos <= current_y_pos + current_y_vel;
next_y_pos <= sum_y_pos when (frame_passed = '1') else current_y_pos;

y_position_latch: process(clk, reset, next_y_pos)
begin
    if(rising_edge(clk)) then
        if(reset = '1') then
            current_y_pos <= 300; -- start position
        else
            current_y_pos <= next_y_pos;
        end if;
    end if;
end process;

y_position <= std_logic_vector(current_y_pos);

--------------------------
-- Calculate x position --
--------------------------





sum_x_pos <= x_velocity + current_x_pos;

overflow_sum_x <= sum_x_pos-479 when sum_x_pos > 479 else sum_x_pos+479; -- overflow_sum_x is position of x when looped round the screen

next_x_pos1 <= overflow_sum_x when (sum_x_pos > 479 or sum_x_pos < 0) else sum_x_pos;
next_x_pos2 <= next_x_pos1 when (frame_passed = '1') else current_x_pos;
    
x_position_latch: process(clk, reset, next_x)
begin 
    if(rising_edge(clk)) then
        if(reset = '1') then
            current_x_pos <= 240; -- reset x_position
        else
            current_x_pos <= next_x_pos2
        end if;
    end if;
end process;

x_position <= std_logic_vector(current_x_pos);


end architecture behavioral;