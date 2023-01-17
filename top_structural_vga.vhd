library ieee;
use ieee.std_logic_1164.all;

architecture structural of top_vga_entity is
component vga_platforms
port(    clk   : in  std_logic;
        reset : in  std_logic;
        lfsr  : in  std_logic_vector(255 downto 0);
        x_logic : in  std_logic_vector (8 downto 0);
        y_logic : in  std_logic_vector (9 downto 0);
    death : in std_logic;
    offset_logic : in std_logic_vector (4 downto 0); 
    frame_count : out std_logic;
    collision : out std_logic;
        r     : out std_logic_vector (3 downto 0);
        g     : out std_logic_vector (3 downto 0);
        b     : out std_logic_vector (3 downto 0);
        hsync : out std_logic;
        vsync : out std_logic);
end component;


begin
vt : vga_platforms
port map(
    r => r,
    g => g,
    b => b,
    hsync => hsync,
    vsync => vsync,
    collision => collision,
    death => death,
    offset_logic => offset_logic,
    frame_count => frame_count,
    reset => reset,
    clk => clk,
    lfsr => lfsr,
    x_logic => x_logic,
    y_logic => y_logic
);
    



end structural;
