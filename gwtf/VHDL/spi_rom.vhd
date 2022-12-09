   library ieee;
   use ieee.std_logic_1164.all;
   use ieee.numeric_std.all;

entity spi_rom is
   port(address  : in  std_logic_vector(2 downto 0);
        spi_data : out std_logic_vector(15 downto 0));
end spi_rom;

