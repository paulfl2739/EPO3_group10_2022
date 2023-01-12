library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity up_counter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           frame_passed : in  STD_LOGIC;
           start : in  STD_LOGIC;
           velocity_x : in  signed(7 downto 0);
           x : out  INTEGER range 0 to 480 := 0;
           y : out  INTEGER range 0 to 640 := 0;
           death : out  STD_LOGIC := '0');
end up_counter;

architecture Behavioral of up_counter is

constant gravity : INTEGER := 375;
signal x_position : INTEGER range 0 to 480 := 0;
signal y_position : INTEGER range 0 to 640 := 0;

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                x_position <= 0;
                y_position <= 0;
                death <= '0';
            elsif start = '1' then
                x_position <= 240;
                y_position <= 300;
            elsif frame_passed = '1' then
                if (velocity_x(7) = '1') and (x_position >= 475) then
                    x_position <= to_integer(signed(velocity_x));
                elsif (velocity_x(7) = '0') and (x_position <= 5) then
                    x_position <= 480 - to_integer(signed(velocity_x));
                end if;
                y_position <= (y_position * 1000 - gravity) / 1000;
                if y_position = 0 then
                    death <= '1';
                end if;
            end if;
        end if;
    end process;
    x <= x_position;
    y <= y_position;
end Behavioral;
