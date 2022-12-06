library ieee;
use ieee.std_logic_1164.all;
use iee.numeric_std.all;

entity rom is
    port(address : in  std_logic_vector(1 downto 0);
         data    : out std_logic_vector(15 downto 0));
end ram;
architecture behaviour of rom is
begin
    with address select data <=
        "0010001000001000" when "00", -- ctrl3 register
        "0010000001001111" when "01", -- ctrl1 register
        "0101001000000000" when others; -- xhigh register
end behaviour;