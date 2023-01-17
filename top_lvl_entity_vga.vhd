library ieee;
use ieee.std_logic_1164.all;

entity top_vga_entity is
   port(clk   : in  std_logic;
        reset : in  std_logic;
        lfsr  : in  std_logic_vector(255 downto 0);
        x_logic : in  std_logic_vector (8 downto 0);
        y_logic : in  std_logic_vector (9 downto 0);
    death : in std_logic;
    offset_logic : in std_logic_vector (4 downto 0); 
    collision : out std_logic;
	frame_count : out std_logic;
        r     : out std_logic_vector (3 downto 0);
        g     : out std_logic_vector (3 downto 0);
        b     : out std_logic_vector (3 downto 0);
        hsync : out std_logic;
        vsync : out std_logic);
end top_vga_entity;
