library ieee;
use ieee.std_logic_1164.all;

entity hsyncvsync_for_spi_tb is
end entity hsyncvsync_for_spi_tb;

architecture behavioral of hsyncvsync_for_spi_tb is
    component hvsyncSimulator is 
    port (
        clk : in std_logic;
        reset: in std_logic;
        sixtyHz : out std_logic);
    end component hvsyncSimulator;

    signal sig_clk, sig_reset,sig_sixtyHz : std_logic;

begin

sig_clk <=  '1' after 0 ns,
        '0' after 20 ns when sig_clk /= '0' else '1' after 20 ns;

sig_reset <= '1' after 0 ns,
    '0' after 30 ns;

lbl: hvsyncSimulator port map(
        clk=> sig_clk,
        reset => sig_reset,
        sixtyHz => sig_sixtyHz);

end architecture behavioral;