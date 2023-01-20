library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity determine_position_tb is
end entity determine_position_tb;

architecture behavioral of determine_position_tb is
    component determine_position is
        port(   clk         : in std_logic; --25 MHz internal 
        reset       : in std_logic;

        frame_passed: in std_logic; -- '1' when frame has passed for 1 clock cycle
        collision   : in std_logic; -- from VGA, duration not very important
        x_velocity   : in std_logic_vector(7 downto 0); -- from SPI

        x_position  : out std_logic_vector(8 downto 0);
        y_position  : out std_logic_vector(9 downto 0));
    end component determine_position;

    signal sig_clk, sig_reset, sig_fp, sig_col : std_logic;
    signal signedxvel : signed;
    signal sig_xvel : std_logic_vector(7 downto 0);
    signal sig_xpos : std_logic_vector(8 downto 0);
    signal sig_ypos : std_logic_vector(9 downto 0);

    begin

sig_clk <= '0' after 0 ns,
            '1' after 20 ns when sig_clk /= '1' else '0';
sig_reset <= '1' after 0 ns,
            '0' after 50 ns;
frame_passed <= '0' after 0 ns, -- 1/60 Hz officially, '1' for 1 clk cycle
                '1' after 500 ns, -- I reduced duration for simulation ease
                '0' after 520 ns,
                '1' after 1020 ns,
                '0' after 1030 ns;

process(sig_clk, sig_xvel)
begin 
    if(rising_edge(sig_clk)) then 
        if(signed(sig_xvel) < 150) then
            signedxvel <= signed(sig_xvel) + 50;
        else
            signedxvel <= signed(sig_xvel) - 50;
        end if;
    end if;
end process;

lbldp: determine_position port map(
    clk => sig_clk,
    reset => sig_reset,
    frame_passed => sig_fp,
    collision => sig_col,
    x_velocity => sig_xvel,
    x_position => sig_xpos,
    y_position => sig_ypos);


end architecture behavioral;