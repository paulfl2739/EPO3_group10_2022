library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity driver is
    port(
        enable       : in  std_logic;   --every time enable is pulled high, one transmission cycle is executed.
        clk          : in  std_logic;   --25MHz chip clock
        reset        : in  std_logic;   --Meant to be pulled high at the beginning
        spc_clk      : in  std_logic;   --<10 MHz clk Rising edge synced to falling edge of clk, falling edge sinced to rising edge of clk.
        sdi_in       : in  std_logic_vector(15 downto 0); --sequence of sdi bits needed for the current transmission cycle
        sdo          : in  std_logic;   --Data output from gyroscope

        sdi          : out std_logic;   --the sequence of bits sent to the chip for proper readout
        spc          : out std_logic;   --max 10MHz 
        cs           : out std_logic;   --when low, data is transmitted
        gyro_data    : out std_logic_vector(7 downto 0); --neat vector containing angular data
        communicated   : out std_logic;   --pulled high whenever gyro_data is correctly written
        prev_spc_clk : out std_logic
    );
end entity driver;

architecture behaviour of driver is

    type configuration_state is (reset_state, waiting, start_transmission, ms_state, address_0, address_1, address_2, address_3, address_4, address_5, data_7_read, data_7_exit, data_6_read, data_6_exit, data_5_read, data_5_exit, data_4_read, data_4_exit, data_3_read, data_3_exit, data_2_read, data_2_exit, data_1_read, data_1_exit, data_0_read, data_0_exit);

    signal state, new_state:			configuration_state;
    signal next_gyro_data, this_gyro_data:	std_logic_vector(7 downto 0);

    -- we need the gyro data to be stable for a whole FSM cycle. 
    signal update_external_output : std_logic;

