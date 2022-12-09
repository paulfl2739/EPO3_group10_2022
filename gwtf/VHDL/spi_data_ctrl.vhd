library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity spi_data_ctrl is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
        start_switch : in  std_logic;
        data_ready   : in  std_logic;
        drdy         : in  std_logic;
        enable       : out std_logic;
        sdi_select   : out std_logic_vector(2 downto 0));
end spi_data_ctrl;

