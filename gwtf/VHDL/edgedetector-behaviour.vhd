library IEEE;
use IEEE.std_logic_1164.ALL;

architecture edgedetector_rtl of edgedetector is

   signal reg1 :std_logic;

begin
reg: process(clk)
begin
   if (clk'event and clk = '1') then
      reg1  <= spc_clk;
  end if;
end process;

edge <= (reg1 and (not spc_clk));

end edgedetector_rtl;

