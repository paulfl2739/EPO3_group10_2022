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

    signal next_x, current_x : std_logic_vector(8 downto 0);

    begin

process(clk)
begin 
    if(rising_edge(clk)) then
        if(reset = '1') then
            x <= (others => '0');


end architecture behavioral;