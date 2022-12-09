library IEEE;
use IEEE.std_logic_1164.ALL;


architecture high_edgedetector_rtl of high_edgedetec is

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
