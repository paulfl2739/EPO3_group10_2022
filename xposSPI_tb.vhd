library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity xposSPI_tb is
end entity xposSPI_tb;

architecture behavioral of xposSPI_tb is 
    component xposSPI is 
        port(   clk : in std_logic; 
                speed : in std_logic_vector(7 downto 0);
                position : out std_logic_vector(8 downto 0));
    end component xposSPI;

    signal sig_clk : std_logic;
    signal sig_speed : std_logic_vector(7 downto 0);
    signal sig_position : std_logic_vector(8 downto 0);

begin
    sig_clk <=
		'1' after 0 ns,
		'0' after 2 ns when sig_clk /= '0' else '1' after 2 ns;
    
    sig_speed <= 
        '00000000' after 0 ns,-- compiler error
        '00000001' after 1 ns,
        '00010001' after 3 ns,
        '00101101' after 5 ns,
        '11111111' after 7 ns,
        '00000000' after 9 ns,
        '10011011' after 11 ns,
        '00000000' after 15 ns;
        
    
lbl1: xposSPI port map(
        clk => sig_clk,
        speed => sig_speed,
        position => sig_position);

end architecture behavioral;