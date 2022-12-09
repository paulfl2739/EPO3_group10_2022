library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity driver is
   port(enable       : in  std_logic;
        clk          : in  std_logic;
        reset        : in  std_logic;
        spc_clk      : in  std_logic;
        edge         : in  std_logic;
        high_edge    : in  std_logic;
        sdi_in       : in  std_logic_vector(15 downto 0);
        sdo          : in  std_logic;
        sdi          : out std_logic;
        spc          : out std_logic;
        cs           : out std_logic;
        cycle        : out std_logic_vector(2 downto 0);
        gyro_data    : out std_logic_vector(7 downto 0);
        data_ready   : out std_logic;
        prev_spc_clk : out std_logic);
end driver;

