library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xposSPI is 
    port(
        clk : in std_logic; -- 25 MHz
        speed : in std_logic_vector(7 downto 0); -- data from the gyroscope, degrees per second

        position : out std_logic_vector(8 downto 0));
end entity xposSPI;

architecture behavior of xpos is
    signal new_position : std_logic_vector(8 downto 0);
    signal this_position : std_logic_vector(8 downto 0);

begin  

position <= new_position;
this_position <= new_position;

    process(clk)
    begin
        if(rising_edge(clk)) then
            new_position <= std_logic_vector(to_signed(to_integer(signed(this_position))+to_integer(signed(speed)), 9));
        end if;
    end process;

end architecture;