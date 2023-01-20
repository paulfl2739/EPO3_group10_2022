library ieee;
use ieee.std_logic_1164.all;

entity vga_platforms is
   port(clk      : in  std_logic;
--    countx : out integer range 0 to 7:= 0; -- only in entity if we model the siganls
--    county : out integer range 0 to 31 := 0; -- only in entity if we model the siganls
--    countxpixel : out integer range 0 to 60 := 0; -- only in entity if we model the siganls
--    countypixel : out integer range 0 to 20 := 0; -- only in entity if we model the siganls
    r     : out std_logic_vector(3 downto 0);
    g     : out std_logic_vector(3 downto 0);
    b     : out std_logic_vector(3 downto 0);
--    click : in std_logic;-- away when implemented
    reset : in std_logic;
    collision : out std_logic; 
        hsync : out std_logic;
    vsync : out std_logic;
    death : in std_logic;
	 frame_count : out std_logic;
    offset_logic : in std_logic_vector (4 downto 0);
    lfsr : in std_logic_vector(255 downto 0); -- input form game logic for all the places where a platform is 
    x_logic : in std_logic_vector (8 downto 0); -- input from game logic for x position of character
    y_logic : in std_logic_vector (9 downto 0)); -- input from game logic for y position of character 
end vga_platforms;
