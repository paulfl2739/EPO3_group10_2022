library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity determine_position is
    port(   clk         : in std_logic; --25 MHz internal 
            reset       : in std_logic;
            start       : in std_logic; 
            enable      : in std_logic; -- '1' when frame has passed
            collision   : in std_logic; -- from VGA
            xvelocity   : in std_logic_vector(7 downto 0);

            death       : out std_logic;
            x_position  : out std_logic_vector(8 downto 0);
            y_position  : out std_logic_vector(9 downto 0));
end entity determine_position;

architecture behavioral of determine_position is

    signal next_x_pos, current_x_pos, sum_x_pos, loop_sum_x_pos: signed;

    begin

x_position <= current_x

x_position_latch: process(clk, reset, next_x)
begin 
    if(rising_edge(clk)) then
        if(reset = '1') then
            current_x_pos <= 240; -- reset x_position
        else
            next_x_pos <= next_x_pos
        end if;
    end if;
end process;

sum_x_pos <= x_velocity + current_x_pos;

loop_sum_x <= sum_x_pos-479 when sum_x_pos > 479 else sum_x_pos+479; -- loop_sum_x is position of x when looped round the screen

next_x_pos <= loop_sum_x when (sum_x_pos > 479 or sum_x_pos < 0) else sum_x_pos;

        

end architecture behavioral;