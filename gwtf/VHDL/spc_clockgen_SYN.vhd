
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of spc_clockgen is

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component EDFKCND0BWP7T
    port(CP, CN, D, E : in std_logic; Q, QN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFKCND1BWP7T
    port(CP, CN, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal state : std_logic_vector(4 downto 0);
  signal UNCONNECTED, n_0, n_1, n_2, n_3 : std_logic;
  signal n_4, n_6, n_7, n_8, n_9 : std_logic;
  signal n_10, n_11, n_12 : std_logic;

begin

  state_reg_4 : DFQD1BWP7T port map(CP => clk, D => n_11, Q => state(4));
  g120 : NR2XD0BWP7T port map(A1 => n_10, A2 => reset, ZN => n_11);
  g122 : AOI22D0BWP7T port map(A1 => n_6, A2 => state(3), B1 => n_8, B2 => state(4), ZN => n_10);
  g123 : OAI32D1BWP7T port map(A1 => state(4), A2 => n_8, A3 => n_2, B1 => state(2), B2 => n_3, ZN => n_9);
  g124 : CKXOR2D1BWP7T port map(A1 => n_6, A2 => state(3), Z => n_7);
  g128 : OR2D4BWP7T port map(A1 => n_4, A2 => state(4), Z => spc_clk);
  state_reg_1 : EDFKCND0BWP7T port map(CP => clk, CN => n_12, D => state(1), E => state(0), Q => UNCONNECTED, QN => state(1));
  g130 : AOI21D0BWP7T port map(A1 => n_8, A2 => state(1), B => n_0, ZN => n_4);
  g126 : NR2XD0BWP7T port map(A1 => n_3, A2 => n_8, ZN => n_6);
  g127 : INVD0BWP7T port map(I => n_3, ZN => n_2);
  g131 : IND2D1BWP7T port map(A1 => state(1), B1 => state(0), ZN => n_3);
  g135 : INVD1BWP7T port map(I => reset, ZN => n_12);
  state_reg_0 : DFKCND1BWP7T port map(CP => clk, CN => n_12, D => n_1, Q => state(0), QN => n_1);
  state_reg_3 : DFKCND1BWP7T port map(CP => clk, CN => n_12, D => n_7, Q => state(3), QN => n_0);
  state_reg_2 : DFKCND1BWP7T port map(CP => clk, CN => n_12, D => n_9, Q => state(2), QN => n_8);

end synthesised;
