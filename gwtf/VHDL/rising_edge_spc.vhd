library ieee;
use ieee.std_logic_1164.all;

entity high_edgedetector is
   port (
      clk 	     	:in std_logic;
      spc_clk        	:in std_logic;
      high_edge		:out std_logic
   );
end high_edgedetector;

architecture high_edgedetector_rtl of high_edgedetector is

   signal reg1 :std_logic;

begin
reg: process(clk)
begin
   if (clk'event and clk = '1') then
      reg1  <= spc_clk;
  end if;
end process;

high_edge <= ((not reg1) and spc_clk);

end high_edgedetector_rtl;
