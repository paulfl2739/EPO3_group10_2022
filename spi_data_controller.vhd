library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spi_data_controller is           --This module sends the right sdi bits to the driver, when the driver is done transmitting it sends a communicated signal, which tells this module to send new sdi bits from the rom.
    port(
        clk          : in  std_logic;
        reset        : in  std_logic;
        start_switch : in  std_logic;   --There is a very long (10ms) startup time needed, we do not want to start the spi protocol while the gyro is starting up. 

        communicated   : in  std_logic;   --output from spi driver when new data can be sent/read
        drdy         : in  std_logic;   --output from gyro chip, when chip has calculated new data, this pin is pulled high.

        enable       : out std_logic;   --to turn on/off the drive
        sdi_select   : out std_logic_vector(2 downto 0) --to select the sdi sequence from the rom, depending on which address we need and which data we want to write to the address.
    );
end entity spi_data_controller;

architecture behaviour of spi_data_controller is

    type configuration_state is (reset_state, wait_for_start, ctrl_3, ctrl_3_wait, low_odr, low_odr_wait, ctrl_1, ctrl_1_wait, wait_for_drdy, x_high, x_high_wait);
    signal state, new_state:    configuration_state;

begin

    process(clk, reset)
    begin
        if (reset = '1') then
            state <= reset_state;
        else
            if (clk'event and clk = '1') then
                state <= new_state;
            end if;

        end if;
    end process;

    process(state, communicated, drdy, start_switch)
    begin
        case state is
            when reset_state =>
                enable     <= '0';
                sdi_select <= "001";    --ctrl3 bit sequence is selected 

                new_state <= wait_for_start;

            when wait_for_start =>
                enable     <= '0';
                sdi_select <= "001";

                if (start_switch = '1') then
                    new_state <= ctrl_3;
                else
                    new_state <= wait_for_start;
                end if;

            when ctrl_3 =>
                enable     <= '1';
                sdi_select <= "001";

                if (communicated = '0') then
                    new_state <= ctrl_3_wait;
                else
                    new_state <= ctrl_3;
                end if;

            when ctrl_3_wait =>
                enable     <= '0';
                sdi_select <= "001";

                if (communicated = '1') then
                    new_state <= low_odr;
                else
                    new_state <= ctrl_3_wait;
                end if;

            when low_odr =>
                enable     <= '1';
                sdi_select <= "101";

                if (communicated = '0') then
                    new_state <= low_odr_wait;
                else
                    new_state <= low_odr;
                end if;

            when low_odr_wait =>
                enable     <= '0';
                sdi_select <= "101";

                if (communicated = '1') then
                    new_state <= ctrl_1;
                else
                    new_state <= low_odr_wait;
                end if;

            when ctrl_1 =>
                enable     <= '1';
                sdi_select <= "010";

                if (communicated = '0') then
                    new_state <= ctrl_1_wait;
                else
                    new_state <= ctrl_1;
                end if;

            when ctrl_1_wait =>
                enable     <= '0';
                sdi_select <= "010";

                if (communicated = '1') then
                    new_state <= wait_for_drdy;
                else
                    new_state <= ctrl_1_wait;
                end if;

            when wait_for_drdy =>
                enable     <= '0';
                sdi_select <= "100";

                if (communicated = '1' and drdy = '1') then
                    new_state <= x_high;
                else
                    new_state <= wait_for_drdy;
                end if;

            when x_high =>
                enable     <= '1';
                sdi_select <= "100";

                if (communicated = '0') then
                    new_state <= x_high_wait;
                else
                    new_state <= x_high;
                end if;

            when x_high_wait =>
                enable     <= '0';
                sdi_select <= "100";

                if (communicated = '1') then
                    new_state <= wait_for_drdy;
                else
                    new_state <= x_high_wait;
                end if;
        end case;
    end process;
end architecture behaviour;

