
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of edgedetector is

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component CKND0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  signal n_0, reg1 : std_logic;

begin

  g11 : AN2D4BWP7T port map(A1 => reg1, A2 => n_0, Z => edge);
  reg1_reg : DFQD1BWP7T port map(CP => clk, D => spc_clk, Q => reg1);
  g13 : CKND0BWP7T port map(I => spc_clk, ZN => n_0);

end synthesised;
