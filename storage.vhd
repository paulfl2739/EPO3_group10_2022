   library ieee;
   use ieee.std_logic_1164.all;
   use ieee.numeric_std.all;

   entity spi_rom is
      port(
		address:	in	 std_logic_vector(2 downto 0); --This is the output 'cycle', from main,.
           	spi_data: 	out 	 std_logic_vector(15 downto 0)
	);
   end spi_rom;     

   architecture behaviour of spi_rom is
   begin
      with address select spi_data <=
         "0010001000001000" when "001", --ctrl_3 adress-data
         "0010000000011000" when "010", --ctrl_1 adress-data
         "1010011100000000" when "011", --status adress-nulldata
         "1010100100000000" when "100", --x_high adress-nulldata
	 "0011100100001001" when "101", --low_odr adress-data
         "0000000000000000" when others;
   end behaviour;
