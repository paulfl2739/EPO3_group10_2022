library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_read is
    port(spi_clk : in  std_logic;
         s1, s0  : in  std_logic;
         data    : out std_logic);
end entity data_read;

architecture structural of data_read is
    signal reading    : std_logic;      -- if looping through output
    signal ctrl3      : std_logic_vector(15 downto 0);
    signal ctrl1      : std_logic_vector(15 downto 0);
    signal xhigh      : std_logic_vector(15 downto 0);
    signal current    : std_logic_vector(15 downto 0);
    type bit_num is (waiting, b15, b14, b13, b12, b11, b10, b9, b8, b7, b6, b5, b4, b3, b2, b1, b0);
    signal this_state : bit_num;
    signal next_state : bit_num;
begin

    process(spi_clk, next_state)
    begin
        if (falling_edge(spi_clk)) then
            this_state <= next_state;
        end if;
    end process;

    process(s1, s0)
    begin
        if (s1 = '0' and s0 = '0') then --ctrl3
            current(0)  <= ctrl3(0);
            current(1)  <= ctrl3(1);
            current(2)  <= ctrl3(2);
            current(3)  <= ctrl3(3);
            current(4)  <= ctrl3(4);
            current(5)  <= ctrl3(5);
            current(6)  <= ctrl3(6);
            current(7)  <= ctrl3(7);
            current(8)  <= ctrl3(8);
            current(9)  <= ctrl3(9);
            current(10) <= ctrl3(10);
            current(11) <= ctrl3(11);
            current(12) <= ctrl3(12);
            current(13) <= ctrl3(13);
            current(14) <= ctrl3(14);
            current(15) <= ctrl3(15);
        elsif (s1 = '0' and s0 = '1') then --ctrl1
            current(0)  <= ctrl1(0);
            current(1)  <= ctrl1(1);
            current(2)  <= ctrl1(2);
            current(3)  <= ctrl1(3);
            current(4)  <= ctrl1(4);
            current(5)  <= ctrl1(5);
            current(6)  <= ctrl1(6);
            current(7)  <= ctrl1(7);
            current(8)  <= ctrl1(8);
            current(9)  <= ctrl1(9);
            current(10) <= ctrl1(10);
            current(11) <= ctrl1(11);
            current(12) <= ctrl1(12);
            current(13) <= ctrl1(13);
            current(14) <= ctrl1(14);
            current(15) <= ctrl1(15);
        else                            -- xhigh
            current(0)  <= xhigh(0);
            current(1)  <= xhigh(1);
            current(2)  <= xhigh(2);
            current(3)  <= xhigh(3);
            current(4)  <= xhigh(4);
            current(5)  <= xhigh(5);
            current(6)  <= xhigh(6);
            current(7)  <= xhigh(7);
            current(8)  <= xhigh(8);
            current(9)  <= xhigh(9);
            current(10) <= xhigh(10);
            current(11) <= xhigh(11);
            current(12) <= xhigh(12);
            current(13) <= xhigh(13);
            current(14) <= xhigh(14);
            current(15) <= xhigh(15);
        end if;
    end process;

    process(next_state, s1, s0)
    begin
        case next_state is
            when waiting =>
                if (s1'event or s0'event) then
                    next_state <= b15;
                else
                    next_state <= waiting;
                end if;
            when b15 =>
                data       <= current(15);
                next_state <= b14;

            when b14 =>
                data       <= current(14);
                next_state <= b13;

            when b13 =>
                data       <= current(13);
                next_state <= b12;

            when b12 =>
                data       <= current(12);
                next_state <= b11;

            when b11 =>
                data       <= current(11);
                next_state <= b10;

            when b10 =>
                data       <= current(10);
                next_state <= b9;

            when b9 =>
                data       <= current(9);
                next_state <= b8;

            when b8 =>
                data       <= current(8);
                next_state <= b7;

            when b7 =>
                data       <= current(7);
                next_state <= b6;

            when b6 =>
                data       <= current(6);
                next_state <= b5;

            when b5 =>
                data       <= current(5);
                next_state <= b4;

            when b4 =>
                data       <= current(4);
                next_state <= b3;

            when b3 =>
                data       <= current(3);
                next_state <= b2;

            when b2 =>
                data       <= current(2);
                next_state <= b1;

            when b1 =>
                data       <= current(1);
                next_state <= b0;

            when b0 =>
                data       <= current(0);
                next_state <= waiting;
        end case;
    end process;

    ctrl3(0)  <= 0;
    ctrl3(1)  <= 0;
    ctrl3(2)  <= 1;
    ctrl3(3)  <= 0;
    ctrl3(4)  <= 0;
    ctrl3(5)  <= 0;
    ctrl3(6)  <= 1;
    ctrl3(7)  <= 0;
    ctrl3(8)  <= 0;
    ctrl3(9)  <= 0;
    ctrl3(10) <= 0;
    ctrl3(11) <= 0;
    ctrl3(12) <= 1;
    ctrl3(13) <= 0;
    ctrl3(14) <= 0;
    ctrl3(15) <= 0;

    ctrl1(0)  <= 0;
    ctrl1(1)  <= 0;
    ctrl1(2)  <= 1;
    ctrl1(3)  <= 0;
    ctrl1(4)  <= 0;
    ctrl1(5)  <= 0;
    ctrl1(6)  <= 0;
    ctrl1(7)  <= 0;
    ctrl1(8)  <= 0;
    ctrl1(9)  <= 1;
    ctrl1(10) <= 0;
    ctrl1(11) <= 0;
    ctrl1(12) <= 1;
    ctrl1(13) <= 1;
    ctrl1(14) <= 1;
    ctrl1(15) <= 1;

    xhigh(0)  <= 0;
    xhigh(1)  <= 1;
    xhigh(2)  <= 0;
    xhigh(3)  <= 1;
    xhigh(4)  <= 0;
    xhigh(5)  <= 0;
    xhigh(6)  <= 1;
    xhigh(7)  <= 0;
    xhigh(8)  <= 0;
    xhigh(9)  <= 0;
    xhigh(10) <= 0;
    xhigh(11) <= 0;
    xhigh(12) <= 0;
    xhigh(13) <= 0;
    xhigh(14) <= 0;
    xhigh(15) <= 0;

end architecture structural;