begin

    process(update_external_output)
    begin
        if(update_external_output'event and update_external_output = '1') then
            gyro_data <= next_gyro_data; 
        end if;
    end process;

        
    process(clk, reset, next_gyro_data)  
    begin
        if (reset = '1') then
            this_gyro_data <= (others => '0');
        else
            if (clk'event and clk = '1') then
                this_gyro_data <= next_gyro_data;
            end if;
        end if;
    end process;

    process(clk, reset, spc_clk)
    begin
        if (reset = '1') then
            state        <= reset_state;
            prev_spc_clk <= '0';
        else
            if (clk'event and clk = '1') then
                state        <= new_state;
                prev_spc_clk <= spc_clk;
            end if;

        end if;
    end process;

    process(state, enable, spc_clk, prev_spc_clk, sdi_in)
    begin
        case state is
            when reset_state =>
                cs  <= '1';
                spc <= '1';

                sdi            <= '0';
                next_gyro_data <= (others => '0');
                communicated     <= '1';

                if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then --remember spc clk value, old value 1 new value 0 

                    new_state <= start_transmission; --go to start transmission when spc_clk 1 -> 0, 
                else
                    new_state <= reset_state;
                end if;
                update_external_output <= '0';

            when start_transmission =>
                cs  <= '0';
                spc <= spc_clk;

                sdi            <= sdi_in(15);
                next_gyro_data <= (others => '0');
                communicated     <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= ms_state;
                end if;
                update_external_output <= '0';

            when ms_state =>
                cs  <= '0';
                spc <= spc_clk;

                sdi            <= sdi_in(14);
                next_gyro_data <= (others => '0');
                communicated     <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= address_5;
                end if;
                update_external_output <= '0';

            when address_5 =>
                cs  <= '0';
                spc <= spc_clk;

                sdi            <= sdi_in(13);
                next_gyro_data <= (others => '0');
                communicated     <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= address_4;
                end if;
                update_external_output <= '0';

            when address_4 =>
                cs  <= '0';
                spc <= spc_clk;

                sdi            <= sdi_in(12);
                next_gyro_data <= (others => '0');
                communicated     <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= address_3;
                end if;
                update_external_output <= '0';

            when address_3 =>
                cs  <= '0';
                spc <= spc_clk;

                sdi            <= sdi_in(11);
                next_gyro_data <= (others => '0');
                communicated     <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= address_2;
                end if;
                update_external_output <= '0';

            when address_2 =>
                cs  <= '0';
                spc <= spc_clk;

                sdi            <= sdi_in(10);
                next_gyro_data <= (others => '0');
                communicated     <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= address_1;
                end if;
                update_external_output <= '0';

            when address_1 =>
                cs  <= '0';
                spc <= spc_clk;

                sdi            <= sdi_in(9);
                next_gyro_data <= (others => '0');
                communicated     <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= address_0;
                end if;
                update_external_output <= '0';

            when address_0 =>
                cs  <= '0';
                spc <= spc_clk;

                sdi            <= sdi_in(8);
                next_gyro_data <= (others => '0');
                communicated     <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= data_7_read;
                end if;
                update_external_output <= '0';

            when data_7_read =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(7);

                next_gyro_data(7) <= sdo;
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);

                communicated <= '0';

                if (spc_clk = '1' and prev_spc_clk = '0') then
                    new_state <= data_7_exit;
                end if;
                update_external_output <= '0';

            when data_7_exit =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(7);

                communicated <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= data_6_read;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_6_read =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(6);

                communicated <= '0';

                if (spc_clk = '1' and prev_spc_clk = '0') then
                    new_state <= data_6_exit;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= sdo;
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_6_exit =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(6);

                communicated <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= data_5_read;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_5_read =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(5);

                communicated <= '0';

                if (spc_clk = '1' and prev_spc_clk = '0') then
                    new_state <= data_5_exit;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= sdo;
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_5_exit =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(5);

                communicated <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= data_4_read;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_4_read =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(4);

                communicated <= '0';

                if (spc_clk = '1' and prev_spc_clk = '0') then
                    new_state <= data_4_exit;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= sdo;
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_4_exit =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(4);

                communicated <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= data_3_read;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_3_read =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(3);

                communicated <= '0';

                if (spc_clk = '1' and prev_spc_clk = '0') then
                    new_state <= data_3_exit;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= sdo;
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_3_exit =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(3);

                communicated <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= data_2_read;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_2_read =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(2);

                communicated <= '0';

                if (spc_clk = '1' and prev_spc_clk = '0') then
                    new_state <= data_2_exit;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= sdo;
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_2_exit =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(2);

                communicated <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= data_1_read;
                end if;
                update_external_output <= '0';

            when data_1_read =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(1);

                communicated <= '0';

                if (spc_clk = '1' and prev_spc_clk = '0') then
                    new_state <= data_1_exit;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= sdo;
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_1_exit =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(1);

                communicated <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= data_0_read;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when data_0_read =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(0);

                communicated <= '0';

                if (spc_clk = '1' and prev_spc_clk = '0') then
                    new_state <= data_0_exit;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= sdo;
                update_external_output <= '0';

            when data_0_exit =>
                cs  <= '0';
                spc <= spc_clk;

                sdi <= sdi_in(0);

                communicated <= '0';

                if (spc_clk = '0' and prev_spc_clk = '1') then
                    new_state <= waiting;
                end if;

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);
                update_external_output <= '0';

            when waiting =>             --gyro_data must be remebered from previous states, thus it is undefined here
                cs  <= '1';
                spc <= '1';

                sdi        <= '0';
                communicated <= '1';

                next_gyro_data(7) <= this_gyro_data(7);
                next_gyro_data(6) <= this_gyro_data(6);
                next_gyro_data(5) <= this_gyro_data(5);
                next_gyro_data(4) <= this_gyro_data(4);
                next_gyro_data(3) <= this_gyro_data(3);
                next_gyro_data(2) <= this_gyro_data(2);
                next_gyro_data(1) <= this_gyro_data(1);
                next_gyro_data(0) <= this_gyro_data(0);

                if (enable = '1' and (spc_clk = '0' and prev_spc_clk = '1')) then --remember spc clk value, old value 1 new value 0 

                    new_state <= start_transmission;
                else
                    new_state <= waiting;
                end if;

                update_external_output <= '1';

        end case;
    end process;
end architecture behaviour;

