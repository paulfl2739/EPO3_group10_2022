
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of high_edgedetec is

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal UNCONNECTED, reg1 : std_logic;

begin

  g11 : AN2D4BWP7T port map(A1 => reg1, A2 => spc_clk, Z => high_edge);
  reg1_reg : DFD1BWP7T port map(CP => clk, D => spc_clk, Q => UNCONNECTED, QN => reg1);

end synthesised;
